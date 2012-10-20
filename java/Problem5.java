/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

class Problem5 {
	public static int gcd(int x, int y) {
		if (y == 0) {
			return x;
		}
		else if (x < y) {
			return gcd(y, x);
		}
		else {
			return gcd(y, x % y);
		}
	}
	public static int lcm(int x, int y) {
		return x * y / gcd(x, y);
	}
	public static void main(String args[]) {
		int res = 1;
		for (int i=2; i<20; i++) {
			res = lcm(res, i);
		}
		System.out.println(res);
	}
}

