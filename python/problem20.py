# -*- coding:utf-8 -*-

def factorial(num):
    return reduce(lambda x, y: x * y, [i for i in range(2, num + 1)])
def sumDigits(num):
    lst = str(num)
    return reduce(lambda x, y: x + y, [int(i) for i in lst])

if __name__ == '__main__':
    print(sumDigits(factorial(100)))

