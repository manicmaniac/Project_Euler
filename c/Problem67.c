/*
 * By starting at the top of the triangle below and moving to adjacent numbers on
 * the row below, the maximum total from top to bottom is 23.
 *
 * 3
 * 7 4
 * 2 4 6
 * 8 5 9 3
 *
 * That is, 3 + 7 + 4 + 9 = 23.
 *
 * Find the maximum total from top to bottom in triangle.txt (right click and
 * 'Save Link/Target As...'), a 15K text file containing a triangle with
 * one-hundred rows.
 *
 * NOTE: This is a much more difficult version of Problem 18. It is not possible
 * to try every route to solve this problem, as there are 2^99 altogether! If you
 * could check one trillion (10^12) routes every second it would take over twenty
 * billion years to check them all. There is an efficient algorithm to solve it. ;
 * o)
 */

#include <errno.h>
#include <stdio.h>

#define MAX(x, y) (x > y ? x : y)
#define TRIANGULAR(n) (((n) * ((n) + 1)) / 2)

int pyramid_route(int *pyramid, int size) {
    for (; size > 1; size--) {
        off_t offset = -size;
        for (size_t i = 1; i <= size; i++) {
            offset += i;
        }
        int *longer = pyramid + offset;
        int *shorter = longer - size + 1;
        for (size_t i = 0; i < (size - 1); i++) {
            shorter[i] += MAX(longer[i], longer[i + 1]);
        }
    }
    return pyramid[0];
}

int main(void) {
#define ROW_COUNT 100
    static const char *path = "../resources/triangle.txt";
    FILE *fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        return errno;
    }
    static int buffer[TRIANGULAR(ROW_COUNT)];
    int x;
    for (size_t i = 0; fscanf(fp, "%d", &x) != EOF; i++) {
        buffer[i] = x;
    }
    if (fclose(fp) == EOF) {
        perror(path);
        return errno;
    }
    printf("%d\n", pyramid_route(buffer, ROW_COUNT));
    return 0;
}
