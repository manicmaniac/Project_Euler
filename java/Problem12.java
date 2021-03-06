/*
 * The sequence of triangle numbers is generated by adding the natural numbers. So
 * the 7^th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten
 * terms would be:
 *
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 *
 * Let us list the factors of the first seven triangle numbers:
 *
 *      1: 1
 *      3: 1,3
 *      6: 1,2,3,6
 *     10: 1,2,5,10
 *     15: 1,3,5,15
 *     21: 1,3,7,21
 *     28: 1,2,4,7,14,28
 *
 * We can see that 28 is the first triangle number to have over five divisors.
 *
 * What is the value of the first triangle number to have over five hundred
 * divisors?
 */

import java.util.stream.IntStream;

public class Problem12 {
    private static int divisorsCount(int x) {
        int a = 1;
        int i = 1;
        int d = 2;
        while (x >= d) {
            if (x % d == 0) {
                x /= d;
                i++;
            } else {
                a *= i;
                i = 1;
                d++;
            }
        }
        a *= i;
        return a;
    }

    public static void main(String[] args) {
        int answer = IntStream.iterate(1, x -> x + 1)
                .map(x -> x * (x + 1) / 2)
                .filter(x -> divisorsCount(x) >= 500)
                .findFirst()
                .getAsInt();
        System.out.println(answer);
    }
}
