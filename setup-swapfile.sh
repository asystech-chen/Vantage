#!/bin/bash
# Vantage - 创建大尺寸 swap 文件用于 Windows 交叉编译
# 用法：sudo ./setup-swapfile.sh

set -e

SWAP_FILE="/swapfile"
SWAP_SIZE="32G"
SWAP_PRIORITY="100"  # 高于分区的优先级（分区通常是负数）

echo ">>> 创建 ${SWAP_SIZE} swap 文件..."

# 禁用现有 swap 文件
if swapon --show | grep -q "${SWAP_FILE}"; then
    echo ">>> 禁用现有 swap 文件..."
    swapoff "${SWAP_FILE}"
fi

# 删除旧的 swap 文件
if [ -f "${SWAP_FILE}" ]; then
    echo ">>> 删除旧的 swap 文件..."
    rm -f "${SWAP_FILE}"
fi

# 创建新的 swap 文件
echo ">>> 分配 ${SWAP_SIZE} 空间..."
fallocate -l ${SWAP_SIZE} "${SWAP_FILE}"

# 设置权限
chmod 600 "${SWAP_FILE}"

# 初始化为 swap
echo ">>> 初始化 swap..."
mkswap "${SWAP_FILE}"

# 启用 swap
echo ">>> 启用 swap（优先级：${SWAP_PRIORITY}）..."
swapon -p ${SWAP_PRIORITY} "${SWAP_FILE}"

# 显示当前 swap 状态
echo ""
echo ">>> 当前 swap 状态："
cat /proc/swaps
echo ""

# 检查是否成功
if swapon --show | grep -q "${SWAP_FILE}"; then
    echo "✅ Swap 文件创建成功！"
    echo ""
    echo ">>> 持久化配置（添加到 /etc/fstab）..."
    
    # 备份 fstab
    cp /etc/fstab /etc/fstab.bak.$(date +%Y%m%d%H%M%S)
    
    # 检查是否已存在
    if ! grep -q "${SWAP_FILE}" /etc/fstab; then
        echo "${SWAP_FILE} none swap sw,pri=${SWAP_PRIORITY} 0 0" >> /etc/fstab
        echo "✅ 已添加到 /etc/fstab"
    else
        echo "⚠️  /etc/fstab 中已存在该 swap 条目"
    fi
else
    echo "❌ Swap 文件启用失败！"
    exit 1
fi

echo ""
echo ">>> 完成！Windows 交叉编译不会再因为内存不足而崩溃了。"
