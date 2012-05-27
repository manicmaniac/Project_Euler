#!/usr/bin/env python
# -*- coding:utf-8 -*-

#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

def SumMultiple(num):
    result = set([])
    for i in range(1, num + 1):
        if i % 3.0 == 0:
            result.add(i)
        if i % 5.0 == 0:
            result.add(i)
    return sum(result)

#Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

def SumFibonacci(num):
    result = [1,1]
    i = 1
    while True:
        if result[-1] > 4000000:
            return(sum(result[1:-1]))
        result.append(result[i] + result[i -1])
        i += 1

#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

def FindLargestPrimeFactor(num):
    i = 2
    while True:
        if num % i == 0:
            return num / i
        i += 1
    return 'Error'

#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
#Find the largest palindrome made from the product of two 3-digit numbers.

def FindPalindromicNumber(num):
    i = reversed(range(num))

if __name__ == '__main__':
    #print(SumMultiple(1000))
    #print(SumFibonacci(1000))
    print(FindLargestPrimeFactor(600851475143))
