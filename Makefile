export FW_DEVICE_IP = 192.168.1.2
SUBPROJECTS = Extension Preferences Updater
export ADDITIONAL_CFLAGS += -I../Common
export CURRENT_VERSION = 11010

include theos/makefiles/common.mk
include theos/makefiles/aggregate.mk

after-stage::
	# Convert Info.plist and Defaults.plist to binary
	- find $(FW_STAGING_DIR)/Applications -iname '*.plist' -exec plutil -convert binary1 {} \;

ri:: remoteinstall
remoteinstall:: all internal-remoteinstall after-remoteinstall
internal-remoteinstall::
	scp -P 22 "Extension/obj/TrueMultitasking.dylib" root@$(FW_DEVICE_IP):
	scp -P 22 "Preferences/obj/Preferences" root@$(FW_DEVICE_IP):
	ssh root@$(FW_DEVICE_IP) "mv TrueMultitasking.dylib /Library/MobileSubstrate/DynamicLibraries/"
	ssh root@$(FW_DEVICE_IP) "mv Preferences /Applications/TrueMultitasking.app/"
after-remoteinstall::
	ssh root@$(FW_DEVICE_IP) "killall -9 SpringBoard"
