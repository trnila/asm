all: a.out

%.o: %.s
	nasm -f elf64 $<

a.out: main.o
	ld -o $@ $^

.PHONY: clean
clean:
	rm -f *.o a.out
