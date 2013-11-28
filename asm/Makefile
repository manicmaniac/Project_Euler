# Macro definitions
TARGET = 
ASM = nasm -f elf64
LD = ld
LDFLAGS = -s -o

# Make rules

.s.o:
	$(ASM) $< -l $*.lst

all: $(TARGET)

clean:
	rm -f $(TARGET).o $(TARGET).lst $(TARGET)

$(TARGET): $(TARGET).o
	$(LD) $(LDFLAGS) $@ $<

