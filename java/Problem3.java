/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 */

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Problem3 {
    public static Set<Long> factorize(long x) {
        if (x <= 0) {
            throw new ArithmeticException("Cannot factorize '" + x + "'");
        }
        Set<Long> factors = new HashSet<Long>();
        if (x == 1) {
            factors.add(1L);
            return factors;
        }
        for (long i = 2; i <= x; i++) {
            if (x % i == 0) {
                factors.add(i);
                x /= i;
                i--;
            }
        }
        return factors;
    }

    public static void main(String[] args) {
        long answer = Collections.max(factorize(600851475143L));
        System.out.println(answer);
    }
}
