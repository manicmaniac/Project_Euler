###
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
###

ans = 0
for i in [1..9]
	for j in [1..21]
		if (String Math.pow(i, j)).length == j
			ans++
console.log ans

