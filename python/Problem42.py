#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The nth term of the sequence of triangle numbers is given by, tn = Â½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
'''
from itertools import count
import csv

def gen_triangle(m=0):
    for n in count():
        res = n * (n + 1) / 2
        if m and res > m: return
        yield res


def is_triangle(x):
    if isinstance(x, int):
        return x in [i for i in gen_triangle(x)]
    elif isinstance(x, str):
        acc = 0
        for char in x:
            acc += ord(char) - 64
        return is_triangle(acc)
    else:
        raise TypeError


if __name__ == '__main__':
    with open('words.txt', 'rb') as f:
        reader = csv.reader(f)
        for row in reader:
            print sum(is_triangle(i) for i in row)
