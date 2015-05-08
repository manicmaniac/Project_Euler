SRCS := $(wildcard Problem*.c)
EXECUTABLES := $(SRCS:.c=)

.PHONY: all build clean

all: build

build: $(EXECUTABLES)

clean:
	rm -f $(EXECUTABLES)

EXECUTABLES: $(SRCS)

Problem2-1: Problem2-1.c
	$(CC) $< -lm -o $@

Problem4: Problem4.c
	$(CC) $< -lm -o $@

Problem7: Problem7.c
	$(CC) $< -lm -o $@

Problem9: Problem9.c
	$(CC) $< -lm -o $@

Problem10: Problem10.c
	$(CC) $< -lm -o $@

Problem13: Problem13.c
	$(CC) $< -lgmp -o $@

Problem16: Problem16.c
	$(CC) $< -lgmp -o $@

Problem20: Problem20.c
	$(CC) $< -lgmp -o $@

