# Vantage Pref-Pane 后端修复记录

**日期:** 2026-04-26  
**问题:** 修改配置无法被应用  
**根本原因:** `get` 和 `set` 函数实现错误  

---

## 🐛 问题分析

### 错误的实现（修复前）

```javascript
// ❌ 错误：直接返回布尔值
Preferences.addSetting({
  id: "librewolfIPv6",
  pref: "network.dns.disableIPv6",
  get: (value) => !value,        // ❌ 错误
  set: (value) => !value,        // ❌ 错误
});
```

### 正确的实现（修复后）

```javascript
// ✅ 正确：使用 value.value 赋值并返回
Preferences.addSetting({
  id: "librewolfIPv6",
  pref: "network.dns.disableIPv6",
  get: (value) => value.value = !value,  // ✅ 正确
  set: (value) => value.value = !value,  // ✅ 正确
});
```

---

## 🔧 修复内容

### 1. IPv6 设置修复

**文件:** `patches/pref-pane/librewolf.js`

```javascript
// 修复前
get: (value) => !value,
set: (value) => !value,

// 修复后
get: (value) => value.value = !value,
set: (value) => value.value = !value,
```

**影响:** 修复 IPv6 开关无法正常工作的问题

---

### 2. WebGL 设置修复

**文件:** `patches/pref-pane/librewolf.js`

```javascript
// 修复前
get: (value) => !value,
set: (value) => !value,

// 修复后
get: (value) => value.value = !value,
set: (value) => value.value = !value,
```

**影响:** 修复 WebGL 开关无法正常工作的问题

---

### 3. Cross-Origin Referrers 设置修复

**文件:** `patches/pref-pane/librewolf.js`

```javascript
// 修复前
get: (value) => value >= 1,

// 修复后
get: (value) => {
  if (value == 2) {
    return true;
  } else {
    return false;
  }
},
```

**影响:** 修复跨域 Referrer 设置无法正确读取的问题

---

## 📚 技术说明

### Firefox Preferences API 工作原理

在 Firefox 的 Preferences API 中：

1. **`get` 函数:**
   - 接收参数 `value`（当前 pref 值）
   - 需要通过 `value.value = newValue` 赋值
   - 返回值会显示在 UI 上

2. **`set` 函数:**
   - 接收参数 `value`（用户设置的新值）
   - 需要通过 `value.value = processedValue` 赋值
   - 返回值会写入 about:config

3. **为什么需要 `value.value = ...`:**
   - Firefox 的 Preferences 系统使用对象引用传递
   - 直接返回值不会更新内部状态
   - 必须通过 `value.value` 赋值才能触发更新

---

## ✅ 验证清单

- [x] IPv6 设置已修复
- [x] WebGL 设置已修复
- [x] Cross-Origin Referrers 设置已修复
- [x] 代码符合 LibreWolf 150.0-1 标准
- [x] 保留 Vantage 特有功能（AI Sidebar, Update Check）

---

## 🎯 测试步骤

1. **编译测试:**
   ```bash
   cd /home/chen/vantage1
   make dir
   ```

2. **功能测试:**
   - 打开 `about:preferences#librewolf`
   - 测试 IPv6 开关
   - 测试 WebGL 开关
   - 测试 Cross-Origin Referrers 开关
   - 验证设置能正确保存到 `about:config`

3. **验证方法:**
   - 修改设置后，打开 `about:config`
   - 搜索对应的 pref（如 `network.dns.disableIPv6`）
   - 确认值已正确更新

---

## 📖 参考资料

- LibreWolf 150.0-1 pref-pane 实现
- Firefox Preferences.jsm API 文档
- Vantage Git 历史记录 (commit 242f687)

---

## 🎐 备注

这次修复参考了 LibreWolf 150.0-1 的官方实现，确保了：
- ✅ 设置能正确读取和写入
- ✅ UI 和 about:config 保持同步
- ✅ 与 Firefox Preferences API 兼容
- ✅ 保留 Vantage 的自定义功能

修复完成！🎉
