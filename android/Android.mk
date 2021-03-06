LOCAL_PATH := $(call my-dir)

sdl_libs=../external/SDL/build/android/lib

include $(CLEAR_VARS)
LOCAL_MODULE := SDL2
LOCAL_SRC_FILES := $(sdl_libs)/$(TARGET_ARCH_ABI)/libSDL2.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_image
LOCAL_SRC_FILES := $(sdl_libs)/$(TARGET_ARCH_ABI)/libSDL2_image.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := mpg123
LOCAL_SRC_FILES := $(sdl_libs)/$(TARGET_ARCH_ABI)/libmpg123.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := SDL2_mixer
LOCAL_SRC_FILES := $(sdl_libs)/$(TARGET_ARCH_ABI)/libSDL2_mixer.so
include $(PREBUILT_SHARED_LIBRARY)



include $(CLEAR_VARS)
ENG_DIR := ../engine
LOCAL_MODULE := PisteEngine
LOCAL_C_INCLUDES := ../external/SDL/include ../external/SDL_image ../external/SDL_mixer
LOCAL_SRC_FILES := $(wildcard $(ENG_DIR)/*.cpp)
LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer mpg123
LOCAL_CFLAGS += -DUSE_LOCAL_SDL
include $(BUILD_STATIC_LIBRARY)




include $(CLEAR_VARS)
SRC_DIR := ../src
LOCAL_MODULE := PK2
LOCAL_C_INCLUDES := $(SRC_DIR) $(ENG_DIR)
LOCAL_SRC_FILES := $(SRC_DIR)/map.cpp $(SRC_DIR)/sprite.cpp $(SRC_DIR)/pk2.cpp
LOCAL_STATIC_LIBRARIES := PisteEngine
LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -llog
include $(BUILD_SHARED_LIBRARY)
