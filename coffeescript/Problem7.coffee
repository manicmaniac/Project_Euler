###
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
###

is_prime = (n) ->
	for i in [2..Math.sqrt(n)]
		if n % i == 0 then return false
	return true

i = c = 1
while c < 10001
	i+=2
	if is_prime(i) then c++
console.log(i)

