/*
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 *
 * Find the sum of the digits in the number 100!
 */
import java.math.BigInteger;

public class Problem20 {
    private static BigInteger factorial(BigInteger x) {
        BigInteger result = x;
        while (x.compareTo(BigInteger.ZERO) > 0) {
            result = result.multiply(x);
            x = x.subtract(BigInteger.ONE);
        }
        return result;
    }

    public static void main(String[] args) {
        char[] digitChars = factorial(BigInteger.valueOf(100)).toString().toCharArray();
        int sum = 0;
        for (char digitChar : digitChars) {
            sum += Character.digit(digitChar, 10);
        }
        int answer = sum;
        System.out.println(answer);
    }
}
