#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void reverse(char *str) {
    if (str) {
	char *end = str + strlen(str) - 1;
#define SWAP(a, b) do { a ^= b; b ^= a; a ^= b; } while (0)
	while (str < end) {
	    SWAP(*str, *end);
	    str++;
	    end--;
	}
#undef SWAP
    }
}

int palindrome(int n) {
    const size_t bufsize = 10;
    char buffer[bufsize];
    char copied[bufsize * 2];
    snprintf(buffer, bufsize, "%d", n);
    memcpy(copied, buffer, bufsize);
    reverse(buffer);
    snprintf(copied, bufsize * 2, "%s%s", copied, buffer);
    return atoi(copied);
}

char is_product(int n) {
    double limit = sqrt(n);
    int i;
    div_t d;
    for (i = 100; i < limit; i++) {
        d = div(n, i);
        if (d.rem == 0 && d.quot < 1000) {
            return 1;
        }
    }
    return 0;
}

int main(int argc, char const* argv[])
{
    const max = 999;
    const min = 100;
    int i, pal;
    for (i = max; i > min; i--) {
	pal = palindrome(i);
	if (is_product(pal)) {
	    break;
	}
    }
    printf("%d\n", pal);
    return 0;
}

