# About

CoreMark®-PRO-Zephyr is a clone of official CoreMark®-PRO release which can be found at the [EEMBC CoreMark-PRO website](https://www.eembc.org/coremark-pro/), ported to Zephyr OS.

Zephyr OS is the closest environment to run the CoreMark®-PRO in a threaded baremetal environment.


## How to run it

1. Install [Zephyr OS](https://github.com/zephyrproject-rtos/zephyr).
   NOTE: it was tested on v3.2.0 Zephyr version on ARC with Zephyr SDK 0.15.0

2. Setup Zephyr environment (including `ZEPHYR_BASE` variable!):

```
export ZEPHYR_BASE=/__YOUR_PATH__/workplace/zephyr
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/__YOUR_PATH__/zephyr-sdk/zephyr-sdk-0.15.0
```

3. Clone this repository and go to it.

4. In the coremark-pro repo folder, type `west build -b <my-board> <benchmark> && ninja -C build -v run`

You can use instead of `core` any other benchmark name (i.e., cjpeg-rose7-preset parser-125k sha-test zip-test).
