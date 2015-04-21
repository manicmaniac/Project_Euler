#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int letter_score(const char letter) {
    return letter - ('A' - 1);
}

int name_score(const char *name) {
    int score = 0;
    int i;
    char c;
    for (i = 0; (c = name[i]) != '\0'; i++) {
        score += letter_score(c);
    }
    return score;
}

int main(int argc, char const* argv[]) {
    const char *names_txt = "../resources/names.txt";
    FILE *fp = fopen(names_txt, "r");
    if (!fp) {
        return 1;
    }
    char name[32];
    char name_list[8192][32];
    int i, j;
    for (i = 0; fscanf(fp, "\"%[A-Z]\",", name) != EOF ; i++) {
        for (j = 0; j < 32; j++) {
            name_list[i][j] = name[j];
        }
    }
    const int names_count = i;
    const int name_length = j;
    qsort(name_list, names_count, name_length, (int (*)(const void *, const void *))strcmp);
    int total = 0;
    for (i = 0; i < names_count; i++) {
        total += name_score(name_list[i]) * (i + 1);
    }
    printf("%d\n", total);
    return 0;
}

