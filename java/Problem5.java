/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

import java.math.BigInteger;
import java.util.stream.IntStream;

public class Problem5 {
    public static int lcm(int x, int y) {
        return x * y / BigInteger.valueOf(x).gcd(BigInteger.valueOf(y)).intValueExact();
    }

    public static void main(String args[]) {
        int answer = IntStream.range(2, 20)
                .reduce(Problem5::lcm)
                .getAsInt();
        System.out.println(answer);
    }
}
