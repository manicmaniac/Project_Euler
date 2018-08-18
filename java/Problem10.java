/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
import java.util.PrimitiveIterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.IntStream;
import java.util.stream.StreamSupport;

public class Problem10 {
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

    public static void main(String[] args) {
        Primes primes = new Primes(2000000);
        IntStream stream = StreamSupport.intStream(primes.spliterator(), false);
        long answer = stream.mapToLong(Long::new).sum();
        System.out.println(answer);
    }
}
