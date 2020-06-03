/*
 * In the 5 by 5 matrix below, the minimal path sum from the top left to the
 * bottom right, by only moving to the right and down, is indicated in bold red
 * and is equal to 2427.
 *
 * $$ \begin{pmatrix} \color{red}{131} & 673 & 234 & 103 & 18\\ \color{red}{201} &
 * \color{red}{96} & \color{red}{342} & 965 & 150\\ 630 & 803 & \color{red}{746} &
 * \color{red}{422} & 111\\ 537 & 699 & 497 & \color{red}{121} & 956\\ 805 & 732 &
 * 524 & \color{red}{37} & \color{red}{331} \end{pmatrix} $$
 *
 * Find the minimal path sum, in matrix.txt (right click and "Save Link/Target
 * As..."), a 31K text file containing a 80 by 80 matrix, from the top left to the
 * bottom right by only moving right and down.
 */

#include <stdio.h>

#define MIN(a, b)  (a < b ? a : b)

int main(void) {
    int exit_status = 0;
    static const char path[] = "../resources/matrix.txt";
    FILE *fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        exit_status = 1;
    }
    int matrix[80][80];
    if (!exit_status) {
        int x;
        for (size_t i = 0; fscanf(fp, "%d,", &x) > 0; i++) {
            matrix[i / 80][i % 80] = x;
        }
    }
    if (!exit_status && ferror(fp)) {
        perror(path);
        exit_status = 1;
    }
    if (fp) {
        fclose(fp);
    }
    for (int y = 0; y < 80; y++) {
        for (int x = 0; x < 80; x++) {
            if (x * y) {
                matrix[y][x] += MIN(matrix[y - 1][x], matrix[y][x - 1]);
            } else if (x + y == 0) {
                continue;
            } else if (x == 0) {
                matrix[y][x] += matrix[y - 1][x];
            } else if (y == 0) {
                matrix[y][x] += matrix[y][x - 1];
            }
        }
    }
    printf("%d\n", matrix[79][79]);
    return exit_status;
}
