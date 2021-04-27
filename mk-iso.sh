#!/bin/bash


cat > grub.cfg << "EOF"

menuentry "RetrogradeOS" {
	multiboot /boot/guidance.bin
}

EOF


mkdir -p isodir/boot/grub

cp bin/guidance.bin isodir/boot/guidance.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o retrogradeOS.iso isodir
