#/usr/bin/env python
# -*- coding:utf-8 -*-
#The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
#Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

def f(max):
    res = 0
    for i in range(1, max + 1):
        res += pow(i, i)
    return str(res)[-10:]

if __name__ == '__main__':
    print f(1000)

