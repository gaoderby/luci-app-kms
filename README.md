# OpenWrt KMS Feed

这是一个整合了 vlmcsd 和 luci-app-vlmcsd 的标准 OpenWrt feed 仓库。

## 包含的包
- `vlmcsd`: KMS 服务端 (来自 gaoderby/openwrt-vlmcsd)
- `luci-app-vlmcsd`: KMS 的 LuCI 界面 (来自 gaoderby/luci-app-vlmcsd)

## 使用方法

### 方式1：直接添加到 feeds.conf.default（推荐）
在 OpenWrt 的 `feeds.conf.default` 中添加：
```
src-git kms https://github.com/你的用户名/luci-app-kms.git
```

然后运行：
```
./scripts/feeds update kms
./scripts/feeds install -p kms vlmcsd luci-app-vlmcsd
```

### 方式2：作为独立 feed 使用
```
mkdir custom-feeds
cd custom-feeds
git clone https://github.com/你的用户名/luci-app-kms.git
# 然后在 feeds.conf.default 中添加：
src-link kms /path/to/custom-feeds/luci-app-kms
```

## 自动同步
本仓库通过 GitHub Actions 自动同步上游更新，通常每天自动同步一次。

## 许可证
- vlmcsd: 遵循其上游许可证
- luci-app-vlmcsd: 遵循其上游许可证
