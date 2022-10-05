# About

CoreMark®-PRO-Zephyr is a clone of official CoreMark®-PRO release which can be found at the [EEMBC CoreMark-PRO website](https://www.eembc.org/coremark-pro/), ported to Zephyr OS.

Zephyr OS is the closest environment to run the CoreMark®-PRO in a threaded baremetal environment.


## How to run it

1. Install [Zephyr OS](https://github.com/zephyrproject-rtos/zephyr).

2. Clone/copy this repository inside of the `zephyrproject/zephyr`

3. In the above folder, type `west build -p -b <myBoard> core && west build -t run`

You can use instead of `core` any other benchmark name (i.e., cjpeg-rose7-preset parser-125k sha-test zip-test).
