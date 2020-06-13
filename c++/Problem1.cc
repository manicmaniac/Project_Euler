/*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 * 
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */
                                                           
#include <algorithm>
#include <iostream>
#include <numeric>
#include <valarray>

int main() {
    std::valarray<int64_t> numbers(1000);
    std::iota(std::begin(numbers), std::end(numbers), 0);
    std::replace_if(std::begin(numbers), std::end(numbers), [](int x){ return x % 3 * x % 5; }, 0);
    std::cout << numbers.sum() << std::endl;
}
