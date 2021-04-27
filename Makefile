

SOURCE_DIR=./src
BIN_DIR=./bin


ELFEDIT=i686-elf-elfedit
OBJCOPY=i686-elf-objcopy
STRIP=i686-elf-strip



all: clean build strip build-iso


build:  clean
	mkdir -p $(BIN_DIR)
	nasm -felf32 -g -Fdwarf $(SOURCE_DIR)/kernel.asm -o $(BIN_DIR)/guidance.bin
	$(ELFEDIT) --output-type exec $(BIN_DIR)/guidance.bin
	$(OBJCOPY) --only-keep-debug $(BIN_DIR)/guidance.bin ./guidance.sym  
	

strip:
	$(STRIP) $(BIN_DIR)/guidance.bin



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
