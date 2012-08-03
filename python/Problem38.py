#/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Take the number 192 and multiply it by each of 1, 2, and 3:

192  1 = 192
192  2 = 384
192  3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n  1?
'''

def is_pandigital(n):
    s = str(n)
    if len(s) != 9: return False
    if '0' in s: return False
    if len(set(s)) != 9: return False
    else: return True

if __name__ == '__main__':
    res = []
    for i in range(1, 9877):
        acc = ''
        for j in range(1, 10):
            acc += str(i * j)
            if len(acc) >= 9:
                break
        if is_pandigital(acc): res.append(acc)
    print max(res)

