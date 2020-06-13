/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 */

#include <iostream>
#include <vector>

template<typename T>
std::vector<T> factorize(T x) {
    std::vector<T> result;
    T divisor{2};
    while (x >= divisor) {
        if (x % divisor) {
            ++divisor;
        } else {
            result.push_back(divisor);
            x /= divisor;
        }
    }
    return result;
}

int main() {
    std::cout << factorize(600851475143).back() << std::endl;
}
