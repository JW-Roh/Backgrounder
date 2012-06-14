TWEAK_NAME = TrueMultitasking
APP_ID = me.devbug.backgrounderxforios5

TrueMultitasking_OBJCC_FILES = main.mm \
						   ApplicationHooks.mm \
						   BackgrounderActivator.mm \
						   SimplePopup.mm \
						   SpringBoardHooks.mm
TrueMultitasking_CFLAGS = -F$(SYSROOT)/System/Library/CoreServices -DAPP_ID=\"$(APP_ID)\"
TrueMultitasking_LDFLAGS = -lactivator
TrueMultitasking_FRAMEWORKS = UIKit CoreGraphics
TrueMultitasking_PRIVATE_FRAMEWORKS = GraphicsServices

# NOTE: For some unknown reason, optimization flag -O2 causes fallbackToNative
#       check to fail in ApplicationHooks' applicationSuspend: method.
OPTFLAG = -O1

include ../theos/makefiles/common.mk
include ../theos/makefiles/tweak.mk
