/*
 * Euler discovered the remarkable quadratic formula:
 *
 * n² + n + 41
 *
 * It turns out that the formula will produce 40 primes for the consecutive values
 * n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
 * divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible
 * by 41.
 *
 * The incredible formula  n² − 79n + 1601 was discovered, which produces 80
 * primes for the consecutive values n = 0 to 79. The product of the coefficients,
 * −79 and 1601, is −126479.
 *
 * Considering quadratics of the form:
 *
 *     n² + an + b, where |a| < 1000 and |b| < 1000
 *
 *     where |n| is the modulus/absolute value of n
 *     e.g. |11| = 11 and |−4| = 4
 *
 * Find the product of the coefficients, a and b, for the quadratic expression
 * that produces the maximum number of primes for consecutive values of n,
 * starting with n = 0.
 */
import java.math.BigInteger;
import java.util.PrimitiveIterator;
import java.util.Spliterator;
import java.util.Spliterators;

public class Problem27 {
    private static class Primes implements Iterable<Integer> {
        private final int limit;
        private boolean[] isComposites;

        public Primes(int limit) {
            this.limit = limit;
        }

        @Override
        public PrimitiveIterator.OfInt iterator() {
            sieveIfNeeded();
            return new PrimesIterator();
        }

        @Override
        public Spliterator.OfInt spliterator() {
            return Spliterators.spliterator(iterator(),
                    (long) Math.floor(limit / Math.log(limit)),
                    Spliterator.DISTINCT | Spliterator.IMMUTABLE | Spliterator.NONNULL | Spliterator.ORDERED | Spliterator.SIZED | Spliterator.SORTED);
        }

        private synchronized void sieveIfNeeded() {
            if (isComposites == null) {
                isComposites = new boolean[limit];
                isComposites[0] = true;
                isComposites[1] = true;
                int sqrtLimit = (int)Math.sqrt(limit);
                for (int i = 2; i <= sqrtLimit; i++) {
                    if (!isComposites[i]) {
                        for (int j = i * i; j < limit; j += i) {
                            isComposites[j] = true;
                        }
                    }
                }
            }
        }

        private class PrimesIterator implements PrimitiveIterator.OfInt {
            private static final int NOT_FOUND = Integer.MIN_VALUE;
            private int next = 2;

            @Override
            public boolean hasNext() {
                return next != NOT_FOUND;
            }

            @Override
            public int nextInt() {
                int current = next;
                for (int i = current + 1; i < isComposites.length; i++) {
                    if (!isComposites[i]) {
                        next = i;
                        return current;
                    }
                }
                next = NOT_FOUND;
                return current;
            }
        }
    }

    private static class QuadraticFormula {
        private final int a;
        private final int b;

        public QuadraticFormula(int a, int b) {
            this.a = a;
            this.b = b;
        }

        public int solve(int n) {
            return n * n + a * n + b;
        }
    }

    public static void main(String[] args) {
        Primes primes = new Primes(1000);
        int longest = 0;
        int answer = 0;
        for (int a = -999; a <= 999; a += 2) {
            for (int b : primes) {
                QuadraticFormula formula = new QuadraticFormula(a, b);
                int n = 0;
                while (BigInteger.valueOf(formula.solve(n)).isProbablePrime(10)) {
                    n++;
                }
                if (longest < n) {
                    longest = n;
                    answer = a * b;
                }
            }
        }
        System.out.println(answer);
    }
}
