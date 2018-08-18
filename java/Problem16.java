/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 */

import java.math.BigInteger;

public class Problem16 {
    public static void main(String[] args) {
        int answer = BigInteger.valueOf(2)
                .pow(1000)
                .toString()
                .chars()
                .map(Character::getNumericValue)
                .sum();
        System.out.println(answer);
    }
}
