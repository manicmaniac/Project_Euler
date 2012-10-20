/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

class Problem4 {
	public static boolean isPalindromic(int n) {
		StringBuffer sb = new StringBuffer(Integer.toString(n));
		sb.reverse();
		String reversed = sb.toString();
		String original = Integer.toString(n);
		return original.equals(reversed);
	}
	public static boolean isProductOf3Digits(int n) {
		for (int i=100; i<999; i++) {
			if (n % i == 0 && n / i < 1000 && n / i > 99) {
				return true;
			}
		}
		return false;
	}
	public static void main(String args[]) {
		for (int i=998001; i>9999; i--) {
			if (isProductOf3Digits(i) && isPalindromic(i)) {
				System.out.println(i);
				break;
			}
		}
	}
}

