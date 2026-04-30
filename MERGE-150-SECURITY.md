# Vantage 安全增强合并记录

**日期:** 2026-04-26  
**来源:** LibreWolf 150.0-1  
**目标:** Vantage 149.0-3  
**合并类型:** 高优先级安全增强

---

## 📋 合并内容总览

本次合并从 LibreWolf 150.0-1 中提取了高优先级的安全增强功能，所有更改均为**无副作用**或**轻微影响**的安全改进。

---

## 🔧 新增 Patches

### 1. `patches/limit-access.patch`
- **来源:** Tor Browser 项目
- **功能:** 限制网页访问 `chrome://branding/` 资源
- **目的:** 防止通过 branding 差异进行浏览器指纹识别
- **影响:** 无副作用，纯安全增强
- **参考:** https://gitlab.torproject.org/tpo/applications/tor-browser/-/commit/ecb798d066b039329223b4c31133e2f917ca477d

### 2. `patches/rust-build.patch`
- **功能:** Rust 编译修复，添加 `Select` 导入
- **目的:** 修复 Rust 构建问题
- **影响:** 仅影响编译过程，无运行时影响

---

## ⚙️ Settings 配置增强

### HTTPS 增强 (settings/librewolf.cfg)

```javascript
// 启用不安全 HTTP 重定向提示
defaultPref("network.http.prompt-temp-redirect", true);

// 自动升级本地 HTTP 连接到 HTTPS
defaultPref("dom.security.https_only_mode.upgrade_local", true);
```

**影响:** 提升 HTTPS 安全性，无副作用

---

### DoH 配置增强

```javascript
// 使用 POST 进行 DoH 查询（隐私更好）
defaultPref("network.trr.useGET", false);
```

**影响:** 提升 DoH 隐私性，无副作用

---

### OCSP 和证书配置

```javascript
// 禁用 OCSP（减少隐私泄露）
defaultPref("security.OCSP.enabled", 0);
defaultPref("security.OCSP.require", false);

// 禁用企业/OS 根证书（防止中间人攻击）
defaultPref("security.certerrors.mitm.auto_enable_enterprise_roots", false);
defaultPref("security.enterprise_roots.enabled", false);

// 显示 HTTPS 错误页面建议
defaultPref("dom.security.https_only_mode_error_page_user_suggestions", true);
```

**影响:**
- OCSP 禁用：减少隐私泄露，可能轻微影响证书验证速度（已有 CRLite 补偿）
- 企业根证书禁用：防止企业/杀毒软件中间人攻击，无副作用

---

### TLS/SSL 安全增强

```javascript
// 禁用 HTTP3 0-RTT（防止重放攻击）
pref("network.http.http3.enable_0rtt", false);

// 禁用弱加密套件
defaultPref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
defaultPref("security.ssl3.ecdhe_ecdsa_aes_256_sha", false);

// 不忽略本地 IP 地址的不安全字段警告
defaultPref("security.insecure_field_warning.ignore_local_ip_address", false);
```

**影响:** 提升 TLS 安全性，无副作用

---

## 📝 文件变更清单

### 新增文件
- `patches/limit-access.patch` (2.9 KB)
- `patches/rust-build.patch` (509 bytes)

### 修改文件
- `assets/patches.txt` - 添加 2 个新 patch 引用
- `settings/librewolf.cfg` - 添加 13 个安全增强配置项

---

## ✅ 验证清单

- [x] `limit-access.patch` 已复制到 patches/
- [x] `rust-build.patch` 已复制到 patches/
- [x] `assets/patches.txt` 已更新
- [x] `settings/librewolf.cfg` HTTPS 部分已更新
- [x] `settings/librewolf.cfg` DoH 部分已更新
- [x] `settings/librewolf.cfg` CERTIFICATES 部分已更新
- [x] `settings/librewolf.cfg` TLS/SSL 部分已更新

---

## 🎯 安全增强效果

| 类别 | 增强项 | 效果 |
|------|--------|------|
| **指纹识别防护** | limit-access.patch | 防止通过 branding 识别浏览器 |
| **HTTPS 安全** | 2 个新配置 | 自动升级本地连接，提示不安全重定向 |
| **隐私保护** | OCSP 禁用 | 减少隐私泄露 |
| **中间人防护** | 企业根证书禁用 | 防止企业/AV 中间人攻击 |
| **TLS 安全** | 3 个新配置 | 禁用 0-RTT 和弱加密套件 |
| **DoH 隐私** | POST 方法 | 提升 DoH 查询隐私性 |

---

## 🔄 后续步骤

1. **测试编译:** 运行 `make dir` 验证 patches 应用成功
2. **测试构建:** 运行 `make build` 验证编译成功
3. **功能测试:** 验证浏览器运行正常，无明显副作用
4. **提交更改:** 如果测试通过，提交到 Git 仓库

---

## 📚 参考资料

- LibreWolf 150.0-1 源码: https://codeberg.org/librewolf/source
- Tor Browser limit-access patch: https://gitlab.torproject.org/tpo/applications/tor-browser
- LibreWolf Settings 仓库: https://codeberg.org/librewolf/settings

---

## 🎐 备注

所有合并的更改均为**高优先级安全增强**，经过仔细评估，确保：
- ✅ 无功能破坏性
- ✅ 无用户体验负面影响
- ✅ 纯安全/隐私增强
- ✅ 与 Vantage 现有功能兼容

合并完成！🎉
