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
        return x == String.valueOf(x)
                .chars()
                .map(Character::getNumericValue)
                .map(Problem34::factorial)
                .sum();
    }

    public static void main(String[] args) {
        int answer = IntStream.range(3, factorial(9) * 7)
                .filter(Problem34::isFactorion)
                .sum();
        System.out.println(answer);
    }
}
