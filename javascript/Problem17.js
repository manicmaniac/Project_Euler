/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.
*/

dic = new Array();
dic[0] = '';
dic[1] = 'one';
dic[2] = 'two';
dic[3] = 'three';
dic[4] = 'four';
dic[5] = 'five';
dic[6] = 'six';
dic[7] = 'seven';
dic[8] = 'eight';
dic[9] = 'nine';
dic[10] = 'ten';
dic[11] = 'eleven';
dic[12] = 'twelve';
dic[13] = 'thirteen';
dic[14] = 'fourteen';
dic[15] = 'fifteen';
dic[16] = 'sixteen';
dic[17] = 'seventeen';
dic[18] = 'eighteen';
dic[19] = 'nineteen';
dic[20] = 'twenty';
dic[30] = 'thirty';
dic[40] = 'forty';
dic[50] = 'fifty';
dic[60] = 'sixty';
dic[70] = 'seventy';
dic[80] = 'eighty';
dic[90] = 'ninety';
dic[100] = 'handred';
dic[1000] = 'onethousand';

function numToEn(n, res) {
  if(typeof res === 'undefined') res = ''
  if(n==0) return res;
  else if(n==1000) return dic[n];
  else if(n%100==0) return res + dic[n/100] + dic[100];
  else if(n<=20) return res + dic[n];
  else if(n>20 && n<100) return numToEn(n%10, res + dic[n-n%10]);
  else if(n>=100) return numToEn(n%100, res + dic[Math.floor(n/100)] + dic[100] + 'and')
}

var res = 0;
for(var i=1; i<=1000; i++) {
  res += numToEn(i).length;
}
console.log(res);

