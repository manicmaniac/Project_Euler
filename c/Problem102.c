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

double cross_product(double complex a, double complex b) {
    return creal(a) * cimag(b) - creal(b) * cimag(a);
}

bool contains_origin(double complex a, double complex b, double complex c) {
    double p = cross_product(a, b);
    double q = cross_product(b, c);
    double r = cross_product(c, a);
    return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0);
}

int main(void) {
    static const char path[] = "../resources/triangles.txt";
    FILE *fp = fopen(path, "rb");
    if (!fp) {
        perror(path);
        return errno;
    }
    int count = 0;
    double ax, ay, bx, by, cx, cy;
    while (fscanf(fp, "%lf,%lf,%lf,%lf,%lf,%lf\n", &ax, &ay, &bx, &by, &cx, &cy) != EOF) {
        double complex a = ax + ay * I;
        double complex b = bx + by * I;
        double complex c = cx + cy * I;
        if (contains_origin(a, b, c)) {
            count++;
        }
    }
    if (ferror(fp)) {
        perror(path);
        fclose(fp);
        return errno;
    }
    fclose(fp);
    printf("%d\n", count);
    return 0;
}
