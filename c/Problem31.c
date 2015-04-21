/*
 * In England the currency is made up of pound, $B!r(B, and pence, p, and there are
 * eight coins in general circulation:
 * 
 *     1p, 2p, 5p, 10p, 20p, 50p, $B!r(B1 (100p) and $B!r(B2 (200p).
 * 
 * It is possible to make $B!r(B2 in the following way:
 * 
 *     1$B!_!r(B1 + 1$B!_(B50p + 2$B!_(B20p + 1$B!_(B5p + 1$B!_(B2p + 3$B!_(B1p
 * 
 * How many different ways can $B!r(B2 be made using any number of coins?
 */
#include <stdio.h>

int currency(const int amount, const int *coins, const size_t coins_count) {
    if (amount <= 0 || !coins_count) {
        return amount == 0;
    }
    return currency(amount, coins + 1, coins_count - 1) + currency(amount - coins[0], coins, coins_count);
}

int main(int argc, char const* argv[]) {
    const int coins[] = {200, 100, 50, 20, 10, 5, 2, 1};
    int res = currency(200, coins, sizeof(coins) / sizeof(coins[0]));
    printf("%d\n", res);
    return 0;
}

