/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

#include <iostream>
#include <numeric>
#include <valarray>

template<typename T>
constexpr T gcd(T a, T b) {
	return b ? gcd(b, a % b) : a;
}

template<typename T>
constexpr T lcm(T a, T b) {
	return a * b / gcd(a, b);
}

int main() {
    std::valarray<int64_t> numbers(20);
    std::iota(std::begin(numbers), std::end(numbers), 1);
    auto result = std::accumulate(std::begin(numbers), std::end(numbers), 1, lcm<decltype(numbers)::value_type>);
    std::cout << result << std::endl;
}
