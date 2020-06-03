SRCS = $(wildcard Problem*.m)
EXECUTABLES = $(SRCS:.m=)
CFLAGS = -fno-objc-arc -O2 -Wall -Wpedantic
LDFLAGS = -framework Foundation

.PHONY: all clean

all: $(EXECUTABLES)

clean:
	$(RM) $(EXECUTABLES)
