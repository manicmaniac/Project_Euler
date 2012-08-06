/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

function gcd(m, n) {
	if(n==0) return m;
	else if(m<n) return gcd(n, m);
	else return gcd(n, m%n);
};

function lcm(m, n) {
	return m*n / gcd(m, n);
};

function range(begin, end, step) {
	if(typeof end === 'undefined') {
		end = begin;
		begin = 0;
	};
	if(typeof step === 'undefined') step = 1;
	var res = [];
	for(var i=begin; i<end; i+=step) {
		res.push(i);
	};
	return res;
};

console.log(range(1, 21).reduce(lcm));
