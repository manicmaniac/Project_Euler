#!/usr/bin/env python
# -*- coding:utf-8 -*-

#A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

class Pythagorean(object):
    '''
    Generator object finding pythagorean triplet.

    A Pythagorean triplet is a set of three natural numbers, a b c, for which, a^2 + b^2 = c^2.
    These triplet can be described a = m^2-n^2, b = 2mn, c = m^2 + n^2
    '''
    def gen(self, max = 0):
        '''
        This method generates three natural numbers in tupples.

        Repeats until variant "m" inside this method reaches argument "max".
        If "max" is not a natural number, it returns ValueError.
        If "max" is set 0, this method pretends infinity generator.
        '''
        if max < 0: raise ValueError
        m, n = self.m, self.n
        while m < max or not max:
            n = 1
            while n < m:
                a, b, c = m ** 2 - n ** 2, 2 * m * n, m ** 2 + n ** 2
                yield a, b, c
                n += 1
            m += 1

    def __init__(self):
        self.m, self.n = 2, 1

if __name__ == '__main__':
    pythagorean = Pythagorean()
    for i in pythagorean.gen():
        if i[0] + i[1] + i[2] == 1000:
            print i[0] * i[1] * i[2]
            break
