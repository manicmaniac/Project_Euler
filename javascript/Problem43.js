/*
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
each of the digits 0 to 9 in some order, but it also has a rather interesting
sub-string divisibility property.

Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
note the following:

  • d[2]d[3]d[4]=406 is divisible by 2
  • d[3]d[4]d[5]=063 is divisible by 3
  • d[4]d[5]d[6]=635 is divisible by 5
  • d[5]d[6]d[7]=357 is divisible by 7
  • d[6]d[7]d[8]=572 is divisible by 11
  • d[7]d[8]d[9]=728 is divisible by 13
  • d[8]d[9]d[10]=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.
*/

function isPandigital(n) {
  var s = n.toString();
  if (s.length != 10) {
    return false;
  }
  else {
    var res = [];
    for (var i=0; i<s.length; i++) {
      res.push(s[i]);
    }
    return String(res.sort()) == '0,1,2,3,4,5,6,7,8,9';
  }
}

function sum(xs) {
  return xs.reduce(function(x, y) {return x + y;});
}

var res = [];
for (var d1=1; d1<10; d1++) {
  for (var d2=0; d2<10; d2++) {
    for (var d3=0; d3<10; d3++) {
      for (var d4=0; d4<10; d4+=2) {
        for (var d5=0; d5<10; d5++) {
          if ((d3 + d4 + d5) % 3 == 0) {
            for (var d6=0; d6<10; d6+=5) {
              for (var d7=0; d7<10; d7++) {
                if ((d5 * 100 + d6 * 10 + d7) % 7 == 0) {
                  for (var d8=0; d8<10; d8++) {
                    if ((d6 * 100 + d7 * 10 + d8) % 11 == 0) {
                      for (var d9=0; d9<10; d9++) {
                        if ((d7 * 100 + d8 * 10 + d9) % 13 == 0) {
                          for (var d10=0; d10<10; d10++) {
                            if ((d8 * 100 + d9 * 10 + d10) % 17 == 0) {
                              res.push(Number([d1, d2, d3, d4, d5, d6, d7, d8, d9, d10].join('')));
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

console.log(sum(res.filter(isPandigital)));
