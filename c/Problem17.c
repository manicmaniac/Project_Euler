/*
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 *
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 *
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char *roman_map_1_19[] = {
    NULL, "one", "two", "three", "four", "five", "six", "seven", "eight",
    "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
    "sixteen", "seventeen", "eighteen", "nineteen"
};

static const char *roman_map_20_90[] = {
    NULL, NULL, "twenty", "thirty", "forty", "fifty", "sixty", "seventy",
    "eighty", "ninety"
};

void uitor(char *buffer, unsigned int x) {
    if (!x) {
        const char *roman = "zero";
        size_t size = strlen(roman);
        memcpy(buffer, roman, size + 1);
    }
    while (x) {
        if (x < 20) {
            const char *roman = roman_map_1_19[x];
            size_t size = strlen(roman);
            memcpy(buffer, roman, size + 1);
            break;
        } else if (x < 100) {
            div_t dm = div(x, 10);
            const char *roman = roman_map_20_90[dm.quot];
            size_t size = strlen(roman);
            memcpy(buffer, roman, size + 1);
            x = dm.rem;
            buffer += size;
        } else if (x < 1000) {
            div_t dm = div(x, 100);
            const char *roman = roman_map_1_19[dm.quot];
            size_t size = strlen(roman);
            memcpy(buffer, roman, size);
            memcpy(buffer + size, "handred", 7 + 1);
            if (dm.rem) {
                memcpy(buffer + size + 7, "and", 3);
                x = dm.rem;
                buffer += size + 10;
            } else {
                break;
            }
        } else if (x == 1000) {
            const char *roman = "onethousand";
            size_t size = strlen(roman);
            memcpy(buffer, roman, size + 1);
            break;
        }
    }
}

int main(int argc, char *argv[]) {
    char buffer[32] = { 0 };
    int count = 0;
    unsigned int i;
    for (i = 1; i <= 1000; i++) {
        uitor(buffer, i);
        count += strlen(buffer);
    }
    printf("%d\n", count);
    return 0;
}
