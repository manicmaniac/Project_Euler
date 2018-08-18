/*
 * A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
 *
 * 1/2	= 	0.5
 * 1/3	= 	0.(3)
 * 1/4	= 	0.25
 * 1/5	= 	0.2
 * 1/6	= 	0.1(6)
 * 1/7	= 	0.(142857)
 * 1/8	= 	0.125
 * 1/9	= 	0.(1)
 * 1/10	= 	0.1
 * Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
 *
 * Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 */

import java.math.BigInteger;
import java.util.Comparator;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Problem26 {
    private static int fermatsLittleTheorem(int x) {
        if ((x & 1) != 0) {
            BigInteger bigX = BigInteger.valueOf(x);
            for (int i = 1; i < x; i++) {
                if (BigInteger.TEN.modPow(BigInteger.valueOf(i), bigX).equals(BigInteger.ONE)) {
                    return i;
                }
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        int answer = IntStream.range(0, 1000)
                .boxed()
                .max(Comparator.comparing(Problem26::fermatsLittleTheorem))
                .get()
                .intValue();
        System.out.println(answer);
    }
}
