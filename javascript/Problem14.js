/*
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
*/

function collatz(n) {
	var res = [n];
	while(n > 1) {
		if(n % 2 == 0) n /= 2;
		else n = 3 * n + 1;
		res.push(n);
	}
	return res;
}

function range(begin, end, step) {
	if(typeof end === 'undefined') {
		end = begin;
		begin = 0;
	}
	if(typeof step === 'undefined') step = 1;
	var res = [];
	for(var i=begin; i<end; i+=step) {
		res.push(i);
	}
	return res;
}

var i = 1;
var res = [1, 1];
var tmp = 0;
while(i<1000000) {
	tmp = collatz(i).length;
	if(res[0]<tmp) res = [tmp, i];
	i += 2;
}

console.log(res[1]);

