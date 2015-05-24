/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/
                                                           
#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>
#include <functional>

int main(int argc, char const* argv[]) {
	std::vector<int> numbers(1000);
	std::vector<int> filtered(1000);
	std::iota(numbers.begin(), numbers.end(), 0);
	std::copy_if(numbers.begin(), numbers.end(), filtered.begin(), [](int i){ return i % 3 * i % 5 == 0; });
	int result = std::accumulate(filtered.begin(), filtered.end(), 0, std::plus<int>());
	std::cout << result << std::endl;
	return 0;
}

