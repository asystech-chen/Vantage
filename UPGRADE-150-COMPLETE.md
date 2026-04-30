# Vantage 150.0-1 升级完成报告

**日期:** 2026-04-26  
**版本:** 150.0-1  
**状态:** ✅ 所有修复完成，`make dir` 通过  

---

## 📊 升级概览

### 版本变化
- **Firefox 源码:** 149.0 → 150.0
- **Vantage 版本:** v149.0-3 → v150.0-1

### 主要工作
1. ✅ 合并 LibreWolf 150.0-1 安全增强
2. ✅ 修复 Pref-Pane 后端配置问题
3. ✅ 适配 Firefox 150 的 patches

---

## 🔧 已修复的问题

### 1. Pref-Pane 后端修复

**问题:** 配置修改无法保存到 `about:config`

**根本原因:** `get` 和 `set` 函数实现错误

**修复内容:**
- ✅ IPv6 设置: `get/set` 使用 `value.value = !value`
- ✅ WebGL 设置: `get/set` 使用 `value.value = !value`
- ✅ Cross-Origin Referrers: `get` 正确判断 `value == 2`

**文档:** `PREF-PANE-FIX.md`, `PREF-PANE-FINAL-VERIFICATION.md`

---

### 2. Firefox 150 Patches 适配

#### 已移除的 Patches（不再需要）

| Patch | 原因 |
|-------|------|
| `backport-build-fixes-from-150.patch` | Firefox 150 源码已包含这些修复 |
| `bootstrap.patch` | 文件路径 `python/mozversioncontrol/mozversioncontrol/repo/source.py` 已不存在 |
| `flatpak-autoconf.patch` | Firefox 150 已原生支持，LibreWolf 已移到 `removed-patches/` |

#### 已更新的 Patches

| Patch | 修复内容 |
|-------|---------|
| `privacy-preferences.patch` | 移除 `main.js` 中已存在的 hunk（Firefox 150 已包含） |
| `webgl-permission.patch` | 移除 `modules/libpref/moz.build` 中尾随逗号 hunk（已存在） |
| `vantage-privacy-dashboard.patch` | 完全重新生成，适配 Firefox 150 新结构 |

---

### 3. 安全增强合并

**来源:** LibreWolf 150.0-1

**新增 Patches:**
- ✅ `limit-access.patch` - 反指纹识别增强
- ✅ `rust-build.patch` - Rust 编译修复

**新增配置 (librewolf.cfg):**
```javascript
// HTTPS 升级
defaultPref("dom.security.https_first", true);
defaultPref("dom.security.https_first_schemeless", true);

// DoH POST 方法
defaultPref("network.trr.use_GET_for_DNS_query", false);

// OCSP 禁用
defaultPref("security.OCSP.enabled", 0);

// 企业根证书禁用
defaultPref("security.enterprise_roots.enabled", false);

// TLS 强化
defaultPref("security.tls.enable_0rtt_data", false);
defaultPref("security.tls.version.enable-deprecated", false);
defaultPref("security.ssl.require_safe_negotiation", true);
defaultPref("security.ssl.treat_unsafe_negotiation_as_broken", true);
defaultPref("security.ssl3.rsa_des_ede3_sha", false);

// 其他安全设置
defaultPref("security.cert_pinning.enforcement_level", 2);
defaultPref("security.remote_settings.crlite_filters.enabled", true);
defaultPref("security.pki.crlite_mode", 2);
```

**文档:** `MERGE-150-SECURITY.md`

---

## 🎯 Vantage Privacy Dashboard 重构

### 问题
Firefox 150 的 `protections.html` 和 `protections.mjs` 结构变化：
- 新增 `<privacy-metrics-card>` 元素
- 新增 `import LockwiseCard/MonitorCard/ProxyCard/VPNCard`
- 行号和上下文全部改变

### 解决方案
基于 Firefox 150 源文件完全重新生成 patch：

**保留功能:**
- ✅ 统计卡片（Trackers, Cookies, Fingerprinters, Cryptominers, Social）
- ✅ 保护状态卡片（显示各项保护的启用/禁用状态）
- ✅ ETP 图表（Enhanced Tracking Protection）

**移除功能:**
- ❌ VPN Banner
- ❌ Mobile Hanger
- ❌ Monitor Card
- ❌ Lockwise Card
- ❌ Proxy Card
- ❌ VPN Card

**新增 CSS:**
```css
/* Stats overview cards */
#stats-overview { ... }
.stat-card { ... }
.stat-icon { ... }
.stat-number { ... }
.stat-label { ... }

/* Protection status card */
#protection-status-card { ... }
.protection-status-item { ... }
.status-indicator { ... }
.status-indicator.enabled { background-color: #2ac3a2; }
.status-indicator.disabled { background-color: #ff6b6b; }
```

---

## ✅ 验证结果

### Make Dir 测试
```bash
cd /home/chen/vantage1
make dir
```
**结果:** ✅ 所有 patches 成功应用，无错误

### Pref-Pane 验证
```bash
./verify-pref-pane-fix.sh
```
**结果:** ✅ 所有修复验证通过

---

## 📝 下一步

### 1. 编译测试
```bash
cd /home/chen/vantage1
make build
```

### 2. 功能测试
- [ ] 测试 `about:preferences#librewolf` 页面
  - [ ] IPv6 开关
  - [ ] WebGL 开关
  - [ ] Cross-Origin Referrers 开关
  - [ ] 验证设置保存到 `about:config`
- [ ] 测试 `about:protections` 隐私仪表板
  - [ ] 统计卡片显示
  - [ ] 保护状态指示器
  - [ ] ETP 图表

### 3. 回归测试
- [ ] 确认之前工作的功能仍然正常
- [ ] 确认 Vantage 特有功能（AI Sidebar）正常

---

## 📚 相关文档

| 文档 | 内容 |
|------|------|
| `MERGE-150-SECURITY.md` | LibreWolf 150.0-1 安全增强合并详情 |
| `PREF-PANE-FIX.md` | Pref-Pane 后端修复详情 |
| `PREF-PANE-FINAL-VERIFICATION.md` | Pref-Pane 最终验证报告 |
| `verify-merge.sh` | 安全合并验证脚本 |
| `verify-pref-pane-fix.sh` | Pref-Pane 修复验证脚本 |

---

## 🎐 总结

所有修复已完成，`make dir` 测试通过。Vantage 150.0-1 已准备好进行编译测试。

**关键改进:**
1. ✅ 合并了 LibreWolf 150.0-1 的 13 项安全增强
2. ✅ 修复了 Pref-Pane 配置无法保存的问题
3. ✅ 适配了 Firefox 150 的新文件结构
4. ✅ 重构了隐私仪表板以匹配新架构

**可以放心编译了！** 🎉
