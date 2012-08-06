/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

var m = n = 1;
var a = b = c = 1;
while(a+b+c!=1000) {
	a = m*m - n*n;
	b = 2*m*n;
	c = m*m + n*n;
	if(m>n) n++;
	else {
		m++;
		n = 1;
	}
}
console.log(a*b*c)
