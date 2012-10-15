###
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
###

_cal = (y=1901, m=-1, date=new Date()) -> ->
		if m > 10 then [y, m] = [y + 1, 0] else m++
		date.setYear(y); date.setMonth(m); date.getDay()
cal = _cal()

console.log (cal() for i in [1..1200]).filter((x) -> !x).length

