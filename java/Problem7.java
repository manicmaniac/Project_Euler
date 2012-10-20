/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
*/

class Problem7 {
	public static boolean isPrime(int n) {
		if (n == 2) {
			return true;
		}
		else if (n < 2 || n % 2 == 0) {
			return false;
		}
		else {
			for (int i=3; i<=Math.sqrt(n); i+=2) {
				if (n % i == 0) {
					return false;
				}
			}
			return true;
		}
	}
	public static void main(String args[]) {
		int index = 0;
		int i = 0;
		while (index < 10001) {
			i++;
			if (isPrime(i)) {
				index++;
			}
		}
		System.out.println(i);
	}
}

