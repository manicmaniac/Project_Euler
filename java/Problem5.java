/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

import java.math.BigInteger;
import java.util.stream.IntStream;

public class Problem5 {
    public static BigInteger lcm(BigInteger x, BigInteger y) {
        return x.multiply(y).divide(x.gcd(y));
    }

    public static void main(String args[]) {
        BigInteger answer = IntStream.rangeClosed(2, 20)
                .mapToObj(BigInteger::valueOf)
                .reduce(Problem5::lcm)
                .get();
        System.out.println(answer);
    }
}
