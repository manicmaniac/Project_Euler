/*
 * Each new term in the Fibonacci sequence is generated by adding the previous two
 * terms. By starting with 1 and 2, the first 10 terms will be:
 * 
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 * 
 * By considering the terms in the Fibonacci sequence whose values do not exceed
 * four million, find the sum of the even-valued terms.
 */
                                                           
#include <algorithm>
#include <iostream>

template<typename T>
class Fibonacci final {
private:
    T i{0};
    T j{1};

public:
    constexpr T operator*() const {
        return j;
    }

    Fibonacci& operator++() {
        std::swap(i, j);
        j += i;
        return *this;
    }
};

int main() {
    int64_t sum{0};
    for (Fibonacci<decltype(sum)> fib; *fib < 4e6; ++fib) {
        if (*fib % 2 == 0) {
            sum += *fib;
        }
    }
    std::cout << sum << std::endl;
}
