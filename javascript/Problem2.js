/*
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/

function *generateFibonaccies() {
  let [i, j] = [0, 1]
  while (true) {
    [i, j] = [j, i + j]
    yield i
  }
}

let answer = 0
for (const x of generateFibonaccies()) {
  if (x > 4e6) {
    break
  }
  if (x % 2 === 0) {
    answer += x
  }
}
console.log(answer)
