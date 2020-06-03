/*
 * Comparing two numbers written in index form like 2^11 and 3^7 is not difficult,
 * as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
 *
 * However, confirming that 632382^518061 > 519432^525806 would be much more
 * difficult, as both numbers contain over three million digits.
 *
 * Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
 * containing one thousand lines with a base/exponent pair on each line, determine
 * which line number has the greatest numerical value.
 *
 * NOTE: The first two lines in the file represent the numbers in the example
 * given above.
 */

#include <stdio.h>
#include <math.h>

int main(void) {
    int exit_status = 0;
    static const char path[] = "../resources/base_exp.txt";
    FILE *fp = fopen(path, "r");
    if (!fp) {
        exit_status = 1;
    }
    int max_lineno = 0;
    double max_value = 0;
    if (!exit_status) {
        int base, exp;
        for (int lineno = 1; fscanf(fp, "%10d,%10d\n", &base, &exp) != EOF; lineno++) {
            double value = log(base) * exp;
            if (max_value < value) {
                max_value = value;
                max_lineno = lineno;
            }
        }
        if (ferror(fp)) {
            exit_status = 1;
        }
    }
    if (fp) {
        fclose(fp);
    }
    printf("%d\n", max_lineno);
    return exit_status;
}
