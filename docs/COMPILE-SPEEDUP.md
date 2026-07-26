# Vantage 编译加速方案（待实施）

> 2026-07-23 调研，基于 FF153 源码验证

## 已验证的 mozconfig 选项

```bash
ac_add_options --with-ccache=sccache    # 编译缓存（C++/Rust）
ac_add_options --enable-linker=mold     # 高速链接器
mk_add_options MOZ_MAKE_FLAGS="-j20"   # 并行编译（留4核给系统）
```

## 证据

**sccache** — `build/moz.configure/toolchain.configure:826`
- 官方 `--with-ccache` 选项，支持值为 `sccache`
- 自动在 PATH 中检测 sccache

**mold** — `build/moz.configure/toolchain.configure:1705`  
- FF153 内置 mold 支持：`valid_linkers = ("bfd", "gold", "lld", "mold")`
- 自动检测已安装的 mold（line 1801）

## 安装

```bash
apt install sccache mold
```

## 效果评估

| 场景 | 预期收益 |
|------|---------|
| 小版本升级 | 80% 编译命中，6h → 1h |
| 改一个 patch | 几乎全命中，数分钟 |
| 首次全量 | 无缓存收益，但 mold 链接快 2-3x |
| FF 大版本 | 30-50% 命中率 |

## 注意事项

- sccache 缓存占用约 5-10GB 磁盘，存放在 `~/.cache/sccache/`
- mold 兼容性极好，Mozilla CI 也在用
- 需要 `sccache` 和 `mold` 二进制在 PATH 中
- 当前 mozconfig（`assets/mozconfig.new` 和源码树 `mozconfig`）需要同步添加
