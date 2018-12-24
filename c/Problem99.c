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

int main(int argc, const char *argv[]) {
    static const char path[] = "../resources/base_exp.txt";
    int exit_status, base, exp, lineno, max_lineno;
    double value, max_value;
    FILE *fp;

    exit_status = 0;
    fp = fopen(path, "r");
    if (!fp) {
        exit_status = 1;
    }
    if (!exit_status) {
        for (lineno = 1; fscanf(fp, "%10d,%10d\n", &base, &exp) != EOF; lineno++) {
            value = log(base) * exp;
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
