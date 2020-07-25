"""
By counting carefully it can be seen that a rectangular grid measuring 3 by 2
contains eighteen rectangles:

[p085]

Although there exists no rectangular grid that contains exactly two million
rectangles, find the area of the grid with the nearest solution.
"""

def count_rectangles(w, h):
    return (w + 1) * w / 2 * (h + 1) * h / 2


def find_nearest(target):
    for i in range(100):
        for j in range(i):
            n = count_rectangles(i, j)
            if n > target:
                if abs(n - target) < abs(prev_n - target):
                    yield abs(n - target), i * j
                else:
                    yield abs(prev_n - target), prev_s
            prev_n = n
            prev_s = i * j


if __name__ == '__main__':
    print(min(find_nearest(2000000), key=lambda x: x[0])[1])
