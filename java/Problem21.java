/*
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 * If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 */
public class Problem21 {
    private static int sumOfDivisors(int x) {
        int result = 0;
        for (int i = 1; i < (x / 2 + 1); i++) {
            if (x % i == 0) {
                result += i;
            }
        }
        return result;
    }

    private static boolean hasAmicable(int x) {
        int sum = sumOfDivisors(x);
        return sum != x && sumOfDivisors(sum) == x;
    }

    public static void main(String[] args) {
        int answer = 0;
        for (int i = 2; i < 10000; i++) {
            if (hasAmicable(i)) {
                answer += i;
            }
        }
        System.out.println(answer);
    }
}
