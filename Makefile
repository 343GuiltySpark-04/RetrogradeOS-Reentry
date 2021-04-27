

SOURCE_DIR=./src
BIN_DIR=./bin


# change these to elfedit, objcopy and strip if you don't have a cross toolchain (though i reccomend you do)
ELFEDIT=i686-elf-elfedit
OBJCOPY=i686-elf-objcopy
STRIP=i686-elf-strip



all: clean build build-iso


all-strip: clean build strip build-iso


build:  clean
	mkdir -p $(BIN_DIR)
	nasm -felf32 -g -Fdwarf $(SOURCE_DIR)/kernel.asm -o $(BIN_DIR)/guidance.bin
	i686-elf-elfedit --output-type exec $(BIN_DIR)/guidance.bin
	i686-elf-objcopy --only-keep-debug $(BIN_DIR)/guidance.bin ./guidance.sym  
	

strip:
	i686-elf-strip $(BIN_DIR)/guidance.bin



build-iso:
	./mk-iso.sh



clean:
	rm -rf $(BIN_DIR)
	rm -f ./*.iso
	rm -rf ./isodir
	rm -f ./*.cfg
	rm -f ./*.img
	rm -f ./*.sym


bochs-clean:
	rm -f ./*.txt
