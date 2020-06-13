SRCS = $(wildcard Problem*.cc)
EXECUTABLES = $(SRCS:.cc=)
CXXFLAGS = -std=c++11 -O2 -Wall -Wpedantic
LDFLAGS = -lc++ -lm

.PHONY: all clean

all: $(EXECUTABLES)

clean:
	$(RM) $(EXECUTABLES)
