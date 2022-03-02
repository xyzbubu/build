# Copyright (C) 2008-2019 Jerrykuku
# Copyright (C) 2019-2022 sirpdboy
# http://www.github.com/sirpdboy/luci-theme-tiktok
# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

THEME_NAME:=tiktok
THEME_TITLE:=Tiktok Theme

PKG_NAME:=luci-theme-$(THEME_NAME)
PKG_VERSION:=1.0.0
PKG_RELEASE:=20220301

include $(INCLUDE_DIR)/package.mk

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh

rm -Rf /tmp/luci*
exit 0

endef
# call BuildPackage - OpenWrt buildroot signature
