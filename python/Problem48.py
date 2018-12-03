#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
'''

print(sum(pow(i, i, int(1e10)) for i in range(1, 1001)) % int(1e10))
