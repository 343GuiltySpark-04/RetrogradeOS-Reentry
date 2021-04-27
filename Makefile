

SOURCE_DIR=./src






all: build


build:  clean
	mkdir -p ./bin
	nasm -fbin $(SOURCE_DIR)/kernel.asm -o ./bin/guidance.bin
	./mk-iso.sh



clean:
	rm -rf ./bin
	rm -f ./*.iso
	rm -rf ./isodir
	rm -f ./*.cfg
	rm -f ./*.img


bochs-clean:
	rm -f ./*.txt
