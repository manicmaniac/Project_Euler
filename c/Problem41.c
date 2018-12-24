#include <math.h>
#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int c;

    c = *a;
    *a = *b;
    *b = c;
}

void permutations(int *p, size_t n, void (*callback)(int *)) {
    size_t i;

    if (n == 1) {
        return callback(p);
    }
    for (i = 0; i < n - 1; i++) {
        permutations(p, n - 1, callback);
        swap(&p[(n & 1 ? 0 : i)], &p[n - 1]);
    }
    permutations(p, n - 1, callback);
}

int is_prime(int x) {
    int i;
    double sqrt_x;

    if (x == 2) {
        return 1;
    }
    if (x < 2 || !(x & 1)) {
        return 0;
    }
    sqrt_x = sqrt(x);
    for (i = 3; i <= sqrt_x; i++) {
        if (!(x % i)) {
            return 0;
        }
    }
    return 1;
}

static void callback(int *p) {
    size_t i;
    int x;

    for (x = 7000000 + p[0], i = 5; i > 0; i--) {
        x += p[i] * pow(10, i);
    }
    if (is_prime(x)) {
        printf("%d\n", x);
        exit(0);
    }
}

int main(int argc, const char *argv[]) {
    int digits[] = {1, 2, 3, 4, 5, 6};

    permutations(digits, 6, callback);
    return 0;
}
