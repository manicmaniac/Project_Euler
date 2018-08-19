/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

import java.util.stream.IntStream;
import java.util.function.IntPredicate;

import static java.util.Comparator.reverseOrder;

public class Problem4 {
    private static boolean isPalindromic(int n) {
        String original = String.valueOf(n);
        String reversed = new StringBuilder(original).reverse().toString();
        return original.equals(reversed);
    }

    private static boolean isProductOf3Digits(int x) {
        return IntStream.range(100, 999)
                .filter(i -> x % i == 0 && x / i < 1000 && x / i > 99)
                .findAny()
                .isPresent();
    }

    public static void main(String args[]) {
        int answer = IntStream.rangeClosed(100 * 100, 999 * 999)
                .boxed()
                .sorted(reverseOrder())
                .filter(x -> isProductOf3Digits(x) && isPalindromic(x))
                .findFirst()
                .get();
        System.out.println(answer);
    }
}
