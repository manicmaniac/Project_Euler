(*
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
 *)

on combinations to amount out of coins
    if amount < 0 or count of coins = 0 then return 0
    if amount = 0 then return 1
    return (combinations to amount out of the rest of coins) + ¬
           (combinations to amount - the first item of coins out of coins)
end combinations

log (combinations to 200 out of [200, 100, 50, 20, 10, 5, 2, 1])
