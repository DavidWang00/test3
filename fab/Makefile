CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O0 -Wall -g
LDFLAGS = -fno-stack-protector

objects	=  fib.o



.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s


%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	yes 7 | $(call QEMU_CMD)
	arm-none-eabi-gdb -x gdbscript fibseq