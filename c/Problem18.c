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
 * Find the maximum total from top to bottom of the triangle below:
 * 
 * NOTE: As there are only 16384 routes, it is possible to solve this problem by
 * trying every route. However, Problem 67, is the same challenge with a triangle
 * containing one-hundred rows; it cannot be solved by brute force, and requires a
 * clever method! ;o)
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct pyramid_t {
    int value;
    struct pyramid_t *left;
    struct pyramid_t *right;
} pyramid_t;

pyramid_t *pyramid_new(int value) {
    pyramid_t *pyramid = (pyramid_t *)malloc(sizeof(pyramid_t));
    pyramid->value = value;
    pyramid->left = NULL;
    pyramid->right = NULL;
}

pyramid_t *pyramid_from_array(int *array, size_t array_size) {
    int i;
    pyramid_t *root = pyramid_new(array[0]);
    pyramid_t *pyramid = root;
    for (i = 1; i < array_size; i++) {
        if (!pyramid->left) {
            pyramid->left = pyramid_new(array[i]);
        } else if (!pyramid->right) {
            pyramid->right = pyramid_new(array[i]);
        } else {
            pyramid = pyramid->left;
        }
    }
    return root;
}

void pyramid_free(pyramid_t *pyramid) {
    pyramid_free(pyramid->left);
    pyramid_free(pyramid->right);
    free(pyramid);
}

typedef int(*pyramid_route_compare_func)(int lhs, int rhs);

int pyramid_route(pyramid_t *pyramid, pyramid_route_compare_func cmp) {
    int left = pyramid_route(pyramid->left, cmp);
    int right = pyramid_route(pyramid->right, cmp);
    return cmp(left, right);
}

static int pyramid_max(int lhs, int rhs) {
    return (lhs < rhs ? rhs : lhs);
}

int main(int argc, char const* argv[]) {
    pyramid_t *root = pyramid_new(3);
    root->left = pyramid_new(7);
    root->right = pyramid_new(4);
    //
    root->left->left = pyramid_new(2);
    root->left->right = pyramid_new(4);
    root->right->left = root->left->right;
    root->right->right = pyramid_new(6);
    //
    int res = pyramid_route(root, pyramid_max);
    printf("%d\n", res);
    pyramid_free(root);
    return 0;
}

