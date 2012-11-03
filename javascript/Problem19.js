/*
You are given the following information, but you may prefer to do some research
for yourself.

  • 1 Jan 1900 was a Monday.
  • Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
  • A leap year occurs on any year evenly divisible by 4, but not on a century
    unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1
Jan 1901 to 31 Dec 2000)?
*/

var _ = require('underscore');

console.log(_.range(1901, 2001).map(function(y) {
  return _.range(0, 12).filter(function(m) {
    return (new Date(y, m, 1)).getDay() === 0;
  }).length;
}).reduce(function(x, y) {
  return x + y;
}));

