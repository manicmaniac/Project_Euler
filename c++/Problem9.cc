/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 *
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

#include <iostream>

template<typename T>
class PythagorianTriplets {
private:
    T m{1};
    T n{1};
public:
    PythagorianTriplets& operator++() {
        if (m < n) {
            ++m;
            n = 1;
        } else {
            ++n;
        }
        return *this;
    }

    constexpr T sum() const {
        return 2 * m * m + 2 * m * n;
    }

    constexpr T product() const {
        return (m * m * m * m - n * n * n * n) * 2 * m * n;
    }
};

int main() {
    PythagorianTriplets<int64_t> triplets;
    while (triplets.sum() != 1000) {
        ++triplets;
    }
    std::cout << triplets.product() << std::endl;
}
