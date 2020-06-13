/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

#include <iostream>
#include <numeric>
#include <type_traits>
#include <valarray>

template<typename... T>
using common_type_t = typename std::common_type<T...>::type;

template<typename M, typename N>
constexpr common_type_t<M, N> gcd(M m, N n) {
	return n ? gcd(n, m % n) : m;
}

template<typename M, typename N>
constexpr common_type_t<M, N> lcm(M m, N n) {
	return m * n / gcd(m, n);
}

int main() {
    std::valarray<int64_t> numbers(20);
    std::iota(std::begin(numbers), std::end(numbers), 1);
    auto result = std::accumulate(std::begin(numbers), std::end(numbers), 1, lcm<int64_t, int64_t>);
    std::cout << result << std::endl;
}
