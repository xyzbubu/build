 
# Copyright (C) 2010-2011 OpenWrt.org
#
#  2021-2022 by sirpdboy  (sirpdboy@qq.com)
#  2020  by lean
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autocore
PKG_VERSION:=2
PKG_RELEASE:=7

PKG_CONFIG_DEPENDS:= \
	CONFIG_TARGET_bcm27xx \
	CONFIG_TARGET_bcm53xx
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/target.mk

define Package/autocore-arm
  TITLE:=Arm auto core loadbalance script.
  MAINTAINER:=CN_SZTL
  DEPENDS:=@(arm||aarch64) \
    +TARGET_bcm27xx:bcm27xx-userland \
    +TARGET_bcm53xx:nvram
  VARIANT:=arm
endef

define Package/autocore-x86
  TITLE:=x86/x64 auto core loadbalance script.
  MAINTAINER:=Lean
  DEPENDS:=@TARGET_x86 +bc +lm-sensors +ethtool
  VARIANT:=x86
endef

define Package/autocore-arm/description
  A luci autoconfig hotplug script.
endef

define Package/autocore-x86/description
  A usb autoconfig hotplug script.
endef

define Build/Compile
endef

define Package/autocore/install/Default
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/generic/cntime $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/cpuinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/cpuspeed $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/ethinfo $(1)/sbin/
endef


define Package/autocore-arm/install
	$(call Package/autocore/install/Default,$(1))
	$(INSTALL_DIR) $(1)/sbin

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/arm/090-cover-index_htm $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/arm/index.htm $(1)/etc/

ifneq ($(filter ipq% %mt7622, $(TARGETID)),)
	$(INSTALL_BIN) ./files/arm/tempinfo $(1)/sbin/
endif
endef

define Package/autocore-x86/install
	$(call Package/autocore/install/Default,$(1))
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/x86/autocore $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/x86/index.htm $(1)/etc/index.htm
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/x86/tempinfo $(1)/sbin/
endef

$(eval $(call BuildPackage,autocore-arm))
$(eval $(call BuildPackage,autocore-x86))
