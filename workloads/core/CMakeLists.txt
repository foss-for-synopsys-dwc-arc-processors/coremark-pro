cmake_minimum_required(VERSION 3.20.0)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(core)

# target_compile_options(app PRIVATE -DREPORT_THMALLOC_STATS=1)
# target_compile_options(app PRIVATE -DHOST_EXAMPLE_CODE=1)
# target_compile_options(app PRIVATE -DCORE_DEBUG=1)
# target_compile_options(app PRIVATE -DTHDEBUG=3)
# target_compile_options(app PRIVATE -DBMDEBUG=1)


target_compile_options(app PRIVATE -DNO_ALIGNED_ALLOC=1)
target_compile_options(app PRIVATE -DSTUB_STAT=1)

if(CONFIG_64BIT)
target_compile_options(app PRIVATE -DEE_SIZEOF_LONG=8)
target_compile_options(app PRIVATE -DEE_SIZEOF_PTR=8)
target_compile_options(app PRIVATE -DEE_PTR_ALIGN=8)
endif()

target_compile_options(app PRIVATE -DW_WORKERS_NUM=1)
target_compile_options(app PRIVATE -DC_CONTEXT_NUM=2)
target_compile_options(app PRIVATE -DI_ITERATION_NUM=1)


# MITH headers
include_directories(../../mith/include)
include_directories(../../mith/al/include)

# MITH sources
FILE(GLOB mith_sources ../../mith/al/src/*.c ../../mith/src/*.c)
target_sources(app PRIVATE ${mith_sources})

# core sources
FILE(GLOB app_sources core.c ../../benchmarks/core/*.c)
target_sources(app PRIVATE ${app_sources})
