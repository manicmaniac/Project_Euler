/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
import java.util.Iterator;

public class Problem10 {
    static class Primes implements Iterable<Integer> {
        private final int limit;
        private boolean[] isComposites;

        public Primes(int limit) {
            this.limit = limit;
        }

        public int getLimit() {
            return limit;
        }

        @Override
        public Iterator<Integer> iterator() {
            synchronized (this) {
                if (!isSieved()) {
                    sieve();
                }
            }
            return new PrimesIterator();
        }

        private boolean isSieved() {
            return isComposites != null;
        }

        private void sieve() {
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

        class PrimesIterator implements Iterator<Integer> {
            private Integer next = 2;

            @Override
            public boolean hasNext() {
                return this.next != null;
            }

            @Override
            public Integer next() {
                Integer current = this.next;
                for (int i = current + 1; i < isComposites.length; i++) {
                    if (!isComposites[i]) {
                        this.next = i;
                        return current;
                    }
                }
                this.next = null;
                return current;
            }
        }
    }

    public static void main(String[] args) {
        Primes primes = new Primes(2000000);
        long sum = 0;
        for (int i : primes) {
            sum += i;
        }
        System.out.println(sum);
    }
}

