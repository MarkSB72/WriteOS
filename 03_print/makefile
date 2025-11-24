TOOL_PREFIX := arm-none-eabi-
CC = ${TOOL_PREFIX}gcc
LD = ${TOOL_PREFIX}ld
OBJCOPY = ${TOOL_PREFIX}objcopy

CFLAGSS = -O2 -g -fno-builtin 
ASFLAGS = -O2 -g
LDFLAGS = -Tmarkos.lds

OBJS = start.o init.o boot.o abnormal.o mmu.o print.o

.c.o:
	$(CC) $(CFLAGSS) -c $<

.s.o:
	$(CC) $(ASFLAGS) -c $<

markos: $(OBJS)
	$(CC) -static -nostartfiles -nostdlib $(LDFLAGS) $? -o $@ -lgcc
	$(OBJCOPY) -O binary $@ markos.bin

clean:
	rm *.o markos markos.bin -f


QEMU_BOARD := versatilepb
run: clean markos
	@qemu-system-arm -M ${QEMU_BOARD} -m 128M -nographic -kernel markos.bin