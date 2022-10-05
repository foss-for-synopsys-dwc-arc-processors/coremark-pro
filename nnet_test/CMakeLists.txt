cmake_minimum_required(VERSION 3.20.0)

find_package(Zephyr)
project(zip)

# TEST set(BOARD qemu_arc_em)
target_compile_options(app PRIVATE -DUSE_TH_FILEIO=1)
target_compile_options(app PRIVATE -DFAKE_FILEIO=1)
target_compile_options(app PRIVATE -DNO_ALIGNED_ALLOC=1)
target_compile_options(app PRIVATE -DSTUB_STAT=1)

if(CONFIG_64BIT)
target_compile_options(app PRIVATE -DEE_SIZEOF_LONG=8)
target_compile_options(app PRIVATE -DEE_SIZEOF_PTR=8)
target_compile_options(app PRIVATE -DEE_PTR_ALIGN=8)
endif()

#target_compile_options(app PRIVATE -DW_WORKERS_NUM=4)
#target_compile_options(app PRIVATE -DC_CONTEXT_NUM=4)

# Specific
target_compile_options(app PRIVATE -DUSE_FP64=1)


# MITH headers
include_directories(../mith/include)
include_directories(../mith/al/include)

# MITH sources
FILE(GLOB mith_sources ../mith/al/src/*.c ../mith/src/*.c)
target_sources(app PRIVATE ${mith_sources})

# core sources
FILE(GLOB app_sources src/*.c)
target_sources(app PRIVATE ${app_sources})
