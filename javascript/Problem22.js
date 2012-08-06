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

var fs = require('fs');

var FILE = './names.txt';

function nameScore(name) {
  var res = 0;
  for(var i=0; i<name.length; i++) {
    res += name[i].charCodeAt()-64;
  }
  return res;
}

fs.readFile(FILE, 'ascii', function(err, data) {
  nameList = data.replace(/"/g, '').split(',').sort();
  var res = 0;
  for(var i=0; i<nameList.length; i++) {
    res += nameScore(nameList[i]) * (i+1);
  }
  console.log(res);
})
