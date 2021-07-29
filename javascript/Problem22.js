/*
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name
score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
*/

const { readFileSync } = require('fs')

function nameScore(name) {
  return Array.from(name, c => c.charCodeAt() - 64).reduce((x, y) => x + y)
}

const data = readFileSync('../resources/names.txt', 'ascii')
const names = data.replace(/"/g, '').split(',').sort()
const answer = names.reduce((x, y, i) => (x + nameScore(y) * (i + 1)), 1)
console.log(answer)
