# In England the currency is made up of pound, Â£, and pence, p, and there are eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, Â£1 (100p) and Â£2 (200p).
# It is possible to make Â£2 in the following way:
# 
# 1Â£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can Â£2 be made using any number of coins?

coins = 200, 100, 50, 20, 10, 5, 2, 1

def currency(amount, coins)
    cache = {0 => 1}
    cache.default = 0
    coins.each do |coin|
        coin.upto(amount) do |i|
            cache[i] = cache[i] + cache[i - coin]
        end
    end
    cache[amount]
end

puts currency(200, coins)

