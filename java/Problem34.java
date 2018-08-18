/*
 * 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 *
 * Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 *
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */
import java.util.stream.IntStream;

public class Problem34 {
    private static int factorial(int x) {
        int result = 1;
        while (x > 1) {
            result *= x--;
        }
        return result;
    }

    private static boolean isFactorion(int x) {
        int result = 0;
        int y = x;
        while (y > 0 && result <= x) {
            result += factorial(y % 10);
            y /= 10;
        }
        return x == result;
    }

    public static void main(String[] args) {
        int answer = IntStream.range(3, factorial(9) * 7)
                .filter(Problem34::isFactorion)
                .sum();
        System.out.println(answer);
    }
}
