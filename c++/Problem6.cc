/*
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
*/

#include <iomanip>
#include <iostream>
#include <numeric>
#include <valarray>

int main() {
    std::valarray<int64_t> numbers(100);
    std::iota(std::begin(numbers), std::end(numbers), 0);
    auto result = std::pow(numbers.sum(), 2) - std::pow(numbers, 2).sum();
    std::cout << std::fixed << std::setprecision(0) << result << std::endl;
}
