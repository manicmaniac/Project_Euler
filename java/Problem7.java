/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
*/

import java.math.BigInteger;
import java.util.Iterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class Problem7 {
    public static class Prime implements Iterable<BigInteger> {
        @Override
        public Iterator<BigInteger> iterator() {
            return new PrimeIterator();
        }

        private static class PrimeIterator implements Iterator<BigInteger> {
            private BigInteger current = BigInteger.ONE;

            @Override
            public boolean hasNext() {
                return true;
            }

            @Override
            public BigInteger next() {
                current = current.nextProbablePrime();
                return current;
            }
        }
    }

    public static void main(String args[]) {
        Prime prime = new Prime();
        Spliterator<BigInteger> spliterator = Spliterators.spliteratorUnknownSize(prime.iterator(),
                    Spliterator.DISTINCT | Spliterator.IMMUTABLE | Spliterator.NONNULL | Spliterator.ORDERED | Spliterator.SORTED);
        Stream<BigInteger> stream = StreamSupport.stream(spliterator, false);
        BigInteger answer = stream.skip(10000).findFirst().get();
        System.out.println(answer);
    }
}
