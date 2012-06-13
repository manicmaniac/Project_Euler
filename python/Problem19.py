# -*- coding:utf-8 -*-
'''
You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
'''

import calendar

class Problem19(calendar.Calendar):
    def isFirstDayMonday(self, year, month):
        return self.itermonthdays2(year, month).next() == (1, 6)

if __name__ == '__main__':
    p = Problem19(6)
    print sum([p.isFirstDayMonday(i, j) for i in range(1901, 2001) for j in range(1, 13)])

