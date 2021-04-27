#!/bin/bash

sudo qemu-system-i386 -gdb tcp::17 -S -cdrom retrogradeOS.iso -s
