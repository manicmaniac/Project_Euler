/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */
import java.util.Iterator;

public class Problem104 {
    static class UpperFibonacci {
        private static final double LOG10_PHI = Math.log10((1.0 + Math.sqrt(5.0)) / 2.0);
        private static final double LOG10_SQRT5 = Math.log10(5.0) / 2.0;
        private final int precision;

        public UpperFibonacci(int precision) {
            this.precision = precision;
        }

        public int getPrecision() {
            return precision;
        }

        public long get(int index) {
            double log10_fib = (index + 1) * LOG10_PHI - LOG10_SQRT5;
            if (log10_fib > precision) {
                long integral = (long)log10_fib;
                double fractional = log10_fib - (double)integral;
                log10_fib = precision + fractional;
            }
            return (long)Math.round(Math.pow(10, log10_fib - 1));
        }
    }

    static class LowerFibonacci implements Iterable<Long> {
        private final int precision;

        public LowerFibonacci(int precision) {
            this.precision = precision;
        }

        public int getPrecision() {
            return precision;
        }

        @Override
        public Iterator<Long> iterator() {
            return new LowerFibonacciIterator();
        }

        class LowerFibonacciIterator implements Iterator<Long> {
            private final long divisor;
            private long current = 0;
            private long next = 1;

            public LowerFibonacciIterator() {
                this.divisor = (long)Math.pow(10.0, (double)precision);
            }

            @Override
            public boolean hasNext() {
                return true;
            }

            @Override
            public Long next() {
                long current = this.next;
                long next = (this.current + this.next) % divisor;
                this.current = current;
                this.next = next;
                return current;
            }
        }
    }

    static class PandigitalNumber {
        static boolean isPandigital(long x) {
            if (x % 9 != 0) {
                return false;
            }
            int flags = 0x1;
            for (long i = x; i > 0; i /= 10) {
                flags |= 0x1 << (i % 10);
            }
            return (flags == 0x3ff);
        }
    }

    public static void main(String[] args) {
        final int precision = 9;
        UpperFibonacci upperFibonacci = new UpperFibonacci(precision);
        LowerFibonacci lowerFibonacci = new LowerFibonacci(precision);
        int counter = 0;
        for (long i: lowerFibonacci) {
            if (PandigitalNumber.isPandigital(i)) {
                long j = upperFibonacci.get(counter);
                if (PandigitalNumber.isPandigital(j)) {
                    break;
                }
            }
            counter++;
        }
        System.out.println(counter + 1);
    }
}