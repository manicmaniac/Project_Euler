/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
 * the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */

import java.math.BigInteger;
import java.util.stream.Stream;

public class Problem7 {
    public static void main(String args[]) {
        BigInteger answer = Stream.iterate(BigInteger.valueOf(2), BigInteger::nextProbablePrime)
                .skip(10000)
                .findFirst()
                .get();
        System.out.println(answer);
    }
}
