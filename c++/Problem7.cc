/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
*/

#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(int n) {
	if (n <= 2) {
		return n == 2;
	}
	for (int i=2; i<=sqrt(n); i++) {
		if (n % i == 0) {
			return false;
		}
	}
	return true;
}

int main(int argc, char const* argv[]) {
	int count = 0;
	int i = 0;
	while (count <= 1e4) {
		if (isPrime(++ i)) {
			count ++;
		}
	}
	cout << i;
	return 0;
}

