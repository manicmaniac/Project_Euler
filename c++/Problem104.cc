/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */

#include <algorithm>
#include <ctgmath>
#include <iostream>

template<typename T, uint8_t D>
class LowerFibonacci final {
private:
    T a{0};
    T b{1};
    size_t i{0};
    T divisor{(T)pow(10, D)};

public:
    LowerFibonacci& operator++() {
        std::swap(a, b);
        b = (a + b) % divisor;
        ++i;
        return *this;
    }

    constexpr T operator*() const {
        return b;
    }

    constexpr size_t index() const {
        return i;
    }
};

template<typename T, uint8_t D>
T upper_fibonacci_at(size_t n) {
    static const double log10_phi{0.20898764024997873};
    static const double log10_sqrt5{0.34948500216800940};
    double log10_fib{(n + 1) * log10_phi - log10_sqrt5};
    if (log10_fib > D) {
        double integral;
        double fractional{modf(log10_fib, &integral)};
        log10_fib = D + fractional;
    }
    return (T)round(pow(10, log10_fib - 1));
}

template<typename T>
bool is_pandigital(T x) {
    if (x % 9) {
        return false;
    }
    uint32_t flags{0x1};
    lldiv_t dm;
    dm.quot = x;
    while (dm.quot) {
        dm = lldiv(dm.quot, 10);
        flags |= 0x1 << dm.rem;
    }
    return flags == 0x3ff;
}

int main() {
    LowerFibonacci<int64_t, 9> lower;
    while (!(is_pandigital(*lower) && is_pandigital(upper_fibonacci_at<int64_t, 9>(lower.index())))) {
        ++lower;
    }
    std::cout << lower.index() + 1 << std::endl;
}
