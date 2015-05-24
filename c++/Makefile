SRCS := $(wildcard Problem*.cc)
EXECUTABLES :=$(SRCS:.cc=)

CFLAGS: -std=c++0x

.PHONY: all build clean

all: build

build: $(EXECUTABLES)

clean:
	rm -f $(EXECUTABLES)

EXECUTABLES: $(SRCS)

