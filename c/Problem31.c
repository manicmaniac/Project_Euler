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

#include <stdio.h>

int currency(int amount, const int *coins, size_t coins_count) {
    if (amount <= 0 || !coins_count) {
        return amount == 0;
    }
    return currency(amount, coins + 1, coins_count - 1) + currency(amount - coins[0], coins, coins_count);
}

int main(int argc, const char *argv[]) {
    static const int coins[] = { 200, 100, 50, 20, 10, 5, 2, 1 };
    int result;

    result = currency(200, coins, sizeof(coins) / sizeof(coins[0]));
    printf("%d\n", result);
    return 0;
}
