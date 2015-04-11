SRCS := $(wildcard Problem*.c)
EXECUTABLES := $(SRCS:.c=)

.PHONY: all build clean

all: build

build: $(EXECUTABLES)

clean:
	rm -f $(EXECUTABLES)

EXECUTABLES: $(SRCS)

Problem4: Problem4.c
	$(CC) $< -lm -o $@

Problem10: Problem10.c
	$(CC) $< -lm -o $@

Problem13: Problem13.c
	$(CC) $< -lgmp -o $@

