/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

#include <iostream>
using namespace std;

int maxFactor(long n) {
	int d = 2;
	int res = 0;
	while (n >= d) {
		if (n % d) {
			d++;
		}
		else {
			n /= d;
			res = d;
		}
	}
	return res;
}

int main(int argc, char const* argv[]) {
	cout << maxFactor(600851475143L);
	return 0;
}

