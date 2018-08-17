/*
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

import java.util.HashMap;
import java.util.PrimitiveIterator;
import java.util.Map;

public class Problem14 {
    private static class Collatz {
        private final Map<Long, Integer> cache = new HashMap<>();

        public int getLength(long x) {
            PrimitiveIterator.OfLong iterator = new CollatzIterator(x);
            int length = getLength(iterator);
            cache.put(x, length);
            return length;
        }

        private int getLength(PrimitiveIterator.OfLong iterator) {
            int length = 0;
            while (iterator.hasNext()) {
                long x = iterator.next();
                length++;
                Integer cachedLength = cache.get(x);
                if (cachedLength != null) {
                    return cachedLength + length;
                }
            }
            return length;
        }
    }

    private static class CollatzIterator implements PrimitiveIterator.OfLong {
        private long x;

        public CollatzIterator(long x) {
            this.x = x;
        }

        @Override
        public boolean hasNext() {
            return x != 1;
        }

        @Override
        public long nextLong() {
            if ((x & 1) == 0) {
                x >>= 1;
            } else {
                x = x * 3 + 1;
            }
            return x;
        }
    }

    public static void main(String[] args) {
        int longestStart = 0;
        int longestLength = 0;
        Collatz collatz = new Collatz();
        for (int i = 1; i < 1000000; i += 2) {
            int length = collatz.getLength(i);
            if (longestLength < length) {
                longestStart = i;
                longestLength = length;
            }
        }
        int answer = longestStart;
        System.out.println(answer);
    }
}
