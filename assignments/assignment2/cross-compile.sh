#!/bin/sh
# Author: Nahid Sheikhipour
{
    echo "---------------------------------------- GCC VERSION / CONFIGURATION ----------------------------------------"
    aarch64-none-linux-gnu-gcc -v
    echo
    echo "------------------------------------------ SYSROOT ------------------------------------------"
    aarch64-none-linux-gnu-gcc -print-sysroot
} > cross-compile.txt 2>&1