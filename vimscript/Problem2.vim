" Each new term in the Fibonacci sequence is generated by adding the previous two
" terms. By starting with 1 and 2, the first 10 terms will be:
" 
" 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
" 
" By considering the terms in the Fibonacci sequence whose values do not exceed
" four million, find the sum of the even-valued terms.

function! s:fib(n)
	let res = []
	let s = 0
	let t = 1
	while t < a:n
		let tmp = s
		let s = t
		let t += tmp
		let res = add(res, s)
	endwhile
	return res
endfunction

echo eval(join(filter(s:fib(4000000), '!(v:val % 2)'), '+'))

