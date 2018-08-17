/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

import java.util.ArrayList;
import java.util.List;

public class Problem3 {
    public static List<Long> factorize(long x) {
        List<Long> factors = new ArrayList<Long>();
        for (long i = 2L; i <= x; i++) {
            if (x % i == 0) {
                factors.add(i);
                x /= i;
                i--;
            }
        }
        return factors;
    }

    public static void main(String[] args) {
        List<Long> factors = factorize(600851475143L);
        long answer = factors.get(factors.size() - 1);
        System.out.println(answer);
    }
}
