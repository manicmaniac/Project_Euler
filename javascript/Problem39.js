/*
 * If p is the perimeter of a right angle triangle with integral length sides, {a,
 * b,c}, there are exactly three solutions for p = 120.
 * 
 * {20,48,52}, {24,45,51}, {30,40,50}
 * 
 * For which value of p ≤ 1000, is the number of solutions maximised?
 */

function countPythagoreans(p) {
  let count = 0
  for (let a = 1; a <= p; a++) {
    for (let b = 1; b <= a; b++) {
			const c = Math.hypot(a, b)
			if (a + b + c === p) {
        count++
			}
		}
	}
	return count
}

const max = { i: 0, count: 0 }
for (let i = 12; i <= 1000; i += 12) {
  const count = countPythagoreans(i)
  if (max.count < count) {
    max.count = count
    max.i = i
  }
}

console.log(max.i)
