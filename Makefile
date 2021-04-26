

SOURCE_DIR=./src






all: build


build:
	nasm -g -fbin $(SOURCE_DIR)/kernel.asm -o guidance.bin



clean:
	rm ./*.bin
