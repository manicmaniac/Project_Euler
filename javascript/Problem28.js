/*
Starting with the number 1 and moving to the right in a clockwise direction a 5
by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
in the same way?
*/

var iter = (function() {
	var index = 3, increase = 2, repeat = 0;
	return function() {
		if (repeat < 3) {
			repeat ++;
		}
		else {
			repeat = 0;
			increase += 2;
		}
		index += increase;
		return index;
	};
}());

console.log((function() {
	var res = [];
	while ((x = iter()) <= 1001*1001) {
		res.push(x);
	}
	return 4 + res.reduce(function(x, y) {
		return x + y;
	});
}()));

