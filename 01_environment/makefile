TOOL_PREFIX := arm-none-eabi-
AS  := ${TOOL_PREFIX}as
CC  := ${TOOL_PREFIX}gcc
LD  := ${TOOL_PREFIX}ld
OBJCOPY  := ${TOOL_PREFIX}objcopy

CPU := arm926ej-s
QEMU_BOARD := versatilepb

PROJECT := hello_world
LD_FILE := linkfile.ld
CLEAN_FILE := ${PROJECT}.o start.o ${ELF_FILE} ${BIN_FILE}

all:
	${AS} -mcpu=${CPU} -g start.S -o start.o
	${CC} -c -mcpu=${CPU} -g ${PROJECT}.c -o ${PROJECT}.o
	${LD} -T ${LD_FILE} ${PROJECT}.o start.o -o ${PROJECT}.elf
	${OBJCOPY} -O binary ${PROJECT}.elf ${PROJECT}.bin

clean:
	@rm -rf *.o *.bin *.elf

run: 
	@qemu-system-arm -M ${QEMU_BOARD} -m 128M -nographic -kernel ${PROJECT}.bin