.PHONY: compile link default run

default: link 

compile:
	@echo "Compilling nasm program"
	nasm -f elf -l main.lst -o bin/main.o main.asm
	# -l creates a listing file. the machine code generated

link: compile
	@echo "Linking nasm program"
	ld -m elf_i386 -o ./bin/main ./bin/main.o

run: default
	@echo "Running program..."
	./bin/main
