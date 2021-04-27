# RetrogradeOS-Reentry
A mostly (only for now) ASM Rebuild of RetrogradeOS

# Instructions

first install `nasm`, `qemu-system-i386`. `grub` and `xorriso` from your distro repository and if your running windows don't forget to enter WSL.

next clone this repository or downlaod the zip file and run `make`,
then run `./qemu.sh`

**IMORTANT**
if you have a cross toolchain installed don't apply the patch file, otherwise if you don't (though i advise you do) run:
`patch < Makefile-no-cross.patch`


# Debugging
the debug symbols are copied to `guidance.sym` before the binary is stripped all you have to do is run `./qemu-debug.sh` and attach gdb to it.


# Credits and Thanks

I'd like to thank the fine writters and devs at https://wiki.osdev.org for the amazing insight and guides.

and https://github.com/captain-rainbow for letting me use his boot code.

as well as https://github.com/sundhaug92 for his immense help in all my linux, OS, and general computer endevors.
