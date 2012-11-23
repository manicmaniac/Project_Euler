/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

#include <iostream>
using namespace std;

long gcd(long a, long b) {
	return b ? gcd(b, a % b) : a;
}

long lcm(long a, long b) {
	return a * b / gcd(a, b);
}

int main(int argc, char const* argv[]) {
	int x = 1;
	for (int i=1; i<=20; i++) {
		x = lcm(x, i);
	}
	cout << x;
	return 0;
}

