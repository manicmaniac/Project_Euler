/*
 * Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
 * containing over five-thousand first names, begin by sorting it into
 * alphabetical order. Then working out the alphabetical value for each name,
 * multiply this value by its alphabetical position in the list to obtain a name
 * score.
 *
 * For example, when the list is sorted into alphabetical order, COLIN, which is
 * worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
 * obtain a score of 938 × 53 = 49714.
 *
 * What is the total of all the name scores in the file?
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int letter_score(char letter) {
    return letter - ('A' - 1);
}

int name_score(const char *name) {
    int score = 0;
    char c;
    for (size_t i = 0; (c = name[i]) != '\0'; i++) {
        score += letter_score(c);
    }
    return score;
}

int main(void) {
    static const char path[] = "../resources/names.txt";
    char name_list[8192][32];
    int exit_status = 0;
    FILE *fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        exit_status = 1;
    }
    size_t i, j;
    if (!exit_status) {
        char name[32];
        for (i = 0; fscanf(fp, "\"%[A-Z]\",", name) != EOF ; i++) {
            for (j = 0; j < 32; j++) {
                name_list[i][j] = name[j];
            }
        }
        if (ferror(fp)) {
            perror(path);
            exit_status = 1;
        }
    }
    if (!exit_status) {
        size_t names_count = i;
        size_t name_length = j;
        qsort(name_list, names_count, name_length, (int (*)(const void *, const void *))strcmp);
        int total = 0;
        for (i = 0; i < names_count; i++) {
            total += name_score(name_list[i]) * (i + 1);
        }
        printf("%d\n", total);
    }
    if (fp) {
        fclose(fp);
    }
    return exit_status;
}
