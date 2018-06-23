import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Problem14 {
    static class Collatz {
        private Map<Long, Integer> cache = new HashMap<>();

        public int getLength(long x) {
            if (cache.containsKey(x)) {
                return cache.get(x);
            }
            Iterator<Long> iterator = new CollatzIterator(x);
            int length = getLength(iterator);
            cache.put(x, length);
            return length;
        }

        private int getLength(Iterator<Long> iterator) {
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

    static class CollatzIterator implements Iterator<Long> {
        private long x;

        public CollatzIterator(long x) {
            this.x = x;
        }

        @Override
        public boolean hasNext() {
            return x != 1;
        }

        @Override
        public Long next() {
            if (this.x % 2 == 0) {
                this.x /= 2;
            } else {
                this.x = this.x * 3 + 1;
            }
            return this.x;
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
        System.out.println(longestStart);
    }
}
