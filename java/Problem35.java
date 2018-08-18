/*
 * The number, 197, is called a circular prime because all rotations of the
 * digits: 197, 971, and 719, are themselves prime.
 *
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 * 73, 79, and 97.
 *
 * How many circular primes are there below one million?
 */

import java.util.PrimitiveIterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.IntStream;
import java.util.stream.StreamSupport;

public class Problem35 {
    private static class CircularNumbers implements Iterable<Integer> {
        private final int initial;

        public CircularNumbers(int initial) {
            this.initial = initial;
        }

        @Override
        public PrimitiveIterator.OfInt iterator() {
            return new CircularNumbersIterator();
        }

        private class CircularNumbersIterator implements PrimitiveIterator.OfInt {
            private final int digitsCount = 1 + (int) Math.floor(Math.log10(initial));
            private int round = 0;
            private int x = initial;

            @Override
            public boolean hasNext() {
                return round < digitsCount;
            }

            @Override
            public int nextInt() {
                int result = x;
                x = x / 10 + (x % 10) * (int) Math.pow(10, digitsCount - 1);
                round++;
                return result;
            }
        }
    }

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

        public boolean contains(int x) {
            if (x >= limit) {
                return false;
            }
            sieveIfNeeded();
            return !isComposites[x];
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
                return next!= NOT_FOUND;
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

    private static class CircularPrimes {
        private final Primes primes;

        public CircularPrimes(Primes primes) {
            this.primes = primes;
        }

        public CircularPrimes(int limit) {
            this(new Primes(limit));
        }

        public Primes getPrimes() {
            return primes;
        }

        public boolean isCircularPrime(int x) {
            for (int i : new CircularNumbers(x)) {
                if (!primes.contains(i)) {
                    return false;
                }
            }
            return true;
        }
    }

    public static void main(String[] args) {
        CircularPrimes circularPrimes = new CircularPrimes(1000000);
        IntStream stream = StreamSupport.intStream(circularPrimes.getPrimes().spliterator(), false);
        long answer = stream.filter(circularPrimes::isCircularPrime).count();
        System.out.println(answer);
    }
}
