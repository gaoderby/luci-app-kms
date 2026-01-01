#!/bin/bash
# sync-upstream.sh - 同步上游仓库到标准格式

set -e

echo "🚀 开始同步上游仓库..."

# 清理并重新创建目录
echo "🧹 清理目录..."
rm -rf package/network/vlmcsd
rm -rf luci/applications/luci-app-vlmcsd
mkdir -p package/network/vlmcsd
mkdir -p luci/applications/luci-app-vlmcsd

# 同步 vlmcsd
echo "📦 同步 vlmcsd (来自 OneNAS-space/vlmcsd)..."
git clone --depth=1 https://github.com/OneNAS-space/vlmcsd.git /tmp/vlmcsd-upstream

# 复制文件（排除 .git 目录）
cp -r /tmp/vlmcsd-upstream/* package/network/vlmcsd/ 2>/dev/null || true

# 清理
rm -rf /tmp/vlmcsd-upstream

# 同步 luci-app-vlmcsd
echo "🎨 同步 luci-app-vlmcsd (来自 OneNAS-space/luci-app-vlmcsd)..."
git clone --depth=1 https://github.com/OneNAS-space/luci-app-vlmcsd.git /tmp/luci-vlmcsd-upstream

# 复制文件（排除 .git 目录）
cp -r /tmp/luci-vlmcsd-upstream/* luci/applications/luci-app-vlmcsd/ 2>/dev/null || true

# 清理
rm -rf /tmp/luci-vlmcsd-upstream

# 创建 feeds.conf 示例
echo "📝 创建 feeds.conf 示例..."
cat > feeds.conf.example << 'EOF2'
# KMS Feed 配置示例
src-git kms https://github.com/gaoderby/luci-app-kms.git
EOF2

echo "✅ 同步完成！"
echo ""
echo "请运行以下命令提交更改："
echo "git add ."
echo "git commit -m '同步上游仓库: $(date +'%Y-%m-%d')'"
echo "git push origin main"
