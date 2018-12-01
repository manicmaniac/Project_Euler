CC := clang
SRCS := $(wildcard Problem*.c)
EXECUTABLES := $(SRCS:.c=)
LDFLAGS := -lm

.PHONY: all build clean

all: build

build: $(EXECUTABLES)

clean:
	rm -f $(EXECUTABLES)

EXECUTABLES: $(SRCS)
