

SOURCE_DIR=./src
BIN_DIR=./bin





all: build build-iso


build:  clean
	mkdir -p $(BIN_DIR)
	nasm -felf32 $(SOURCE_DIR)/kernel.asm -o $(BIN_DIR)/guidance.bin



build-iso:
	./mk-iso.sh



clean:
	rm -rf $(BIN_DIR)
	rm -f ./*.iso
	rm -rf ./isodir
	rm -f ./*.cfg
	rm -f ./*.img


bochs-clean:
	rm -f ./*.txt
