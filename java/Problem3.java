/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

import java.util.*;

class Problem3 {
	public static Vector factorize(long x) {
		Vector<Long> res = new Vector<Long>();
		for (long i=2; i<=x; i++) {
			if (x % i == 0) {
				res.addElement(i);
				x /= i;
				i--;
			}
		}
		return res;
	}
	public static void main(String[] args) {
		System.out.println(factorize(600851475143L).lastElement());
	}
}

