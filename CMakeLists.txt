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
include_directories(mith/include)
include_directories(mith/al/include)

# MITH sources
FILE(GLOB mith_sources mith/al/src/*.c mith/src/*.c)
target_sources(app PRIVATE ${mith_sources})

# Input arguments
target_sources(app PRIVATE main-args.c)

# CoreMark Pro sources
FILE(GLOB app_sources benchmarks/core/*.c)
target_sources(app PRIVATE ${app_sources})
target_sources(app PRIVATE workloads/core/core.c)

set_ifndef(W_WORKERS_NUM 4)
target_compile_options(app PRIVATE "-D W_WORKERS_NUM=${W_WORKERS_NUM}")

set_ifndef(C_CONTEXT_NUM 4)
target_compile_options(app PRIVATE "-D C_CONTEXT_NUM=${C_CONTEXT_NUM}")

set_ifndef(I_ITERATION_NUM 1)
target_compile_options(app PRIVATE "-D I_ITERATION_NUM=${I_ITERATION_NUM}")

