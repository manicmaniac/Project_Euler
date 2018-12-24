/*
 * The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
 * so the first ten triangle numbers are:
 *
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 *
 * By converting each letter in a word to a number corresponding to its
 * alphabetical position and adding these values we form a word value. For
 * example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
 * is a triangle number then we shall call the word a triangle word.
 *
 * Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
 * containing nearly two-thousand common English words, how many are triangle
 * words?
 */

#include <math.h>
#include <stdio.h>

int is_triangle(int x) {
    double result;

    result = (sqrt(8 * x + 1) - 1) / 2;
    return result == (int)result;
}

int word_score(const char *word) {
    int i, result;
    char c;

    for (result = i = 0; (c = word[i]) != '\0'; i++) {
        result += c - 64;
    }
    return result;
}

int main(int argc, const char *argv[]) {
    static const char path[] = "../resources/words.txt";
    int exit_status, count;
    char word[64];
    FILE *fp;

    exit_status = 0;
    fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        exit_status = 1;
    }
    if (!exit_status) {
        count = 0;
        while (fscanf(fp, "\"%64[A-Z]\",", word) != EOF) {
            if (is_triangle(word_score(word))) {
                count++;
            }
        }
        if (ferror(fp)) {
            perror(path);
            exit_status = 1;
        }
    }
    if (fp) {
        fclose(fp);
    }
    printf("%d\n", count);
    return exit_status;
}
