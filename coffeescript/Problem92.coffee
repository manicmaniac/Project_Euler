###
A number chain is created by continuously adding the square of the digits in a
number to form a new number until it has been seen before.

For example,

44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless
loop. What is most amazing is that EVERY starting number will eventually arrive
at 1 or 89.

How many starting numbers below ten million will arrive at 89?
###

sumOfSquareDigits = (n) ->
	(Math.pow((Number i), 2) for i in (String n)).reduce((x, y) -> x + y)

chain = (n, proc=[]) ->
	if n in proc
		proc.concat([n])
	else
		arguments.callee(sumOfSquareDigits(n), proc.concat([n]))

cache = [1..9 * 9 * 7].filter((x) -> 89 in chain(x))

console.log [1...1e7].filter((x) -> sumOfSquareDigits(x) in cache).length

