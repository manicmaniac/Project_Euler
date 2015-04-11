#!/bin/sh

seq 1000 | sed -e '{
    1i\
define felm(n) { \
    if (n % 2) { \
        for (i=1; i<n; i++) { \
            if ((10 ^ i) % n == 1) { \
                return i; \
            } \
        } \
    } \
}
    s/.*/felm(&)/
}' | bc | cat -n | sort -nrk2 | awk 'NR==1 {print $1}'

