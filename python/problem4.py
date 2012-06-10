#!/usr/bin/env python
# -*- coding:utf-8 -*-

#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
#Find the largest palindrome made from the product of two 3-digit numbers.

def IsPalindromicNumber(num):
    s = list(str(num))
    t = 1
    for i in range(len(s) / 2):
        if s[i] == s[-(i + 1)]:
            t += 1
        if t > len(s) / 2:
            return True

def FindPalindromicNumber(num):
    candidates = []
    for i in reversed(range(10 ** (num - 1), 10 ** num)):
        for j in reversed(range(10 ** (num - 1), 10 ** num)):
            if IsPalindromicNumber(i * j) == True:
                candidates.append(i * j)
    return max(candidates)

if __name__ == '__main__':
    print(FindPalindromicNumber(3))
