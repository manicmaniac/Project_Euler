/*
In England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?
*/

var _ = require('underscore');

var currency = function(amount, coins) {
	var ways = [1];
	coins.forEach(function(coin) {
		_.range(coin, amount + 1).forEach(function(i) {
			ways[i] = (ways[i] || 0) + (ways[i - coin] || 0);
		});
	});
	return _(ways).last();
};

var coins = [200, 100, 50, 20, 10, 5, 2, 1];
console.log(currency(200, coins));

