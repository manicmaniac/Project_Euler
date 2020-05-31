/*
 * Three distinct points are plotted at random on a Cartesian plane, for which
 * -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
 *
 * Consider the following two triangles:
 *
 * A(-340,495), B(-153,-910), C(835,-947)
 *
 * X(-175,41), Y(-421,-714), Z(574,-645)
 *
 * It can be verified that triangle ABC contains the origin, whereas triangle XYZ
 * does not.
 *
 * Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
 * containing the co-ordinates of one thousand "random" triangles, find the number
 * of triangles for which the interior contains the origin.
 *
 * NOTE: The first two examples in the file represent the triangles in the example
 * given above.
 */
#include <complex.h>
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>

static const char *path = "../resources/triangles.txt";

double cross_product(double complex a, double complex b) {
    return creal(a) * cimag(b) - creal(b) * cimag(a);
}

bool contains_origin(double complex a, double complex b, double complex c) {
    double p, q, r;

    p = cross_product(a, b);
    q = cross_product(b, c);
    r = cross_product(c, a);
    return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0);
}

int main(void) {
    int ax, ay, bx, by, cx, cy;
    double complex a, b, c;
    int count;
    FILE *fp;

    if (!(fp = fopen(path, "rb"))) {
        perror(path);
        return errno;
    }
    count = 0;
    while (fscanf(fp, "%d,%d,%d,%d,%d,%d\n", &ax, &ay, &bx, &by, &cx, &cy) != EOF) {
        a = ax + ay * I;
        b = bx + by * I;
        c = cx + cy * I;
        if (contains_origin(a, b, c)) {
            count++;
        }
    }
    if (ferror(fp)) {
        perror(path);
        return errno;
    }
    fclose(fp);
    printf("%d\n", count);
    return 0;
}
