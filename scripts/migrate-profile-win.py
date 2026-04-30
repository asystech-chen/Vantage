"""
Vantage Profile Migration Tool (Windows)

将旧版 Vantage 的用户配置文件从 LibreWolf 目录迁移到 Vantage 独立目录。

旧路径: %APPDATA%\librewolf\
新路径: %APPDATA%\vantage\

用法:
  python migrate-profile-win.py              # 交互模式
  python migrate-profile-win.py --dry-run    # 只预览，不执行
  python migrate-profile-win.py --auto       # 不询问，直接执行
"""

import os
import sys
import shutil
import argparse
import time
from pathlib import Path


def get_size_str(path: Path) -> str:
    """计算目录大小并返回人类可读的字符串"""
    total = 0
    try:
        for f in path.rglob("*"):
            if f.is_file():
                total += f.stat().st_size
    except (PermissionError, OSError):
        pass
    if total < 1024:
        return f"{total} B"
    elif total < 1024 * 1024:
        return f"{total / 1024:.1f} KB"
    elif total < 1024 * 1024 * 1024:
        return f"{total / (1024 * 1024):.1f} MB"
    else:
        return f"{total / (1024 * 1024 * 1024):.2f} GB"


def count_profiles(path: Path) -> list[str]:
    """列出 Profiles 子目录下的所有 profile"""
    profiles_dir = path / "Profiles"
    if not profiles_dir.exists():
        return []
    return [p.name for p in profiles_dir.iterdir() if p.is_dir()]


def check_vantage_running() -> bool:
    """检查 Vantage 是否正在运行"""
    try:
        import subprocess
        result = subprocess.run(
            ["tasklist", "/FI", "IMAGENAME eq vantage.exe", "/NH"],
            capture_output=True, text=True, timeout=5
        )
        return "vantage.exe" in result.stdout.lower()
    except Exception:
        return False


def main():
    parser = argparse.ArgumentParser(
        description="将 Vantage 配置文件从 LibreWolf 目录迁移到 Vantage 目录"
    )
    parser.add_argument("--dry-run", action="store_true",
                        help="只预览要做的操作，不实际执行")
    parser.add_argument("--auto", action="store_true",
                        help="不询问确认，直接执行迁移")
    parser.add_argument("--copy", action="store_true",
                        help="复制而非移动（保留旧目录）")
    args = parser.parse_args()

    # --- 平台检查 ---
    if sys.platform != "win32":
        print("错误: 此工具仅适用于 Windows。")
        print("Linux 用户请手动将 ~/.librewolf/ 重命名为 ~/.vantage/")
        sys.exit(1)

    # --- 路径定义 ---
    appdata = os.environ.get("APPDATA")
    if not appdata:
        print("错误: 无法获取 APPDATA 环境变量。")
        sys.exit(1)

    old_dir = Path(appdata) / "librewolf"
    new_dir = Path(appdata) / "vantage"

    print("=" * 60)
    print("  Vantage 配置文件迁移工具")
    print("=" * 60)
    print()
    print(f"  旧路径: {old_dir}")
    print(f"  新路径: {new_dir}")
    print()

    # --- 检查旧目录是否存在 ---
    if not old_dir.exists():
        print("未找到旧版配置目录，无需迁移。")
        print()
        if new_dir.exists():
            print(f"当前配置目录已存在: {new_dir}")
            profiles = count_profiles(new_dir)
            if profiles:
                print(f"  包含 {len(profiles)} 个 profile: {', '.join(profiles)}")
        else:
            print("提示: 首次启动新版 Vantage 时会自动创建配置目录。")
        sys.exit(0)

    # --- 旧目录存在，显示信息 ---
    profiles = count_profiles(old_dir)
    size_str = get_size_str(old_dir)

    print(f"找到旧版配置目录:")
    print(f"  大小: {size_str}")
    if profiles:
        print(f"  Profiles ({len(profiles)}):")
        for p in profiles:
            print(f"    - {p}")
    else:
        print("  (未找到 profile 子目录)")
    print()

    # --- 检查新目录是否已存在 ---
    if new_dir.exists():
        new_profiles = count_profiles(new_dir)
        if new_profiles:
            print("警告: 新目录已存在且包含 profile！")
            print(f"  {new_dir}")
            print(f"  Profiles: {', '.join(new_profiles)}")
            print()
            print("为避免数据冲突，迁移已取消。")
            print("如需强制迁移，请先手动删除或重命名新目录。")
            sys.exit(1)
        else:
            print(f"注意: 新目录已存在但为空或无 profile，将合并。")
            print()

    # --- 检查 Vantage 是否在运行 ---
    if check_vantage_running():
        print("错误: 检测到 Vantage 正在运行！")
        print("请先关闭 Vantage，然后重新运行此工具。")
        sys.exit(1)

    # --- dry-run 模式 ---
    if args.dry_run:
        action = "复制" if args.copy else "移动"
        print(f"[预览模式] 将执行以下操作:")
        print(f"  {action}: {old_dir}")
        print(f"     -> {new_dir}")
        if not args.copy:
            print(f"  旧目录将被删除。")
        print()
        print("如需执行，去掉 --dry-run 参数重新运行。")
        sys.exit(0)

    # --- 确认 ---
    if not args.auto:
        action = "复制" if args.copy else "移动"
        print(f"即将{action}配置文件:")
        print(f"  {old_dir}")
        print(f"  -> {new_dir}")
        if not args.copy:
            print(f"  (旧目录将被删除)")
        print()
        confirm = input("确认执行? [y/N] ").strip().lower()
        if confirm not in ("y", "yes"):
            print("已取消。")
            sys.exit(0)
        print()

    # --- 执行迁移 ---
    action_name = "复制" if args.copy else "移动"
    print(f"正在{action_name}配置文件...")

    try:
        if args.copy:
            shutil.copytree(old_dir, new_dir, dirs_exist_ok=True)
        else:
            # 先尝试 rename（同分区下是原子操作，瞬间完成）
            try:
                old_dir.rename(new_dir)
            except OSError:
                # 跨分区或目标已存在部分内容，回退到复制+删除
                print("  (跨分区移动，使用复制+删除模式...)")
                shutil.copytree(old_dir, new_dir, dirs_exist_ok=True)
                shutil.rmtree(old_dir)

        print()
        print("=" * 60)
        print(f"  迁移完成！")
        print("=" * 60)
        print()
        print(f"  新路径: {new_dir}")
        new_profiles = count_profiles(new_dir)
        if new_profiles:
            print(f"  Profiles ({len(new_profiles)}): {', '.join(new_profiles)}")
        if not args.copy:
            print(f"  旧目录已删除: {old_dir}")
        else:
            print(f"  旧目录已保留: {old_dir}")
        print()
        print("现在可以启动新版 Vantage 了。")

    except PermissionError as e:
        print(f"\n错误: 权限不足 - {e}")
        print("请确保 Vantage 已完全关闭，然后以管理员身份重试。")
        sys.exit(1)
    except Exception as e:
        print(f"\n错误: {e}")
        print("迁移失败，请手动操作。")
        sys.exit(1)


if __name__ == "__main__":
    main()
