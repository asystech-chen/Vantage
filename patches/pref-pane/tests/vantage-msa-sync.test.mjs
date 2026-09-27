import { test, describe } from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";
import { fileURLToPath } from "node:url";

// 微软账户同步核心模块（patches/pref-pane/vantage-msa-sync.js）的单元测试。
// 模块是纯逻辑经典脚本（依赖全部注入），这里用 vm 沙箱加载后逐一验证：
// 设备码 OAuth 流、令牌刷新、Graph/OneDrive 上传下载协议与高层服务编排。

const REPO_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "..", "..");
const MODULE_PATH = path.join(REPO_ROOT, "patches", "pref-pane", "vantage-msa-sync.js");

const TOKEN_URL = "https://login.microsoftonline.com/consumers/oauth2/v2.0/token";
const DEVICE_URL = "https://login.microsoftonline.com/consumers/oauth2/v2.0/devicecode";
const GRAPH_APPROOT = "https://graph.microsoft.com/v1.0/me/drive/special/approot:";

const DEVICE_CODE_RESP = {
  device_code: "dev-code-1",
  user_code: "ABC123XY",
  verification_uri: "https://microsoft.com/devicelogin",
  verification_uri_complete: "https://microsoft.com/devicelogin?code=ABC123XY",
  expires_in: 900,
  interval: 5,
  message: "To sign in, use a web browser...",
};

const TOKEN_RESP = {
  access_token: "AT",
  refresh_token: "RT",
  expires_in: 3600,
  token_type: "Bearer",
  scope: "User.Read Files.ReadWrite.AppFolder offline_access",
};

const PROFILE_RESP = {
  displayName: "Test User",
  userPrincipalName: "test@outlook.com",
  mail: null,
};

function loadModule() {
  const src = fs.readFileSync(MODULE_PATH, "utf8");
  // 在当前 realm 中以经典脚本执行（与浏览器 <script> 加载方式一致）：
  // 顶层 var 挂到 globalThis，且与测试共享内建对象（instanceof /
  // deepStrictEqual / Uint8Array 均无跨 realm 问题）。
  vm.runInThisContext(src, { filename: MODULE_PATH });
  assert.ok(globalThis.VantageMSASync, "module must define the VantageMSASync global");
  return { MSA: globalThis.VantageMSASync, win: globalThis };
}

// 用模块所在全局的 Uint8Array 构造字节数组，保证模块内 instanceof 检查通过。
function makeU8(win) {
  return arr => new win.Uint8Array(arr);
}

function jsonResp(status, body) {
  return {
    ok: status >= 200 && status < 300,
    status,
    json: async () => JSON.parse(JSON.stringify(body)),
    text: async () => JSON.stringify(body),
    arrayBuffer: async () => new TextEncoder().encode(JSON.stringify(body)).buffer,
  };
}

function bytesResp(status, bytes) {
  return {
    ok: status >= 200 && status < 300,
    status,
    json: async () => {
      throw new Error("body is not JSON");
    },
    arrayBuffer: async () => Uint8Array.from(bytes).buffer,
  };
}

function oauthError(status, error, description) {
  return jsonResp(status, { error, error_description: description });
}

// 路由式 fake fetch：按 (method, url) 精确匹配 / 正则 / 断言函数匹配，
// 未命中直接抛错（暴露意外请求）。responses 数组按调用顺序弹出。
function makeFetch(routes) {
  const calls = [];
  const fn = async (url, options = {}) => {
    const method = (options.method || "GET").toUpperCase();
    const call = { method, url: String(url), options };
    calls.push(call);
    for (const route of routes) {
      if (route.method && route.method.toUpperCase() !== method) {
        continue;
      }
      const u = route.url;
      const matches =
        typeof u === "function"
          ? u(call.url)
          : u instanceof RegExp
            ? u.test(call.url)
            : call.url === u;
      if (!matches) {
        continue;
      }
      if (route.handler) {
        return await route.handler(call);
      }
      if (route.responses) {
        if (!route.responses.length) {
          throw new Error("route exhausted: " + method + " " + call.url);
        }
        const next = route.responses.shift();
        return typeof next === "function" ? next(call) : next;
      }
      return typeof route.response === "function" ? route.response(call) : route.response;
    }
    throw new Error("unexpected fetch: " + method + " " + call.url);
  };
  fn.calls = calls;
  return fn;
}

function makeClock(start = 1_000_000_000) {
  const clock = { now: start, sleeps: [] };
  clock.nowFn = () => clock.now;
  clock.sleepFn = async ms => {
    clock.sleeps.push(ms);
    clock.now += ms;
  };
  return clock;
}

function makeStore(initial = null) {
  const store = { data: initial ? JSON.parse(JSON.stringify(initial)) : null, saves: [], clears: 0 };
  store.load = async () => (store.data ? JSON.parse(JSON.stringify(store.data)) : null);
  store.save = async state => {
    store.data = JSON.parse(JSON.stringify(state));
    store.saves.push(store.data);
  };
  store.clear = async () => {
    store.data = null;
    store.clears += 1;
  };
  return store;
}

function makeTokenStub(tokens = ["tok"]) {
  const stub = {
    tokens: [...tokens],
    refreshCount: 0,
    signedIn: true,
    async getAccessToken() {
      return stub.tokens.length > 1 ? stub.tokens.shift() : stub.tokens[0];
    },
    async refresh() {
      stub.refreshCount += 1;
    },
  };
  return stub;
}

function signedInState(clock, overrides = {}) {
  return Object.assign(
    {
      accessToken: "AT",
      refreshToken: "RT",
      expiresAt: clock.now + 60 * 60 * 1000,
      account: { displayName: "Test User", userPrincipalName: "test@outlook.com", mail: "" },
    },
    overrides
  );
}

// 断言 Promise 拒绝为 MSASyncError 且 code 匹配（跨 realm，用属性断言）
function rejectsWithCode(promise, code) {
  return assert.rejects(promise, err => {
    assert.equal(err.name, "MSASyncError");
    assert.equal(err.code, code);
    return true;
  });
}

const { MSA, win } = loadModule();
const u8 = makeU8(win);
const {
  MSASyncError,
  MSADeviceCodeFlow,
  MSATokenManager,
  MSAGraphClient,
  MSASyncService,
  encodeForm,
  utf8Bytes,
} = MSA;

// ---------------------------------------------------------------------------

describe("MSASyncError", () => {
  test("carries code, message and optional status/cause", () => {
    const cause = new Error("root");
    const e = new MSASyncError("http", "boom", { status: 503, cause });
    assert.equal(e.name, "MSASyncError");
    assert.equal(e.code, "http");
    assert.equal(e.message, "boom");
    assert.equal(e.status, 503);
    assert.equal(e.cause, cause);
    assert.ok(e instanceof Error);
  });
});

describe("encodeForm", () => {
  test("encodes key/value pairs", () => {
    assert.equal(encodeForm({ a: "1", b: "x" }), "a=1&b=x");
  });

  test("escapes special characters", () => {
    assert.equal(encodeForm({ b: "x y&z=1" }), "b=x%20y%26z%3D1");
  });

  test("skips undefined and null values", () => {
    assert.equal(encodeForm({ a: "1", b: undefined, c: null, d: 2 }), "a=1&d=2");
  });

  test("empty object yields empty string", () => {
    assert.equal(encodeForm({}), "");
  });
});

describe("utf8Bytes", () => {
  test("encodes ASCII", () => {
    assert.deepEqual(Array.from(utf8Bytes("abc")), [0x61, 0x62, 0x63]);
  });

  test("encodes 3-byte CJK characters", () => {
    assert.deepEqual(Array.from(utf8Bytes("中")), [0xe4, 0xb8, 0xad]);
  });

  test("encodes surrogate pairs as 4 bytes", () => {
    // U+1F642
    assert.deepEqual(Array.from(utf8Bytes("\u{1F642}")), [0xf0, 0x9f, 0x99, 0x82]);
  });

  test("replaces lone surrogates with U+FFFD", () => {
    assert.deepEqual(Array.from(utf8Bytes("\uD800")), [0xef, 0xbf, 0xbd]);
    assert.deepEqual(Array.from(utf8Bytes("\uDC00")), [0xef, 0xbf, 0xbd]);
  });

  test("round-trips through TextDecoder", () => {
    const text = 'Vantage 备份 {"a":1}';
    assert.equal(new TextDecoder().decode(Uint8Array.from(utf8Bytes(text))), text);
  });
});

// ---------------------------------------------------------------------------

describe("MSADeviceCodeFlow", () => {
  function makeFlow(fetchFn, clock = makeClock(), options = {}) {
    return new MSADeviceCodeFlow(
      Object.assign(
        { clientId: "cid", fetchFn, sleepFn: clock.sleepFn, nowFn: clock.nowFn },
        options
      )
    );
  }

  test("endpoints are built from tenant", () => {
    const flow = makeFlow(makeFetch([]), makeClock(), { tenant: "contoso.com" });
    assert.equal(
      flow.deviceCodeEndpoint,
      "https://login.microsoftonline.com/contoso.com/oauth2/v2.0/devicecode"
    );
    assert.equal(
      flow.tokenEndpoint,
      "https://login.microsoftonline.com/contoso.com/oauth2/v2.0/token"
    );
  });

  test("requestCode posts client_id and scope, maps the response", async () => {
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, DEVICE_CODE_RESP) },
    ]);
    const flow = makeFlow(fetchFn);
    const info = await flow.requestCode();
    assert.equal(info.deviceCode, "dev-code-1");
    assert.equal(info.userCode, "ABC123XY");
    assert.equal(info.verificationUri, "https://microsoft.com/devicelogin");
    assert.equal(info.verificationUriComplete, "https://microsoft.com/devicelogin?code=ABC123XY");
    assert.equal(info.expiresIn, 900);
    assert.equal(info.interval, 5);

    const call = fetchFn.calls[0];
    assert.equal(call.method, "POST");
    assert.equal(call.options.headers["Content-Type"], "application/x-www-form-urlencoded");
    assert.ok(call.options.body.includes("client_id=cid"));
    assert.ok(call.options.body.includes("scope=User.Read%20Files.ReadWrite.AppFolder%20offline_access"));
  });

  test("requestCode applies sane defaults for missing expires_in/interval", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: DEVICE_URL,
        response: jsonResp(200, {
          device_code: "d",
          user_code: "u",
          verification_uri: "https://v",
          expires_in: 0,
          interval: "bad",
        }),
      },
    ]);
    const info = await makeFlow(fetchFn).requestCode();
    assert.equal(info.expiresIn, 900);
    assert.equal(info.interval, 5);
    assert.equal(info.verificationUriComplete, "");
  });

  test("requestCode without clientId fails with config error", async () => {
    const flow = makeFlow(makeFetch([]), makeClock(), { clientId: "  " });
    await rejectsWithCode(flow.requestCode(), "config");
  });

  test("requestCode surfaces OAuth error codes", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: DEVICE_URL,
        response: oauthError(400, "unauthorized_client", "public flows disabled"),
      },
    ]);
    await rejectsWithCode(makeFlow(fetchFn).requestCode(), "unauthorized_client");
  });

  test("requestCode maps HTTP failures without JSON body", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: DEVICE_URL,
        response: {
          ok: false,
          status: 503,
          json: async () => {
            throw new Error("no body");
          },
        },
      },
    ]);
    await assert.rejects(makeFlow(fetchFn).requestCode(), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 503);
      assert.match(err.message, /Device code request failed: HTTP 503/);
      return true;
    });
  });

  test("requestCode rejects malformed responses", async () => {
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, { device_code: "d" }) },
    ]);
    await rejectsWithCode(makeFlow(fetchFn).requestCode(), "protocol");
  });

  test("network failures become network errors", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: DEVICE_URL,
        handler: () => {
          throw new TypeError("fetch failed");
        },
      },
    ]);
    await rejectsWithCode(makeFlow(fetchFn).requestCode(), "network");
  });

  test("pollOnce returns the token response on success", async () => {
    const fetchFn = makeFetch([
      { method: "POST", url: TOKEN_URL, response: jsonResp(200, TOKEN_RESP) },
    ]);
    const data = await makeFlow(fetchFn).pollOnce("dev-code-1");
    assert.equal(data.access_token, "AT");
    const call = fetchFn.calls[0];
    assert.ok(call.options.body.includes("grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Adevice_code"));
    assert.ok(call.options.body.includes("device_code=dev-code-1"));
    assert.ok(call.options.body.includes("client_id=cid"));
  });

  test("pollOnce without device code fails", async () => {
    await rejectsWithCode(makeFlow(makeFetch([])).pollOnce(""), "protocol");
  });

  for (const code of ["authorization_pending", "slow_down", "expired_token", "access_denied"]) {
    test(`pollOnce maps OAuth error ${code}`, async () => {
      const fetchFn = makeFetch([
        { method: "POST", url: TOKEN_URL, response: oauthError(400, code, "desc") },
      ]);
      await assert.rejects(makeFlow(fetchFn).pollOnce("d"), err => {
        assert.equal(err.code, code);
        assert.equal(err.message, "desc");
        return true;
      });
    });
  }

  test("pollOnce rejects 200 response without access_token", async () => {
    const fetchFn = makeFetch([
      { method: "POST", url: TOKEN_URL, response: jsonResp(200, { token_type: "Bearer" }) },
    ]);
    await rejectsWithCode(makeFlow(fetchFn).pollOnce("d"), "protocol");
  });

  test("waitForToken keeps polling through authorization_pending", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        responses: [
          oauthError(400, "authorization_pending"),
          oauthError(400, "authorization_pending"),
          jsonResp(200, TOKEN_RESP),
        ],
      },
    ]);
    const flow = makeFlow(fetchFn, clock);
    const data = await flow.waitForToken({ deviceCode: "d", expiresIn: 900, interval: 1 });
    assert.equal(data.access_token, "AT");
    assert.deepEqual(clock.sleeps, [1000, 1000, 1000]);
    assert.equal(fetchFn.calls.length, 3);
  });

  test("waitForToken increases the interval by 5s on slow_down", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        responses: [oauthError(400, "slow_down"), jsonResp(200, TOKEN_RESP)],
      },
    ]);
    const flow = makeFlow(fetchFn, clock);
    await flow.waitForToken({ deviceCode: "d", expiresIn: 900, interval: 5 });
    assert.deepEqual(clock.sleeps, [5000, 10000]);
  });

  test("waitForToken gives up with expired_token past the deadline", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        responses: [
          oauthError(400, "authorization_pending"),
          oauthError(400, "authorization_pending"),
        ],
      },
    ]);
    const flow = makeFlow(fetchFn, clock);
    await rejectsWithCode(
      flow.waitForToken({ deviceCode: "d", expiresIn: 10, interval: 5 }),
      "expired_token"
    );
    assert.equal(fetchFn.calls.length, 2);
  });

  test("waitForToken propagates access_denied immediately", async () => {
    const fetchFn = makeFetch([
      { method: "POST", url: TOKEN_URL, response: oauthError(400, "access_denied") },
    ]);
    await rejectsWithCode(
      makeFlow(fetchFn).waitForToken({ deviceCode: "d", expiresIn: 900, interval: 1 }),
      "access_denied"
    );
  });

  test("waitForToken propagates network errors", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        handler: () => {
          throw new TypeError("offline");
        },
      },
    ]);
    await rejectsWithCode(
      makeFlow(fetchFn).waitForToken({ deviceCode: "d", expiresIn: 900, interval: 1 }),
      "network"
    );
  });

  test("waitForToken aborts when isCancelled flips during polling", async () => {
    const clock = makeClock();
    let cancelled = false;
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        response: () => {
          cancelled = true; // 用户在第一次轮询进行中点了「取消」
          return oauthError(400, "authorization_pending");
        },
      },
    ]);
    const flow = new MSADeviceCodeFlow({
      clientId: "cid",
      fetchFn,
      nowFn: clock.nowFn,
      sleepFn: async ms => {
        clock.now += ms;
      },
    });
    await rejectsWithCode(
      flow.waitForToken({ deviceCode: "d", expiresIn: 900, interval: 1 }, { isCancelled: () => cancelled }),
      "cancelled"
    );
    assert.equal(fetchFn.calls.length, 1);
  });

  test("waitForToken aborts before any request when already cancelled", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([]);
    const flow = makeFlow(fetchFn, clock);
    await rejectsWithCode(
      flow.waitForToken({ deviceCode: "d", expiresIn: 900, interval: 1 }, { isCancelled: () => true }),
      "cancelled"
    );
    assert.equal(fetchFn.calls.length, 0);
    assert.deepEqual(clock.sleeps, []);
  });

  test("waitForToken validates its input", async () => {
    await rejectsWithCode(makeFlow(makeFetch([])).waitForToken(null), "protocol");
  });
});

// ---------------------------------------------------------------------------

describe("MSATokenManager", () => {
  const baseOptions = { clientId: "cid", scope: "scope.a scope.b" };

  test("requires a store", () => {
    assert.throws(() => new MSATokenManager({ clientId: "cid" }), err => {
      assert.equal(err.name, "MSASyncError");
      assert.equal(err.code, "config");
      return true;
    });
  });

  test("is signed out initially and getAccessToken fails", async () => {
    const clock = makeClock();
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store: makeStore(), fetchFn: makeFetch([]), nowFn: clock.nowFn })
    );
    assert.equal(tm.signedIn, false);
    assert.equal(tm.account, null);
    await rejectsWithCode(tm.getAccessToken(), "auth");
  });

  test("load restores a persisted session, valid token is served without network", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const fetchFn = makeFetch([]); // 任何请求都会抛「unexpected fetch」
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn, nowFn: clock.nowFn })
    );
    assert.equal(await tm.load(), true);
    assert.equal(tm.signedIn, true);
    assert.equal(await tm.getAccessToken(), "AT");
    assert.equal(tm.account.userPrincipalName, "test@outlook.com");
    assert.equal(fetchFn.calls.length, 0);
  });

  test("load ignores malformed persisted state", async () => {
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store: makeStore({ accessToken: "x" }), fetchFn: makeFetch([]) })
    );
    assert.equal(await tm.load(), false);
    assert.equal(tm.signedIn, false);
  });

  test("load survives a throwing store", async () => {
    const store = makeStore();
    store.load = async () => {
      throw new Error("keychain locked");
    };
    const tm = new MSATokenManager(Object.assign({}, baseOptions, { store, fetchFn: makeFetch([]) }));
    assert.equal(await tm.load(), false);
  });

  test("getAccessToken refreshes when close to expiry and persists", async () => {
    const clock = makeClock();
    const store = makeStore(
      signedInState(clock, { expiresAt: clock.now + 30 * 1000 }) // < 60s 余量 → 需刷新
    );
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        response: jsonResp(200, { access_token: "AT2", expires_in: 3600 }), // 无新 refresh_token
      },
    ]);
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn, nowFn: clock.nowFn })
    );
    await tm.load();
    assert.equal(await tm.getAccessToken(), "AT2");

    const call = fetchFn.calls[0];
    assert.ok(call.options.body.includes("grant_type=refresh_token"));
    assert.ok(call.options.body.includes("refresh_token=RT"));
    assert.ok(call.options.body.includes("client_id=cid"));
    assert.ok(call.options.body.includes("scope=scope.a%20scope.b"));
    // 未返回新 refresh_token 时保留旧值；expiresAt = now + 3600s
    assert.equal(store.data.refreshToken, "RT");
    assert.equal(store.data.accessToken, "AT2");
    assert.equal(store.data.expiresAt, clock.now + 3600 * 1000);
    assert.equal(store.saves.length, 1);
    // 刷新后的令牌在有效期内可复用，无新请求
    assert.equal(await tm.getAccessToken(), "AT2");
    assert.equal(fetchFn.calls.length, 1);
  });

  test("refresh clears the session on invalid_grant", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const fetchFn = makeFetch([
      { method: "POST", url: TOKEN_URL, response: oauthError(400, "invalid_grant", "refresh expired") },
    ]);
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn, nowFn: clock.nowFn })
    );
    await tm.load();
    await rejectsWithCode(tm.refresh(), "auth");
    assert.equal(tm.signedIn, false);
    assert.equal(store.data, null);
    assert.equal(store.clears, 1);
  });

  test("refresh maps server errors and keeps the old state", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const fetchFn = makeFetch([
      { method: "POST", url: TOKEN_URL, response: jsonResp(500, { message: "outage" }) },
    ]);
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn, nowFn: clock.nowFn })
    );
    await tm.load();
    await assert.rejects(tm.refresh(), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 500);
      return true;
    });
    assert.equal(tm.signedIn, true);
    assert.equal(store.saves.length, 0);
  });

  test("refresh maps network failures", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: TOKEN_URL,
        handler: () => {
          throw new TypeError("dns fail");
        },
      },
    ]);
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn, nowFn: clock.nowFn })
    );
    await tm.load();
    await rejectsWithCode(tm.refresh(), "network");
    assert.equal(tm.signedIn, true);
  });

  test("refresh requires a client id", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { clientId: "", store, fetchFn: makeFetch([]), nowFn: clock.nowFn })
    );
    await tm.load();
    await rejectsWithCode(tm.refresh(), "config");
  });

  test("setFromTokenResponse keeps previous refresh token and account", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn: makeFetch([]), nowFn: clock.nowFn })
    );
    await tm.load();
    tm.setFromTokenResponse({ access_token: "AT3", expires_in: 60 });
    assert.equal(tm._state.refreshToken, "RT");
    assert.equal(tm.account.userPrincipalName, "test@outlook.com");
    assert.equal(tm._state.expiresAt, clock.now + 60 * 1000);
  });

  test("setFromTokenResponse rejects malformed input", () => {
    const tm = new MSATokenManager(Object.assign({}, baseOptions, { store: makeStore() }));
    assert.throws(() => tm.setFromTokenResponse({}), err => err.code === "protocol");
    assert.throws(() => tm.setFromTokenResponse(null), err => err.code === "protocol");
  });

  test("setAccount updates and persists with persist()", async () => {
    const clock = makeClock();
    const store = makeStore(signedInState(clock));
    const tm = new MSATokenManager(
      Object.assign({}, baseOptions, { store, fetchFn: makeFetch([]), nowFn: clock.nowFn })
    );
    await tm.load();
    tm.setAccount({ displayName: "New Name" });
    await tm.persist();
    assert.equal(store.data.account.displayName, "New Name");
  });

  test("persist is a no-op when signed out", async () => {
    const store = makeStore();
    const tm = new MSATokenManager(Object.assign({}, baseOptions, { store }));
    await tm.persist();
    assert.equal(store.saves.length, 0);
  });

  test("clear resets state and tolerates store failures", async () => {
    const store = makeStore(signedInState(makeClock()));
    const tm = new MSATokenManager(Object.assign({}, baseOptions, { store }));
    await tm.load();
    await tm.clear();
    assert.equal(tm.signedIn, false);
    assert.equal(store.clears, 1);

    store.clear = async () => {
      throw new Error("locked");
    };
    await tm.clear(); // 不应抛出
  });
});

// ---------------------------------------------------------------------------

describe("MSAGraphClient", () => {
  test("requires a token manager", () => {
    assert.throws(() => new MSAGraphClient({}), err => err.code === "config");
  });

  test("getProfile sends $select and maps fields", async () => {
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: "https://graph.microsoft.com/v1.0/me?$select=displayName,userPrincipalName,mail",
        response: jsonResp(200, PROFILE_RESP),
      },
    ]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn });
    const profile = await client.getProfile();
    assert.deepEqual(profile, {
      displayName: "Test User",
      userPrincipalName: "test@outlook.com",
      mail: "",
    });
    assert.equal(fetchFn.calls[0].options.headers.Authorization, "Bearer tok");
  });

  test("retries once with a fresh token after 401", async () => {
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        responses: [
          jsonResp(401, { error: { code: "InvalidAuthenticationToken", message: "expired" } }),
          jsonResp(200, PROFILE_RESP),
        ],
      },
    ]);
    const tokens = makeTokenStub(["old-token", "new-token"]);
    const client = new MSAGraphClient({ tokenManager: tokens, fetchFn });
    const profile = await client.getProfile();
    assert.equal(profile.userPrincipalName, "test@outlook.com");
    assert.equal(tokens.refreshCount, 1);
    assert.equal(fetchFn.calls.length, 2);
    assert.equal(fetchFn.calls[0].options.headers.Authorization, "Bearer old-token");
    assert.equal(fetchFn.calls[1].options.headers.Authorization, "Bearer new-token");
  });

  test("does not retry twice on repeated 401", async () => {
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        responses: [
          jsonResp(401, { error: { code: "InvalidAuthenticationToken", message: "expired" } }),
          jsonResp(401, { error: { code: "InvalidAuthenticationToken", message: "expired" } }),
        ],
      },
    ]);
    const tokens = makeTokenStub();
    const client = new MSAGraphClient({ tokenManager: tokens, fetchFn });
    await assert.rejects(client.getProfile(), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 401);
      return true;
    });
    assert.equal(tokens.refreshCount, 1);
    assert.equal(fetchFn.calls.length, 2);
  });

  test("maps Graph error payloads", async () => {
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        response: jsonResp(500, { error: { code: "internalError", message: "Graph is down" } }),
      },
    ]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn });
    await assert.rejects(client.getProfile(), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 500);
      assert.match(err.message, /Graph is down/);
      return true;
    });
  });

  test("downloadFile returns bytes, null on 404, throws otherwise", async () => {
    const url = GRAPH_APPROOT + "/vantage-profile.zip:/content";
    const okFetch = makeFetch([{ url, response: bytesResp(200, u8([1, 2, 3])) }]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: okFetch });
    const bytes = await client.downloadFile("vantage-profile.zip");
    assert.deepEqual(Array.from(bytes), [1, 2, 3]);

    const missFetch = makeFetch([{ url, response: jsonResp(404, { error: { code: "itemNotFound" } }) }]);
    const client2 = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: missFetch });
    assert.equal(await client2.downloadFile("vantage-profile.zip"), null);

    const badFetch = makeFetch([{ url, response: jsonResp(500, {}) }]);
    const client3 = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: badFetch });
    await rejectsWithCode(client3.downloadFile("vantage-profile.zip"), "http");
  });

  test("downloadFile maps body read failures to network errors", async () => {
    const url = GRAPH_APPROOT + "/vantage-profile.zip:/content";
    const fetchFn = makeFetch([
      {
        url,
        response: {
          ok: true,
          status: 200,
          arrayBuffer: async () => {
            throw new Error("stream aborted");
          },
        },
      },
    ]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn });
    await rejectsWithCode(client.downloadFile("vantage-profile.zip"), "network");
  });

  test("downloadJson parses content and rejects malformed JSON", async () => {
    const url = GRAPH_APPROOT + "/vantage-sync-meta.json:/content";
    const okFetch = makeFetch([{ url, response: jsonResp(200, { device: "pc-1" }) }]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: okFetch });
    assert.deepEqual(await client.downloadJson("vantage-sync-meta.json"), { device: "pc-1" });

    const badFetch = makeFetch([{ url, response: bytesResp(200, u8([0x7b, 0x22])) }]); // {"
    const client2 = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: badFetch });
    await rejectsWithCode(client2.downloadJson("vantage-sync-meta.json"), "protocol");
  });

  test("uploadFile validates its input", async () => {
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: makeFetch([]) });
    await rejectsWithCode(client.uploadFile("x", [1, 2, 3]), "protocol");
    await rejectsWithCode(client.uploadFile("x", u8([])), "protocol");
  });

  test("small files use the simple PUT :/content upload", async () => {
    const url = GRAPH_APPROOT + "/vantage-profile.zip:/content";
    const fetchFn = makeFetch([{ method: "PUT", url, response: jsonResp(201, { id: "item" }) }]);
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 1024,
    });
    const progress = [];
    await client.uploadFile("vantage-profile.zip", u8([1, 2, 3, 4]), {
      onProgress: (sent, total) => progress.push([sent, total]),
    });
    const call = fetchFn.calls[0];
    assert.equal(call.method, "PUT");
    assert.equal(call.options.headers["Content-Type"], "application/octet-stream");
    assert.deepEqual(Array.from(call.options.body), [1, 2, 3, 4]);
    assert.deepEqual(progress, [[4, 4]]);
  });

  test("small upload failures surface as http errors", async () => {
    const url = GRAPH_APPROOT + "/vantage-profile.zip:/content";
    const fetchFn = makeFetch([
      { method: "PUT", url, response: jsonResp(507, { error: { message: "quota exceeded" } }) },
    ]);
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 1024,
    });
    await assert.rejects(client.uploadFile("vantage-profile.zip", u8([1, 2])), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 507);
      assert.match(err.message, /quota exceeded/);
      return true;
    });
  });

  function sessionRoutes(sessionUrl, chunkResponses, sessions = 1) {
    const sessionResponses = [];
    for (let i = 0; i < sessions; i++) {
      sessionResponses.push(
        jsonResp(200, { uploadUrl: sessionUrl + (i === 0 ? "" : "-" + i), expirationDateTime: "later" })
      );
    }
    return [
      {
        method: "POST",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/createUploadSession",
        responses: sessionResponses,
      },
      { method: "PUT", url: url => url.startsWith(sessionUrl), responses: chunkResponses },
      { method: "DELETE", url: url => url.startsWith(sessionUrl), response: jsonResp(204, {}) },
    ];
  }

  test("large files upload via a session with correct Content-Range chunks", async () => {
    const sessionUrl = "https://upload.example/session";
    const fetchFn = makeFetch(
      sessionRoutes(sessionUrl, [jsonResp(202, {}), jsonResp(308, {}), jsonResp(201, { id: "item" })])
    );
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    const progress = [];
    const bytes = u8([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
    await client.uploadFile("vantage-profile.zip", bytes, {
      onProgress: (sent, total) => progress.push([sent, total]),
    });

    const puts = fetchFn.calls.filter(c => c.method === "PUT");
    assert.equal(puts.length, 3);
    assert.deepEqual(
      puts.map(c => c.options.headers["Content-Range"]),
      ["bytes 0-4/12", "bytes 5-9/12", "bytes 10-11/12"]
    );
    assert.deepEqual(Array.from(puts[0].options.body), [1, 2, 3, 4, 5]);
    assert.deepEqual(Array.from(puts[2].options.body), [11, 12]);
    // 会话 URL 是预授权的：不得携带 Authorization 头
    for (const put of puts) {
      assert.equal(put.options.headers.Authorization, undefined);
    }
    // 成功完成后不删除会话
    assert.equal(fetchFn.calls.filter(c => c.method === "DELETE").length, 0);
    assert.deepEqual(progress, [[5, 12], [10, 12], [12, 12]]);

    const createBody = JSON.parse(fetchFn.calls[0].options.body);
    assert.equal(createBody.item["@microsoft.graph.conflictBehavior"], "replace");
  });

  test("a failed chunk cancels the upload session", async () => {
    const sessionUrl = "https://upload.example/session";
    const fetchFn = makeFetch(
      sessionRoutes(sessionUrl, [jsonResp(202, {}), jsonResp(500, { error: { message: "server" } })])
    );
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    await assert.rejects(client.uploadFile("vantage-profile.zip", u8(new Array(12).fill(0))), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 500);
      return true;
    });
    const deletes = fetchFn.calls.filter(c => c.method === "DELETE");
    assert.equal(deletes.length, 1);
    assert.equal(deletes[0].url, sessionUrl);
  });

  test("an expired session (404) is recreated once and the chunk retried", async () => {
    const sessionUrl = "https://upload.example/session";
    const fetchFn = makeFetch(
      sessionRoutes(
        sessionUrl,
        [jsonResp(404, {}), jsonResp(201, { id: "item" })],
        2
      )
    );
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    await client.uploadFile("vantage-profile.zip", u8([1, 2, 3, 4, 5, 6, 7, 8, 9]));
    const posts = fetchFn.calls.filter(c => c.method === "POST");
    assert.equal(posts.length, 2);
    const puts = fetchFn.calls.filter(c => c.method === "PUT");
    assert.equal(puts.length, 2);
    assert.equal(puts[0].url, sessionUrl);
    assert.equal(puts[1].url, sessionUrl + "-1"); // 重试打到新会话
    assert.equal(puts[1].options.headers["Content-Range"], "bytes 0-4/9");
    assert.equal(fetchFn.calls.filter(c => c.method === "DELETE").length, 0);
  });

  test("a second session expiry fails and cleans up", async () => {
    const sessionUrl = "https://upload.example/session";
    const fetchFn = makeFetch(
      sessionRoutes(sessionUrl, [jsonResp(404, {}), jsonResp(404, {})], 2)
    );
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    await rejectsWithCode(client.uploadFile("vantage-profile.zip", u8([1, 2, 3, 4, 5, 6, 7, 8, 9])), "http");
    assert.equal(fetchFn.calls.filter(c => c.method === "DELETE").length, 1);
  });

  test("session creation failure surfaces as http error", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/createUploadSession",
        response: jsonResp(403, { error: { code: "accessDenied", message: "no permission" } }),
      },
    ]);
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    await assert.rejects(client.uploadFile("vantage-profile.zip", u8(new Array(12).fill(0))), err => {
      assert.equal(err.code, "http");
      assert.equal(err.status, 403);
      return true;
    });
  });

  test("malformed upload session response is a protocol error", async () => {
    const fetchFn = makeFetch([
      {
        method: "POST",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/createUploadSession",
        response: jsonResp(200, { expirationDateTime: "later" }),
      },
    ]);
    const client = new MSAGraphClient({
      tokenManager: makeTokenStub(),
      fetchFn,
      simpleUploadMax: 8,
      chunkSize: 5,
    });
    await rejectsWithCode(client.uploadFile("vantage-profile.zip", u8(new Array(12).fill(0))), "protocol");
  });

  test("deleteFile returns true/false and throws on server errors", async () => {
    const url = GRAPH_APPROOT + "/vantage-profile.zip";
    const okFetch = makeFetch([{ method: "DELETE", url, response: jsonResp(204, {}) }]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: okFetch });
    assert.equal(await client.deleteFile("vantage-profile.zip"), true);

    const missFetch = makeFetch([{ method: "DELETE", url, response: jsonResp(404, {}) }]);
    const client2 = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: missFetch });
    assert.equal(await client2.deleteFile("vantage-profile.zip"), false);

    const badFetch = makeFetch([{ method: "DELETE", url, response: jsonResp(500, {}) }]);
    const client3 = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn: badFetch });
    await rejectsWithCode(client3.deleteFile("vantage-profile.zip"), "http");
  });

  test("graph network failures become network errors", async () => {
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        handler: () => {
          throw new TypeError("offline");
        },
      },
    ]);
    const client = new MSAGraphClient({ tokenManager: makeTokenStub(), fetchFn });
    await rejectsWithCode(client.getProfile(), "network");
  });
});

// ---------------------------------------------------------------------------

describe("MSASyncService", () => {
  const clientId = "cid";

  function signedInService(routes, clock = makeClock()) {
    const store = makeStore(signedInState(clock));
    const svc = new MSASyncService({
      clientId,
      store,
      fetchFn: makeFetch(routes),
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    svc._testStore = store;
    svc._testClock = clock;
    // 同步恢复会话（数据已在 store 中）
    return svc.restoreSession().then(() => svc);
  }

  test("requires a store", () => {
    assert.throws(() => new MSASyncService({ clientId }), err => err.code === "config");
  });

  test("startSignIn without a client id fails with config error", async () => {
    const clock = makeClock();
    const svc = new MSASyncService({
      store: makeStore(),
      fetchFn: makeFetch([]),
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    assert.equal(svc.isConfigured, false);
    await rejectsWithCode(svc.startSignIn(), "config");
  });

  test("full sign-in: device code, polling, profile fetch, persisted session", async () => {
    const clock = makeClock();
    const store = makeStore();
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, DEVICE_CODE_RESP) },
      {
        method: "POST",
        url: TOKEN_URL,
        responses: [oauthError(400, "authorization_pending"), jsonResp(200, TOKEN_RESP)],
      },
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        response: jsonResp(200, PROFILE_RESP),
      },
    ]);
    const svc = new MSASyncService({
      clientId,
      store,
      fetchFn,
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    assert.equal(svc.signedIn, false);

    const info = await svc.startSignIn();
    assert.equal(info.userCode, "ABC123XY");
    assert.equal(info.verificationUriComplete, "https://microsoft.com/devicelogin?code=ABC123XY");
    assert.equal(svc.hasPendingSignIn, true);

    const account = await svc.waitSignIn();
    assert.equal(account.userPrincipalName, "test@outlook.com");
    assert.equal(svc.signedIn, true);
    assert.equal(svc.account.displayName, "Test User");
    assert.equal(svc.hasPendingSignIn, true); // 直到 signOut/再次登录前仍持有会话对象
    assert.equal(store.data.accessToken, "AT");
    assert.equal(store.data.refreshToken, "RT");
    assert.equal(store.data.expiresAt, clock.now + 3600 * 1000);
    assert.equal(store.data.account.userPrincipalName, "test@outlook.com");
  });

  test("sign-in still succeeds when the profile request fails", async () => {
    const clock = makeClock();
    const store = makeStore();
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, DEVICE_CODE_RESP) },
      { method: "POST", url: TOKEN_URL, response: jsonResp(200, TOKEN_RESP) },
      {
        method: "GET",
        url: url => url.startsWith("https://graph.microsoft.com/v1.0/me?"),
        response: jsonResp(500, {}),
      },
    ]);
    const svc = new MSASyncService({
      clientId,
      store,
      fetchFn,
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    await svc.startSignIn();
    const account = await svc.waitSignIn();
    assert.equal(account, null);
    assert.equal(svc.signedIn, true);
    assert.equal(svc.account, null);
  });

  test("sign-in failure propagates through waitSignIn", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, DEVICE_CODE_RESP) },
      { method: "POST", url: TOKEN_URL, response: oauthError(400, "access_denied", "user said no") },
    ]);
    const svc = new MSASyncService({
      clientId,
      store: makeStore(),
      fetchFn,
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    await svc.startSignIn();
    await rejectsWithCode(svc.waitSignIn(), "access_denied");
    assert.equal(svc.signedIn, false);
  });

  test("waitSignIn without startSignIn is a protocol error", async () => {
    const svc = new MSASyncService({ clientId, store: makeStore(), fetchFn: makeFetch([]) });
    await rejectsWithCode(svc.waitSignIn(), "protocol");
  });

  test("cancelSignIn aborts the pending sign-in", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      { method: "POST", url: DEVICE_URL, response: jsonResp(200, DEVICE_CODE_RESP) },
      { method: "POST", url: TOKEN_URL, response: oauthError(400, "authorization_pending") },
    ]);
    const svc = new MSASyncService({
      clientId,
      store: makeStore(),
      fetchFn,
      nowFn: clock.nowFn,
      sleepFn: clock.sleepFn,
    });
    await svc.startSignIn();
    svc.cancelSignIn();
    await rejectsWithCode(svc.waitSignIn(), "cancelled");
    assert.equal(svc.signedIn, false);
  });

  test("restoreSession picks up a persisted login", async () => {
    const clock = makeClock();
    const svc = new MSASyncService({
      clientId,
      store: makeStore(signedInState(clock)),
      fetchFn: makeFetch([]),
      nowFn: clock.nowFn,
    });
    assert.equal(svc.signedIn, false);
    assert.equal(await svc.restoreSession(), true);
    assert.equal(svc.signedIn, true);
    assert.equal(svc.account.userPrincipalName, "test@outlook.com");
  });

  test("signOut clears the persisted session", async () => {
    const clock = makeClock();
    const svc = await signedInService([], clock);
    assert.equal(svc.signedIn, true);
    await svc.signOut();
    assert.equal(svc.signedIn, false);
    assert.equal(svc.account, null);
    assert.equal(svc._testStore.data, null);
    assert.equal(svc._testStore.clears, 1);
  });

  test("uploadBackup stores the zip and the metadata sidecar", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      { method: "PUT", url: GRAPH_APPROOT + "/vantage-profile.zip:/content", response: jsonResp(201, {}) },
      {
        method: "PUT",
        url: GRAPH_APPROOT + "/vantage-sync-meta.json:/content",
        response: jsonResp(201, {}),
      },
    ]);
    const svc = await signedInService([]);
    svc.graph = new MSAGraphClient({ tokenManager: svc.tokens, fetchFn });

    const meta = { device: "pc-1", uploadedAt: 42, sizeBytes: 3 };
    await svc.uploadBackup(u8([1, 2, 3]), meta);

    const zipCall = fetchFn.calls[0];
    assert.deepEqual(Array.from(zipCall.options.body), [1, 2, 3]);
    assert.equal(zipCall.options.headers["Content-Type"], "application/octet-stream");

    const metaCall = fetchFn.calls[1];
    assert.equal(metaCall.options.headers["Content-Type"], "application/json");
    assert.deepEqual(JSON.parse(new TextDecoder().decode(Uint8Array.from(metaCall.options.body))), meta);
  });

  test("uploadBackup requires a signed-in session", async () => {
    const svc = new MSASyncService({ clientId, store: makeStore(), fetchFn: makeFetch([]) });
    await rejectsWithCode(svc.uploadBackup(u8([1]), {}), "auth");
    await rejectsWithCode(svc.downloadBackup(), "auth");
  });

  test("downloadBackup returns bytes with metadata", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/content",
        response: bytesResp(200, u8([7, 8, 9])),
      },
      {
        method: "GET",
        url: GRAPH_APPROOT + "/vantage-sync-meta.json:/content",
        response: jsonResp(200, { device: "pc-2", uploadedAt: 123 }),
      },
    ]);
    const svc = await signedInService([]);
    svc.graph = new MSAGraphClient({ tokenManager: svc.tokens, fetchFn });

    const backup = await svc.downloadBackup();
    assert.deepEqual(Array.from(backup.bytes), [7, 8, 9]);
    assert.equal(backup.meta.device, "pc-2");
    assert.equal(backup.meta.uploadedAt, 123);
  });

  test("downloadBackup returns null when no cloud backup exists", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/content",
        response: jsonResp(404, { error: { code: "itemNotFound" } }),
      },
    ]);
    const svc = await signedInService([]);
    svc.graph = new MSAGraphClient({ tokenManager: svc.tokens, fetchFn });
    assert.equal(await svc.downloadBackup(), null);
  });

  test("downloadBackup tolerates a missing/corrupt metadata sidecar", async () => {
    const clock = makeClock();
    const fetchFn = makeFetch([
      {
        method: "GET",
        url: GRAPH_APPROOT + "/vantage-profile.zip:/content",
        response: bytesResp(200, u8([1])),
      },
      {
        method: "GET",
        url: GRAPH_APPROOT + "/vantage-sync-meta.json:/content",
        response: bytesResp(200, u8([0x7b, 0x22])), // 损坏的 JSON
      },
    ]);
    const svc = await signedInService([]);
    svc.graph = new MSAGraphClient({ tokenManager: svc.tokens, fetchFn });

    const backup = await svc.downloadBackup();
    assert.deepEqual(Array.from(backup.bytes), [1]);
    assert.equal(backup.meta, null);
  });

  test("tenant override is honoured in endpoint construction", () => {
    const svc = new MSASyncService({
      clientId,
      tenant: "organizations",
      store: makeStore(),
      fetchFn: makeFetch([]),
    });
    assert.equal(
      svc.flow.tokenEndpoint,
      "https://login.microsoftonline.com/organizations/oauth2/v2.0/token"
    );
    assert.equal(svc.tenant, "organizations");
  });

  test("module constants are exported and sane", () => {
    assert.equal(MSA.DEFAULT_TENANT, "consumers");
    assert.equal(
      MSA.DEFAULT_SCOPES,
      "User.Read Files.ReadWrite.AppFolder offline_access"
    );
    assert.equal(MSA.BACKUP_ITEM, "vantage-profile.zip");
    assert.equal(MSA.META_ITEM, "vantage-sync-meta.json");
    assert.equal(MSA.SIMPLE_UPLOAD_MAX, 4 * 1024 * 1024);
    assert.equal(MSA.CHUNK_SIZE % (320 * 1024), 0, "chunk size must be a multiple of 320 KiB");
    assert.equal(MSA.DEVICE_CODE_GRANT, "urn:ietf:params:oauth:grant-type:device_code");
  });
});
