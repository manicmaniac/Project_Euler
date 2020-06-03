/*
 * For a number written in Roman numerals to be considered valid there are basic
 * rules which must be followed. Even though the rules allow some numbers to be
 * expressed in more than one way there is always a "best" way of writing a
 * particular number.
 *
 * For example, it would appear that there are at least six ways of writing the
 * number sixteen:
 *
 * IIIIIIIIIIIIIIII
 * VIIIIIIIIIII
 * VVIIIIII
 * XIIIIII
 * VVVI
 * XVI
 *
 * However, according to the rules only XIIIIII and XVI are valid, and the last
 * example is considered to be the most efficient, as it uses the least number of
 * numerals.
 *
 * The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
 * contains one thousand numbers written in valid, but not necessarily minimal,
 * Roman numerals; see About... Roman Numerals for the definitive rules for this
 * problem.
 *
 * Find the number of characters saved by writing each of these in their minimal
 * form.
 *
 * Note: You can assume that all the Roman numerals in the file contain no more
 * than four consecutive identical units.
 */

#include <stdio.h>
#include <string.h>

int rtoi(const char *roman) {
    char previous = '\0';
    int result = 0;
    size_t roman_len = strlen(roman);
    for (size_t i = 0; i < roman_len; i++) {
        switch (roman[i]) {
            case 'I':
                result++;
                break;
            case 'V':
                if (previous == 'I') {
                    result += 3;
                } else {
                    result += 5;
                }
                break;
            case 'X':
                if (previous == 'I') {
                    result += 8;
                } else {
                    result += 10;
                }
                break;
            case 'L':
                if (previous == 'X') {
                    result += 30;
                } else {
                    result += 50;
                }
                break;
            case 'C':
                if (previous == 'X') {
                    result += 80;
                } else {
                    result += 100;
                }
                break;
            case 'D':
                if (previous == 'C') {
                    result += 300;
                } else {
                    result += 500;
                }
                break;
            case 'M':
                if (previous == 'C') {
                    result += 800;
                } else {
                    result += 1000;
                }
                break;
        }
        previous = roman[i];
    }
    return result;
}

void itor(char *buffer, size_t buffer_len, int x) {
    size_t i;
    for (i = 0; x > 0 && i < buffer_len; i++) {
        if (x >= 1000) {
            buffer[i] = 'M';
            x -= 1000;
        } else if (x >= 900) {
            buffer[i] = 'C';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'M';
            }
            x -= 900;
        } else if (x >= 500) {
            buffer[i] = 'D';
            x -= 500;
        } else if (x >= 400) {
            buffer[i] = 'C';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'D';
            }
            x -= 400;
        } else if (x >= 100) {
            buffer[i] = 'C';
            x -= 100;
        } else if (x >= 90) {
            buffer[i] = 'X';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'C';
            }
            x -= 90;
        } else if (x >= 50) {
            buffer[i] = 'L';
            x -= 50;
        } else if (x >= 40) {
            buffer[i] = 'X';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'L';
            }
            x -= 40;
        } else if (x >= 10) {
            buffer[i] = 'X';
            x -= 10;
        } else if (x >= 9) {
            buffer[i] = 'I';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'X';
            }
            x -= 9;
        } else if (x >= 5) {
            buffer[i] = 'V';
            x -= 5;
        } else if (x >= 4) {
            buffer[i] = 'I';
            i++;
            if (i < buffer_len) {
                buffer[i] = 'V';
            }
            x -= 4;
        } else if (x >= 1) {
            buffer[i] = 'I';
            x--;
        }
    }
    if (i < buffer_len) {
        buffer[i] = '\0';
    }
}

int main(void) {
    int exit_status = 0;
    static const char path[] = "../resources/roman.txt";
    FILE *fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        exit_status = 1;
    }
    size_t saved_length = 0;
    if (!exit_status) {
        char line[8192], roman[256];
        while (fgets(line, sizeof(line), fp)) {
            size_t line_length = strlen(line);
            if (line[line_length - 1] == '\n') {
                line_length--;
                line[line_length] = '\0'; /* strip newline */
            }
            int x = rtoi(line);
            itor(roman, sizeof(roman), x);
            saved_length += line_length - strlen(roman);
        }
        if (ferror(fp)) {
            perror(path);
            exit_status = 1;
        }
    }
    if (fp) {
        fclose(fp);
    }
    printf("%zu\n", saved_length);
    return exit_status;
}
