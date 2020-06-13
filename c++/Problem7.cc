/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
 * the 6th prime is 13.
 * 
 * What is the 10 001st prime number?
 */

#include <cmath>
#include <iostream>

template<typename T>
bool is_prime(T x) {
    if (x == 2) {
        return true;
    }
    if (x < 2 || x % 2 == 0) {
        return false;
    }
    double sqrt_x = sqrt(x);
    for (T i = 3; i <= sqrt_x; i += 2) {
        if (x % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    size_t count{0};
    int64_t i{0};
    while (count <= 10000) {
        ++i;
        if (is_prime(i)) {
            ++count;
        }
    }
    std::cout << i << std::endl;
}
