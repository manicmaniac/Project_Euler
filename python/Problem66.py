# coding:utf-8
"""
Consider quadratic Diophantine equations of the form:

x^2 – Dy^2 = 1

For example, when D=13, the minimal solution in x is 649^2 – 13×180^2 = 1.

It can be assumed that there are no solutions in positive integers when D is
square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
following:

3^2 – 2×2^2 = 1
2^2 – 3×1^2 = 1
9^2 – 5×4^2 = 1
5^2 – 6×2^2 = 1
8^2 – 7×3^2 = 1

Hence, by considering minimal solutions in x for D ≤ 7, the largest x is
obtained when D=5.

Find the value of D ≤ 1000 in minimal solutions of x for which the largest
value of x is obtained.
"""

def continued_fraction_sqrt(x):
    r = int(x ** 0.5)
    yield r
    if r * r == x:
        return
    a, p, q = r, 0, 1
    while True:
        p = a * q - p
        q = (x - p * p) / q
        a = (r + p) / q
        yield a
        if q == 1:
            return


def continued_fraction_to_fraction(cf):
    n, d = 1, 0
    for i in reversed(cf):
        n, d = d + n * i, n
    return n, d


def solve_diophantine_equation(d):
    cf = list(continued_fraction_sqrt(d))
    if len(cf) % 2:
        return continued_fraction_to_fraction(cf[:-1])
    cf += cf[1:]
    return continued_fraction_to_fraction(cf[:-1])


if __name__ == '__main__':
    maximum_d = 0
    maximum_x = 0
    for d in range(1000):
        x, y = solve_diophantine_equation(d)
        assert x * x - d * y * y == 1
        if maximum_x < x:
            maximum_x = x
            maximum_d = d
    print(maximum_d)
