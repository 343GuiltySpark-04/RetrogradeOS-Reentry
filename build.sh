nasm -f bin kernel.asm -o kernel.bin
qemu-system-x86_64 kernel.bin -s

