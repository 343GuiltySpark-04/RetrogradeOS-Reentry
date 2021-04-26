

SOURCE_DIR=./src






all: build


build:  clean
	mkdir -p ./bin
	nasm -fbin $(SOURCE_DIR)/kernel.asm -o ./bin/guidance.bin
	dd if=./bin/guidance.bin of=floppy-guidance.img



clean:
	rm -rf ./bin
	rm -f ./*.img



proto: clean
	mkdir -p ./bin
	nasm -fbin $(SOURCE_DIR)/proto-kernel.asm -o ./bin/proto-guidance.bin
	dd if=./bin/proto-guidance.bin of=floppy-proto-guidance.img
