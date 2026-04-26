# Rust Build Patch Checksum 修复

**日期:** 2026-04-26  
**问题:** `rust-build.patch` 导致 Cargo checksum 验证失败  

---

## 问题描述

编译时出现错误：
```
error: the listed checksum of `/home/chen/vantage1/librewolf-150.0-1/third_party/rust/encoding_rs/src/x_user_defined.rs` has changed:
expected: 9456ca46168ef86c98399a2536f577ef7be3cdde90c0c51392d8ac48519d3fae
actual: b9432f9ed39742015f4bb4c3e75c89a2b9a9eef943dd0fd7cd889fddd1e6d39c
```

## 原因

`rust-build.patch` 修改了 `encoding_rs` crate 的源文件：
```diff
+        use core::simd::Select;
```

但 `.cargo-checksum.json` 中的 checksum 没有更新，导致 Cargo 验证失败。

## 解决方案

更新 `third_party/rust/encoding_rs/.cargo-checksum.json` 中的 checksum：

```bash
cd librewolf-150.0-1
sed -i 's/"src\/x_user_defined.rs":"9456ca46168ef86c98399a2536f577ef7be3cdde90c0c51392d8ac48519d3fae"/"src\/x_user_defined.rs":"b9432f9ed39742015f4bb4c3e75c89a2b9a9eef943dd0fd7cd889fddd1e6d39c"/g' third_party/rust/encoding_rs/.cargo-checksum.json
```

## 自动化修复

如果将来需要自动化这个修复，可以在 `make dir` 后添加：

```makefile
# 在 Makefile 中添加
dir: ...
	cd librewolf-$(version)-$(release)
	# ... 其他 patches ...
	# 修复 rust-build.patch 的 checksum
	sed -i 's/"src\/x_user_defined.rs":"9456ca46168ef86c98399a2536f577ef7be3cdde90c0c51392d8ac48519d3fae"/"src\/x_user_defined.rs":"b9432f9ed39742015f4bb4c3e75c89a2b9a9eef943dd0fd7cd889fddd1e6d39c"/g' third_party/rust/encoding_rs/.cargo-checksum.json
```

或者创建一个单独的 patch 来修改 `.cargo-checksum.json`。

## 验证

修复后重新编译：
```bash
make build
```

应该不再出现 checksum 错误。

---

**状态:** ✅ 已修复，编译继续进行
