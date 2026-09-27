/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/. */

/* exported VantageMSASync */

/**
 * Vantage 微软账户同步 —— 核心协议模块。
 *
 * 通过 Microsoft identity platform 的 OAuth 2.0 设备码流（device code flow）
 * 登录微软账户，再用 Microsoft Graph API 把浏览器配置备份上传到用户自己
 * OneDrive 的应用私有文件夹（approot，仅本应用与本人可见），并支持下载恢复。
 *
 * 设计约束：
 * - 纯逻辑模块：不依赖任何 Firefox/浏览器全局对象；fetch、sleep、时钟、
 *   凭据存储全部通过构造参数注入，便于在 Node（vm 沙箱）中做单元测试。
 * - 以经典脚本形式打包（jar.mn），在 about:preferences 中通过 <script> 引入，
 *   暴露唯一全局 VantageMSASync 命名空间，供 librewolf.js 使用。
 *
 * 前置条件（由使用者在 pref-pane 中配置）：
 * - 一个 Azure/Entra 应用注册，开启「允许公共客户端流」，
 *   委托权限：User.Read、Files.ReadWrite.AppFolder、offline_access。
 * - 客户端 ID 存入 pref vantage.msaSync.clientId；租户默认 consumers
 *   （个人微软账户），组织账户可改 vantage.msaSync.tenant。
 */

var VantageMSASync = (function () {
  "use strict";

  // ---- 常量 ----

  const MSA_AUTHORITY = "https://login.microsoftonline.com";
  const MSA_GRAPH = "https://graph.microsoft.com/v1.0";
  const DEVICE_CODE_GRANT = "urn:ietf:params:oauth:grant-type:device_code";
  const DEFAULT_SCOPES = "User.Read Files.ReadWrite.AppFolder offline_access";
  const DEFAULT_TENANT = "consumers";

  // OneDrive 应用私有文件夹内的固定文件名
  const BACKUP_ITEM = "vantage-profile.zip";
  const META_ITEM = "vantage-sync-meta.json";

  // Graph 简单上传（PUT :/content）的大小上限，超过须走分片上传会话
  const SIMPLE_UPLOAD_MAX = 4 * 1024 * 1024;
  // 分片大小：必须是 320 KiB 的整数倍（5 MiB = 16 * 320 KiB）
  const CHUNK_SIZE = 5 * 1024 * 1024;
  // 访问令牌到期前提前刷新的余量
  const TOKEN_EXPIRY_MARGIN_MS = 60 * 1000;

  /**
   * 统一错误类型。code 取值：
   * - 本地/配置：config、protocol、cancelled、not_found
   * - 网络与 HTTP：network、http（附 status）
   * - OAuth：authorization_pending、slow_down、expired_token、access_denied、
   *   invalid_grant 等（与服务器返回的 error 字段一致）
   * - 其他认证失败：auth
   */
  class MSASyncError extends Error {
    constructor(code, message, options) {
      super(message);
      this.name = "MSASyncError";
      this.code = code;
      if (options && options.cause !== undefined) {
        this.cause = options.cause;
      }
      if (options && options.status !== undefined) {
        this.status = options.status;
      }
    }
  }

  // ---- 纯函数工具 ----

  // 表单编码（不依赖 URLSearchParams，保证 vm 沙箱可用）
  function encodeForm(params) {
    const parts = [];
    for (const key of Object.keys(params)) {
      const value = params[key];
      if (value === undefined || value === null) {
        continue;
      }
      parts.push(encodeURIComponent(key) + "=" + encodeURIComponent(String(value)));
    }
    return parts.join("&");
  }

  // UTF-8 编码（不依赖 TextEncoder，保证 vm 沙箱可用）
  function utf8Bytes(str) {
    const out = [];
    for (let i = 0; i < str.length; i++) {
      const c = str.charCodeAt(i);
      if (c < 0x80) {
        out.push(c);
      } else if (c < 0x800) {
        out.push(0xc0 | (c >> 6), 0x80 | (c & 0x3f));
      } else if (c >= 0xd800 && c <= 0xdbff) {
        const c2 = i + 1 < str.length ? str.charCodeAt(i + 1) : 0;
        if (c2 >= 0xdc00 && c2 <= 0xdfff) {
          const cp = 0x10000 + ((c & 0x3ff) << 10) + (c2 & 0x3ff);
          out.push(
            0xf0 | (cp >> 18),
            0x80 | ((cp >> 12) & 0x3f),
            0x80 | ((cp >> 6) & 0x3f),
            0x80 | (cp & 0x3f)
          );
          i++;
        } else {
          out.push(0xef, 0xbf, 0xbd); // 孤立高位代理 → U+FFFD
        }
      } else if (c >= 0xdc00 && c <= 0xdfff) {
        out.push(0xef, 0xbf, 0xbd); // 孤立低位代理 → U+FFFD
      } else {
        out.push(0xe0 | (c >> 12), 0x80 | ((c >> 6) & 0x3f), 0x80 | (c & 0x3f));
      }
    }
    return new Uint8Array(out);
  }

  // 尽量解析 JSON 响应体；失败返回 null（fetch 的 body 只能读一次）
  async function safeJson(resp) {
    try {
      return await resp.json();
    } catch (e) {
      return null;
    }
  }

  function httpError(resp, data, prefix) {
    const detail =
      (data && data.error && (data.error.message || data.error.code)) ||
      (data && data.error_description) ||
      "HTTP " + resp.status;
    const message = prefix ? prefix + ": " + detail : detail;
    return new MSASyncError("http", message, { status: resp.status });
  }

  // ---- OAuth 2.0 设备码流 ----

  class MSADeviceCodeFlow {
    constructor(options = {}) {
      this.clientId = String(options.clientId || "").trim();
      this.tenant = String(options.tenant || DEFAULT_TENANT).trim() || DEFAULT_TENANT;
      this.scope = options.scope || DEFAULT_SCOPES;
      this._fetchFn = options.fetchFn || null;
      this._sleepFn = options.sleepFn || null;
      this._nowFn = options.nowFn || null;
    }

    get deviceCodeEndpoint() {
      return MSA_AUTHORITY + "/" + encodeURIComponent(this.tenant) + "/oauth2/v2.0/devicecode";
    }

    get tokenEndpoint() {
      return MSA_AUTHORITY + "/" + encodeURIComponent(this.tenant) + "/oauth2/v2.0/token";
    }

    _now() {
      return this._nowFn ? this._nowFn() : Date.now();
    }

    _sleep(ms) {
      if (this._sleepFn) {
        return this._sleepFn(ms);
      }
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    async _fetch(url, options) {
      const fetchFn = this._fetchFn || (typeof fetch === "function" ? fetch : null);
      if (!fetchFn) {
        throw new MSASyncError("config", "No fetch implementation available");
      }
      try {
        return await fetchFn(url, options);
      } catch (e) {
        throw new MSASyncError("network", "Network request to Microsoft login failed", { cause: e });
      }
    }

    async _postForm(url, params) {
      const resp = await this._fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          Accept: "application/json",
        },
        body: encodeForm(params),
      });
      return { resp, data: await safeJson(resp) };
    }

    // 第一步：申请设备码。返回用户码 / 验证页 / 轮询参数。
    async requestCode() {
      if (!this.clientId) {
        throw new MSASyncError("config", "Missing Application (client) ID");
      }
      const { resp, data } = await this._postForm(this.deviceCodeEndpoint, {
        client_id: this.clientId,
        scope: this.scope,
      });
      if (!resp.ok) {
        // OAuth 错误体（如 unauthorized_client / invalid_client）优先透传错误码
        if (data && typeof data.error === "string" && data.error) {
          throw new MSASyncError(data.error, data.error_description || data.error, {
            status: resp.status,
          });
        }
        throw httpError(resp, data, "Device code request failed");
      }
      if (!data || !data.device_code || !data.user_code || !data.verification_uri) {
        throw new MSASyncError("protocol", "Malformed device code response");
      }
      return {
        deviceCode: data.device_code,
        userCode: data.user_code,
        verificationUri: data.verification_uri,
        verificationUriComplete: data.verification_uri_complete || "",
        expiresIn: Number(data.expires_in) > 0 ? Number(data.expires_in) : 900,
        interval: Number(data.interval) > 0 ? Number(data.interval) : 5,
        message: data.message || "",
      };
    }

    // 单次轮询令牌端点。未授权时抛出带 OAuth error code 的 MSASyncError。
    async pollOnce(deviceCode) {
      if (!deviceCode) {
        throw new MSASyncError("protocol", "Missing device code");
      }
      const { resp, data } = await this._postForm(this.tokenEndpoint, {
        grant_type: DEVICE_CODE_GRANT,
        client_id: this.clientId,
        device_code: deviceCode,
      });
      if (resp.ok && data && data.access_token) {
        return data;
      }
      if (data && typeof data.error === "string" && data.error) {
        throw new MSASyncError(
          data.error,
          data.error_description || data.error
        );
      }
      if (!resp.ok) {
        throw httpError(resp, data, "Token request failed");
      }
      throw new MSASyncError("protocol", "Malformed token response");
    }

    /**
     * 按设备码流规范循环轮询直到拿到令牌：
     * - authorization_pending：继续等待
     * - slow_down：轮询间隔 +5s 后继续
     * - expired_token / access_denied 等：抛出
     * - 超过 expires_in 截止时间：按 expired_token 抛出
     * - isCancelled() 为 true：按 cancelled 抛出
     */
    async waitForToken(info, options = {}) {
      if (!info || !info.deviceCode) {
        throw new MSASyncError("protocol", "Missing device code info");
      }
      const isCancelled = options.isCancelled || (() => false);
      let intervalSec = Math.max(1, info.interval || 5);
      const deadline = this._now() + Math.max(1, info.expiresIn || 900) * 1000;
      for (;;) {
        if (isCancelled()) {
          throw new MSASyncError("cancelled", "Sign-in was cancelled");
        }
        await this._sleep(intervalSec * 1000);
        if (isCancelled()) {
          throw new MSASyncError("cancelled", "Sign-in was cancelled");
        }
        try {
          return await this.pollOnce(info.deviceCode);
        } catch (e) {
          if (e instanceof MSASyncError && e.code === "authorization_pending") {
            // 用户尚未完成登录，继续轮询
          } else if (e instanceof MSASyncError && e.code === "slow_down") {
            intervalSec += 5;
          } else {
            throw e;
          }
        }
        if (this._now() >= deadline) {
          throw new MSASyncError("expired_token", "Device code expired");
        }
      }
    }
  }

  // ---- 令牌管理（含刷新与持久化） ----

  class MSATokenManager {
    constructor(options = {}) {
      if (!options.store) {
        throw new MSASyncError("config", "Token store is required");
      }
      this.clientId = String(options.clientId || "").trim();
      this.tenant = String(options.tenant || DEFAULT_TENANT).trim() || DEFAULT_TENANT;
      this.scope = options.scope || DEFAULT_SCOPES;
      this._fetchFn = options.fetchFn || null;
      this._nowFn = options.nowFn || null;
      this._store = options.store;
      this._state = null;
    }

    get tokenEndpoint() {
      return MSA_AUTHORITY + "/" + encodeURIComponent(this.tenant) + "/oauth2/v2.0/token";
    }

    get signedIn() {
      return !!(this._state && this._state.refreshToken);
    }

    // 登录账户信息（displayName / userPrincipalName / mail），可能为 null
    get account() {
      return this._state ? this._state.account || null : null;
    }

    _now() {
      return this._nowFn ? this._nowFn() : Date.now();
    }

    async _fetch(url, options) {
      const fetchFn = this._fetchFn || (typeof fetch === "function" ? fetch : null);
      if (!fetchFn) {
        throw new MSASyncError("config", "No fetch implementation available");
      }
      try {
        return await fetchFn(url, options);
      } catch (e) {
        throw new MSASyncError("network", "Network request to Microsoft login failed", { cause: e });
      }
    }

    // 从 store 恢复会话；返回是否处于登录态
    async load() {
      let raw = null;
      try {
        raw = await this._store.load();
      } catch (e) {
        raw = null;
      }
      this._state = raw && typeof raw === "object" && raw.refreshToken ? raw : null;
      return this.signedIn;
    }

    async persist() {
      if (!this._state) {
        return;
      }
      await this._store.save(this._state);
    }

    // 设备码流成功后写入令牌；refresh_token 可能不随每次响应返回，保留旧值
    setFromTokenResponse(tokenResponse, account) {
      if (!tokenResponse || !tokenResponse.access_token) {
        throw new MSASyncError("protocol", "Malformed token response");
      }
      const prev = this._state || {};
      const expiresIn = Number(tokenResponse.expires_in) > 0 ? Number(tokenResponse.expires_in) : 3600;
      this._state = {
        accessToken: tokenResponse.access_token,
        refreshToken: tokenResponse.refresh_token || prev.refreshToken || "",
        expiresAt: this._now() + expiresIn * 1000,
        scope: tokenResponse.scope || this.scope,
        account: account !== undefined ? account : prev.account || null,
      };
    }

    setAccount(account) {
      if (this._state) {
        this._state.account = account || null;
      }
    }

    async getAccessToken() {
      if (!this.signedIn) {
        throw new MSASyncError("auth", "Not signed in");
      }
      if (this._state.expiresAt - TOKEN_EXPIRY_MARGIN_MS > this._now()) {
        return this._state.accessToken;
      }
      await this.refresh();
      return this._state.accessToken;
    }

    async refresh() {
      if (!this.signedIn) {
        throw new MSASyncError("auth", "Not signed in");
      }
      if (!this.clientId) {
        throw new MSASyncError("config", "Missing Application (client) ID");
      }
      let resp;
      let data;
      try {
        resp = await this._fetch(this.tokenEndpoint, {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            Accept: "application/json",
          },
          body: encodeForm({
            grant_type: "refresh_token",
            refresh_token: this._state.refreshToken,
            client_id: this.clientId,
            scope: this.scope,
          }),
        });
      } catch (e) {
        throw new MSASyncError("network", "Network request to Microsoft login failed", { cause: e });
      }
      data = await safeJson(resp);
      if (resp.ok && data && data.access_token) {
        this.setFromTokenResponse(data);
        await this.persist();
        return this._state;
      }
      // 刷新令牌失效：清空本地会话，要求重新登录
      if (data && (data.error === "invalid_grant" || data.error === "interaction_required")) {
        await this.clear();
        throw new MSASyncError("auth", data.error_description || data.error);
      }
      if (!resp.ok) {
        throw httpError(resp, data, "Token refresh failed");
      }
      throw new MSASyncError("protocol", "Malformed token response");
    }

    async clear() {
      this._state = null;
      try {
        await this._store.clear();
      } catch (e) {
        // 存储清理失败不阻塞退出登录
      }
    }
  }

  // ---- Microsoft Graph / OneDrive approot 客户端 ----

  class MSAGraphClient {
    constructor(options = {}) {
      if (!options.tokenManager) {
        throw new MSASyncError("config", "tokenManager is required");
      }
      this._tokens = options.tokenManager;
      this._fetchFn = options.fetchFn || null;
      this.chunkSize = options.chunkSize || CHUNK_SIZE;
      this.simpleUploadMax = options.simpleUploadMax || SIMPLE_UPLOAD_MAX;
    }

    async _rawFetch(url, options) {
      const fetchFn = this._fetchFn || (typeof fetch === "function" ? fetch : null);
      if (!fetchFn) {
        throw new MSASyncError("config", "No fetch implementation available");
      }
      try {
        return await fetchFn(url, options);
      } catch (e) {
        throw new MSASyncError("network", "Network request to Microsoft Graph failed", { cause: e });
      }
    }

    // 带 Bearer 令牌的请求；401 时刷新令牌重试一次
    async _fetchWithToken(url, options = {}, allowRetry = true) {
      const token = await this._tokens.getAccessToken();
      const headers = Object.assign({}, options.headers, {
        Authorization: "Bearer " + token,
      });
      const resp = await this._rawFetch(url, Object.assign({}, options, { headers }));
      if (resp.status === 401 && allowRetry) {
        await this._tokens.refresh();
        return this._fetchWithToken(url, options, false);
      }
      return resp;
    }

    _itemUrl(name, suffix) {
      return MSA_GRAPH + "/me/drive/special/approot:/" + name + (suffix || "");
    }

    async getProfile() {
      const resp = await this._fetchWithToken(
        MSA_GRAPH + "/me?$select=displayName,userPrincipalName,mail"
      );
      const data = await safeJson(resp);
      if (!resp.ok) {
        throw httpError(resp, data, "Profile request failed");
      }
      if (!data) {
        throw new MSASyncError("protocol", "Malformed profile response");
      }
      return {
        displayName: data.displayName || "",
        userPrincipalName: data.userPrincipalName || "",
        mail: data.mail || "",
      };
    }

    // 下载文件内容；不存在返回 null
    async downloadFile(name) {
      const resp = await this._fetchWithToken(this._itemUrl(name, ":/content"));
      if (resp.status === 404) {
        return null;
      }
      if (!resp.ok) {
        throw httpError(resp, await safeJson(resp), "Download failed");
      }
      try {
        return new Uint8Array(await resp.arrayBuffer());
      } catch (e) {
        throw new MSASyncError("network", "Failed reading response body", { cause: e });
      }
    }

    // 下载 JSON 文件；不存在返回 null
    async downloadJson(name) {
      const resp = await this._fetchWithToken(this._itemUrl(name, ":/content"));
      if (resp.status === 404) {
        return null;
      }
      if (!resp.ok) {
        throw httpError(resp, await safeJson(resp), "Download failed");
      }
      const data = await safeJson(resp);
      if (!data || typeof data !== "object") {
        throw new MSASyncError("protocol", "Malformed JSON content");
      }
      return data;
    }

    /**
     * 上传文件：小于 simpleUploadMax 用简单上传（PUT :/content），
     * 否则用分片上传会话（createUploadSession + 分片 PUT）。
     */
    async uploadFile(name, bytes, options = {}) {
      if (!(bytes instanceof Uint8Array)) {
        throw new MSASyncError("protocol", "bytes must be a Uint8Array");
      }
      if (bytes.length === 0) {
        throw new MSASyncError("protocol", "Refusing to upload an empty file");
      }
      const contentType = options.contentType || "application/octet-stream";
      const onProgress = options.onProgress || null;
      if (bytes.length < this.simpleUploadMax) {
        const resp = await this._fetchWithToken(this._itemUrl(name, ":/content"), {
          method: "PUT",
          headers: { "Content-Type": contentType },
          body: bytes,
        });
        if (!resp.ok) {
          throw httpError(resp, await safeJson(resp), "Upload failed");
        }
        if (onProgress) {
          onProgress(bytes.length, bytes.length);
        }
        return;
      }
      await this._uploadViaSession(name, bytes, contentType, onProgress);
    }

    async _createUploadSession(name, contentType) {
      const resp = await this._fetchWithToken(this._itemUrl(name, ":/createUploadSession"), {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          item: {
            "@microsoft.graph.conflictBehavior": "replace",
            description: "Vantage profile backup",
          },
        }),
      });
      const data = await safeJson(resp);
      if (!resp.ok) {
        throw httpError(resp, data, "Failed creating upload session");
      }
      if (!data || !data.uploadUrl) {
        throw new MSASyncError("protocol", "Malformed upload session response");
      }
      return { uploadUrl: data.uploadUrl, expirationDateTime: data.expirationDateTime || "" };
    }

    // 会话过期（404）时只重建一次，避免死循环
    async _uploadViaSession(name, bytes, contentType, onProgress) {
      let session = await this._createUploadSession(name, contentType);
      let recreated = false;
      let completed = false;
      try {
        let offset = 0;
        while (offset < bytes.length) {
          const end = Math.min(offset + this.chunkSize, bytes.length);
          const chunk = bytes.subarray(offset, end);
          // uploadUrl 是预授权地址：不带 Authorization，也不做 401 重试
          const resp = await this._rawFetch(session.uploadUrl, {
            method: "PUT",
            headers: {
              "Content-Length": String(chunk.length),
              "Content-Range": "bytes " + offset + "-" + (end - 1) + "/" + bytes.length,
            },
            body: chunk,
          });
          if (resp.status === 200 || resp.status === 201) {
            completed = true;
            if (onProgress) {
              onProgress(bytes.length, bytes.length);
            }
            return;
          }
          if (resp.status === 404 && !recreated) {
            recreated = true;
            session = await this._createUploadSession(name, contentType);
            continue;
          }
          if (resp.status === 202 || resp.status === 308) {
            if (onProgress) {
              onProgress(end, bytes.length);
            }
            offset = end;
            continue;
          }
          throw httpError(resp, await safeJson(resp), "Chunk upload failed");
        }
        throw new MSASyncError("protocol", "Upload session ended without completing the file");
      } finally {
        if (!completed) {
          // 清理未完成的会话，避免 OneDrive 留下残片；失败可忽略
          try {
            await this._rawFetch(session.uploadUrl, { method: "DELETE" });
          } catch (e) {}
        }
      }
    }

    async deleteFile(name) {
      const resp = await this._fetchWithToken(this._itemUrl(name), { method: "DELETE" });
      if (resp.status === 404) {
        return false;
      }
      if (!resp.ok) {
        throw httpError(resp, await safeJson(resp), "Delete failed");
      }
      return true;
    }
  }

  // ---- 高层同步服务 ----

  /**
   * store 接口（由调用方实现，例如 Firefox Login Manager）：
   *   load()        → 之前保存的令牌状态对象或 null
   *   save(state)   → 持久化令牌状态
   *   clear()       → 删除持久化状态
   */
  class MSASyncService {
    constructor(options = {}) {
      if (!options.store) {
        throw new MSASyncError("config", "Token store is required");
      }
      this.clientId = String(options.clientId || "").trim();
      this.tenant = String(options.tenant || DEFAULT_TENANT).trim() || DEFAULT_TENANT;
      this.scope = options.scope || DEFAULT_SCOPES;
      this.tokens = new MSATokenManager(options);
      this.graph = new MSAGraphClient({
        tokenManager: this.tokens,
        fetchFn: options.fetchFn,
        chunkSize: options.chunkSize,
        simpleUploadMax: options.simpleUploadMax,
      });
      this.flow = new MSADeviceCodeFlow(options);
      this._pending = null;
      this._completion = null;
      this._cancelled = false;
    }

    get isConfigured() {
      return !!this.clientId;
    }

    get signedIn() {
      return this.tokens.signedIn;
    }

    get account() {
      return this.tokens.account;
    }

    get hasPendingSignIn() {
      return !!(this._pending && this._completion);
    }

    // 从持久化存储恢复登录态（应用启动 / 设置页打开时调用）
    async restoreSession() {
      return await this.tokens.load();
    }

    /**
     * 发起登录：申请设备码并立即返回给 UI 展示（userCode / verificationUri），
     * 后台开始轮询；结果通过 waitSignIn() 获取，cancelSignIn() 取消。
     */
    async startSignIn() {
      if (!this.isConfigured) {
        throw new MSASyncError("config", "Missing Application (client) ID");
      }
      this._cancelled = false;
      const info = await this.flow.requestCode();
      this._pending = info;
      this._completion = (async () => {
        const tokenResponse = await this.flow.waitForToken(info, {
          isCancelled: () => this._cancelled,
        });
        this.tokens.setFromTokenResponse(tokenResponse);
        // 拉取账户信息用于展示；失败不阻塞登录本身
        let profile = null;
        try {
          profile = await this.graph.getProfile();
        } catch (e) {
          profile = null;
        }
        this.tokens.setAccount(profile);
        await this.tokens.persist();
        return profile;
      })();
      // 调用方稍后才 await；先挂一个空 catch，避免 unhandled rejection
      this._completion.catch(() => {});
      return info;
    }

    async waitSignIn() {
      if (!this._completion) {
        throw new MSASyncError("protocol", "No sign-in in progress");
      }
      return await this._completion;
    }

    cancelSignIn() {
      this._cancelled = true;
    }

    async signOut() {
      this._cancelled = true;
      this._pending = null;
      this._completion = null;
      await this.tokens.clear();
    }

    /**
     * 上传备份：先传 zip 本体，再传元数据（设备 / 时间 / 版本，供恢复时展示）。
     * zip 上传成功、meta 失败时报错——恢复端对 meta 缺失是容忍的。
     */
    async uploadBackup(bytes, meta, onProgress) {
      if (!this.signedIn) {
        throw new MSASyncError("auth", "Not signed in");
      }
      await this.graph.uploadFile(BACKUP_ITEM, bytes, {
        contentType: "application/octet-stream",
        onProgress,
      });
      await this.graph.uploadFile(META_ITEM, utf8Bytes(JSON.stringify(meta || {})), {
        contentType: "application/json",
      });
    }

    // 下载备份；云端没有备份时返回 null。meta 缺失/损坏不影响 zip 本体。
    async downloadBackup() {
      if (!this.signedIn) {
        throw new MSASyncError("auth", "Not signed in");
      }
      const bytes = await this.graph.downloadFile(BACKUP_ITEM);
      if (!bytes) {
        return null;
      }
      let meta = null;
      try {
        meta = await this.graph.downloadJson(META_ITEM);
      } catch (e) {
        meta = null;
      }
      return { bytes, meta };
    }
  }

  return {
    MSASyncError,
    MSADeviceCodeFlow,
    MSATokenManager,
    MSAGraphClient,
    MSASyncService,
    encodeForm,
    utf8Bytes,
    MSA_AUTHORITY,
    MSA_GRAPH,
    DEVICE_CODE_GRANT,
    DEFAULT_SCOPES,
    DEFAULT_TENANT,
    BACKUP_ITEM,
    META_ITEM,
    SIMPLE_UPLOAD_MAX,
    CHUNK_SIZE,
    TOKEN_EXPIRY_MARGIN_MS,
  };
})();
