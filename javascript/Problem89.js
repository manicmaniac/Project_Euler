/*
The rules for writing Roman numerals allow for many ways of writing each number
(see About Roman Numerals...). However, there is always a "best" way of writing
a particular number.

For example, the following represent all of the legitimate ways of writing the
number sixteen:

IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI

The last example being considered the most efficient, as it uses the least
number of numerals.

The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
contains one thousand numbers written in valid, but not necessarily minimal,
Roman numerals; that is, they are arranged in descending units and obey the
subtractive pair rule (see About Roman Numerals... for the definitive rules for
this problem).

Find the number of characters saved by writing each of these in their minimal
form.

Note: You can assume that all the Roman numerals in the file contain no more
than four consecutive identical units.
*/

var _ = require('underscore');
var fs = require('fs');

var FILE = './roman.txt';

var Roman = function(n) {
  if (_.isString(n)) {
    this.valueOf = function() {
      return Roman.toInt(n);
    };
  }
  else if(_.isNumber(n)) {
    this.valueOf = function() {
      return n;
    };
  }
  else {
    throw TypeError;
  }
};
Roman.dict = {
          1000: 'M',
          900: 'CM',
          500: 'D',
          400: 'CD',
          100: 'C',
          90: 'XC',
          50: 'L',
          40: 'XL',
          10: 'X',
          9: 'IX',
          5: 'V',
          4: 'IV',
          1: 'I'
        };

Roman.toRoman = function(n) {
  return (function loop(n, res) {
    var i, key;
    if (n < 1) {
      return res;
    }
    for (i=0, len=_.keys(Roman.dict).length; i<len; i++) {
      key = _(Roman.dict).keys().reverse()[i];
      if (n >= key) {
        return loop(n - key, res + Roman.dict[key]);
      }
    }
  }(n, ''));
};

Roman.toInt = function(s) {
  return (function loop(s, res) {
    var i, current, inv = _.invert(Roman.dict);
    if (!s) {
      return res;
    }
    current = s.slice(0, 2);
    if (inv[current]) {
      return loop(s.slice(2, s.length), res + Number(inv[current]));
    }
    current = s.slice(0, 1);
    return loop(s.slice(1, s.length), res + Number(inv[current[0]]));
  }(s, 0));
};

Roman.prototype = {
  toString: function() {
              return Roman.toRoman(this);
            }
};

fs.readFile(FILE, 'ascii', function(err, data) {
  if (err) {
    throw err;
  }
  var originalLength = data.split('\n').join('').length;
  console.log(originalLength - data.split('\n').map(Roman.toInt).map(Roman.toRoman).join('').length);
});

