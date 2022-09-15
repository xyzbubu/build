#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=automount
PKG_VERSION:=1
PKG_RELEASE:=39
PKG_CONFIG_DEPENDS:=CONFIG_TARGET_ramips

include $(INCLUDE_DIR)/package.mk

define Package/automount
  TITLE:=mount and format autoconfig hotplug script.
  MAINTAINER:=Lean &sirpdboy

  DEPENDS:=+block-mount +kmod-fs-exfat +kmod-fs-ext4 +kmod-fs-vfat +libblkid +ntfs-3g +fdisk\
	+kmod-usb-storage +kmod-usb-storage-extras +!TARGET_ramips:kmod-usb-storage-uas +ntfs3-mount
  PKGARCH:=all
endef

define Package/automount/description
  A usb autoconfig hotplug script.
endef

define Build/Compile
	true
endef

define Package/automount/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/block
	$(INSTALL_BIN) ./files/15-automount $(1)/etc/hotplug.d/block/
	$(INSTALL_BIN) ./files/zzz-move-automount $(1)/etc/uci-defaults/zzz-move-automount
endef

$(eval $(call BuildPackage,automount))
