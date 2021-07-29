/*
 * The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
 * so the first ten triangle numbers are:
 * 
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 * 
 * By converting each letter in a word to a number corresponding to its
 * alphabetical position and adding these values we form a word value. For
 * example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
 * is a triangle number then we shall call the word a triangle word.
 * 
 * Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
 * containing nearly two-thousand common English words, how many are triangle
 * words?
 */

const { readFileSync } = require('fs')

function wordValue(word) {
  return Array
    .from(word, c => c.charCodeAt() - 64)
    .reduce((x, y) => x + y)
}

function isTriangle(x) {
  return ((8 * x + 1) ** 0.5 - 1) / 2 % 1 === 0
}

const answer = readFileSync('../resources/words.txt', 'ascii')
  .replace(/"/g, '')
  .split(',')
  .map(wordValue)
  .filter(isTriangle)
  .length
console.log(answer)
