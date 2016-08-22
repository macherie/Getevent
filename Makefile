export SDKTARGETSYSROOT=/opt/poky/1.8/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi
export PATH=/opt/poky/1.8/sysroots/x86_64-pokysdk-linux/usr/bin:/opt/poky/1.8/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:$PATH
CC = arm-poky-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7 --sysroot=$(SDKTARGETSYSROOT)
#CC = gcc

CFLAGS += -I./inc
LDLIBS += -L./lib -lmxml_fs

OBJS2 += src/getevent.c
all:
	$(CC) $(OBJS2) -o out/getevent $(CFLAGS) -lpthread

clean:
	rm -rf out/car_control

