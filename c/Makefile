SRCS = $(wildcard Problem*.c)
EXECUTABLES = $(SRCS:.c=)
CFLAGS = -std=c99 -O2 -Wall -Wpedantic
LDFLAGS = -lm

.PHONY: all clean

all: $(EXECUTABLES)

clean:
	$(RM) $(EXECUTABLES)
