# coding:utf-8
"""
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
"""

def is_palindromic(n):
    return str(n) == str(n)[::-1]

def base2(n):
    return int(format(n, 'b'))

if __name__ == '__main__':
    print(sum(i for i in range(10**6) if is_palindromic(i) and is_palindromic(base2(i))))
