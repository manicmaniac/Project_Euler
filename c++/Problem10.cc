/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

#include <bitset>
#include <cmath>
#include <iostream>

template<size_t N>
void sieve(std::bitset<N>& bits) {
    bits.set(0);
    bits.set(1);
    size_t limit = (size_t)sqrt(N);
    for (size_t i = 2; i <= limit; ++i) {
        if (!bits.test(i)) {
            for (size_t j = i * i; j < N; j += i) {
                bits.set(j);
            }
        }
    }
}

int main() {
    std::bitset<2000000> bits;
    sieve(bits);
    int64_t sum{0};
    for (size_t i = 0; i < bits.size(); ++i) {
        if (!bits.test(i)) {
            sum += i;
        }
    }
    std::cout << sum << std::endl;
}
