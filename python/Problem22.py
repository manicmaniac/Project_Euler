#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.

What is the total of all the name scores in the file?
'''
import csv

FILENAME = './names.txt'

class Name(object):
    @property
    def score(self):
        score = 0
        for i, name in enumerate(self.namelist):
            for char in name:
                score += (ord(char) - 64) * (i + 1)
        return score

    def __init__(self, filename):
        csvfile = list(csv.reader(open(filename)))
        self.namelist = sorted(csvfile[0])


if __name__ == '__main__':
    print Name(FILENAME).score

