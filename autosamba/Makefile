#
# Copyright (C) 2010-2011 OpenWrt.org
# https://github.com/sirpdboy/autosamba
# Auto share Samba ksmbd samba4
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autosamba
PKG_VERSION:=1
PKG_RELEASE:=15

include $(INCLUDE_DIR)/package.mk

define Package/autosamba
  TITLE:=Samba autoconfig hotplug script.
  MAINTAINER:=Lean&sirpdboy
  DEPENDS:=+wsdd2
  VARIANT:=samba
endef

define Package/autosamba-ksmbd
  TITLE:=Samba autoconfig hotplug script.
  MAINTAINER:=Lean&sirpdboy
  DEPENDS:=+wsdd2
  VARIANT:=ksmbd
endef

define Package/autosamba-samba4
  TITLE:=Samba autoconfig hotplug script.
  MAINTAINER:=Lean&sirpdboy
  DEPENDS:=+wsdd2
  VARIANT:=samba4
endef

define Package/autosamba/description
A hotplug script to config Samba share automatically.
endef

define Package/autosamba-ksmbd/description
A hotplug script to config ksmbd share automatically.
endef

define Package/autosamba-samba4/description
A hotplug script to config Samba4 share automatically.
endef

define Build/Compile
	true
endef

define Package/autosamba/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/block
	$(INSTALL_BIN) ./files/20-smb $(1)/etc/hotplug.d/block/20-samba
endef

define Package/autosamba/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/block
	$(INSTALL_BIN) ./files/20-smb $(1)/etc/hotplug.d/block/20-smb-ksmbd
endef

define Package/autosamba/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/block
	$(INSTALL_BIN) ./files/20-smb $(1)/etc/hotplug.d/block/20-samba4
endef

$(eval $(call BuildPackage,autosamba))
$(eval $(call BuildPackage,autosamba-ksmbd))
$(eval $(call BuildPackage,autosamba-samba4))
