/*
The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value. For
example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
containing nearly two-thousand common English words, how many are triangle
words?
*/

var fs = require('fs');

var FILE = '../resources/words.txt';

function isTriangle(n) {
  if (typeof n === 'number') {
    return (Math.sqrt(8 * n + 1) - 1) / 2 % 1 === 0;
  }
  else if (typeof n === 'string') {
    var res = 0;
    for (var i=0; i<n.length; i++) {
      res += n[i].charCodeAt() - 64;
    }
    return isTriangle(res);
  }
  else return false;
}

fs.readFile(FILE, 'ascii', function(err, data) {
  var wordList = data.replace(/"/g, '').split(',');
  var res = 0;
  for (var i=0; i<wordList.length; i++) {
    if (isTriangle(wordList[i])) res++;
  }
  console.log(res);
});

