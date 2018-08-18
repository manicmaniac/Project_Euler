/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * Hence the first 12 terms will be:
 *
 *     F[1] = 1
 *     F[2] = 1
 *     F[3] = 2
 *     F[4] = 3
 *     F[5] = 5
 *     F[6] = 8
 *     F[7] = 13
 *     F[8] = 21
 *     F[9] = 34
 *     F[10] = 55
 *     F[11] = 89
 *     F[12] = 144
 *
 * The 12th term, F[12], is the first term to contain three digits.
 *
 * What is the first term in the Fibonacci sequence to contain 1000 digits?
 */
import java.util.stream.IntStream;

public class Problem25 {
    private static class Fibonacci {
        private static final double LOG10_PHI = Math.log10((1 + Math.sqrt(5)) / 2);
        private static final double LOG10_SQRT5 = Math.log10(5) / 2;

        public static int countDigits(int n) {
            return 1 + (int) (LOG10_PHI * n - LOG10_SQRT5);
        }
    }

    public static void main(String[] args) {
        int answer = IntStream.iterate(0, x -> x + 1)
                .filter(x -> Fibonacci.countDigits(x) > 999)
                .findFirst()
                .getAsInt();
        System.out.println(answer);
    }
}
