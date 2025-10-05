ASSEMBLER = nasm
LINKER = ld 
ASSEMBLER_FLAGS = -f elf
LINK_FLAGS = -m elf_i386
BINARY = bin/main

.PHONY: all run 

SRCS := $(shell find . -name "*.asm")
OBJS := $(patsubst %.asm, bin/%.o, $(SRCS))

all: $(BINARY) 

$(BINARY): $(OBJS)
	$(LINKER) $(LINK_FLAGS) $^ -o $@

bin/%.o: %.asm
	@mkdir -p $(dir $@) # dir $@ extracts the directory of the target
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) -o $@ $^

run: all 
	@echo "Running program..."
	./bin/main

clean:
	rm -rf bin
