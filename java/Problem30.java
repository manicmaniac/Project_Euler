/*
 * Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
 *
 * 1634 = 14 + 64 + 34 + 44
 * 8208 = 84 + 24 + 04 + 84
 * 9474 = 94 + 44 + 74 + 44
 * As 1 = 14 is not a sum it is not included.
 *
 * The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 *
 * Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 */
import java.util.stream.LongStream;

public class Problem30 {
    private static boolean isArmstrong5(long x) {
        long result = 0;
        long y = x;
        while (y > 0 && result <= x) {
            result += (long) Math.pow(y % 10, 5);
            y /= 10;
        }
        return result == x;
    }

    public static void main(String[] args) {
        long answer = LongStream.range(2, 6 * (long) Math.pow(9, 5))
                .filter(Problem30::isArmstrong5)
                .sum();
        System.out.println(answer);
    }
}
