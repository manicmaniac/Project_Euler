/*
 * In England the currency is made up of pound, £, and pence, p, and there are
 * eight coins in general circulation:
 *
 *     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 *
 * It is possible to make £2 in the following way:
 *
 *     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 *
 * How many different ways can £2 be made using any number of coins?
 */

import java.util.Arrays;
import java.util.List;

public class Problem31 {
    private static int currency(int amount, List<Integer> coins) {
        if (amount == 0) {
            return 1;
        }
        int size = coins.size();
        if (amount < 0 || size == 0) {
            return 0;
        }
        return currency(amount, coins.subList(1, size)) +
                currency(amount - coins.get(0), coins);
    }

    public static void main(String[] args) {
        final List<Integer> coins = Arrays.asList(200, 100, 50, 20, 10, 5, 2, 1);
        int answer = currency(200, coins);
        System.out.println(answer);
    }
}
