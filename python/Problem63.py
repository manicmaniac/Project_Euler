# coding:utf-8
"""
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
"""

print(len(list(i for i in range(1, 10) for j in range(1, 22) if len(str(i ** j)) == j)))
