/*
 * The rules for writing Roman numerals allow for many ways of writing each number
 * (see About Roman Numerals...). However, there is always a "best" way of writing
 * a particular number.
 * 
 * For example, the following represent all of the legitimate ways of writing the
 * number sixteen:
 * 
 * IIIIIIIIIIIIIIII
 * VIIIIIIIIIII
 * VVIIIIII
 * XIIIIII
 * VVVI
 * XVI
 * 
 * The last example being considered the most efficient, as it uses the least
 * number of numerals.
 * 
 * The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
 * contains one thousand numbers written in valid, but not necessarily minimal,
 * Roman numerals; that is, they are arranged in descending units and obey the
 * subtractive pair rule (see About Roman Numerals... for the definitive rules for
 * this problem).
 * 
 * Find the number of characters saved by writing each of these in their minimal
 * form.
 * 
 * Note: You can assume that all the Roman numerals in the file contain no more
 * than four consecutive identical units.
 */

const { readFileSync } = require('fs')

function roman(x) {
  function loop(x, s) {
    if (x < 1) {
      return s
    }
    for (const [r, a] of roman.dictionary) {
      if (x >= a) {
        return loop(x - a, s + r)
      }
    }
  }
  return loop(x, '')
}

roman.dictionary = Object.freeze(new Map([
  ['M', 1000],
  ['CM', 900],
  ['D', 500],
  ['CD', 400],
  ['C', 100],
  ['XC', 90],
  ['L', 50],
  ['XL', 40],
  ['X', 10],
  ['IX', 9],
  ['V', 5],
  ['IV', 4],
  ['I', 1]
]))

function arabic(s) {
  function loop(s, x) {
    if (s.length < 1) {
      return x
    }
    let head = s.slice(0, 2)
    if (roman.dictionary.has(head)) {
      return loop(s.slice(2), x + roman.dictionary.get(head))
    }
    head = s.slice(0, 1)
    if (roman.dictionary.has(head)) {
      return loop(s.slice(1), x + roman.dictionary.get(head))
    }
    throw new Error('Invalid Roman numeric')
  }
  return loop(s, 0)
}

const romans = readFileSync('../resources/roman.txt', 'ascii').split('\n')
const minimalRomans = romans.map(arabic).map(roman)
const answer = romans.join().length - minimalRomans.join().length
console.log(answer)
