# coding:utf-8
"""
Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and
each line adding to nine.

[p068_1]

Working clockwise, and starting from the group of three with the numerically
lowest external node (4,3,2 in this example), each solution can be described
uniquely. For example, the above solution can be described by the set: 4,3,2;
6,2,1; 5,1,3.

It is possible to complete the ring with four different totals: 9, 10, 11, and
12. There are eight solutions in total.

Total          Solution Set
9              4,2,3; 5,3,1; 6,1,2
9              4,3,2; 6,2,1; 5,1,3
10             2,3,5; 4,5,1; 6,1,3
10             2,5,3; 6,3,1; 4,1,5
11             1,4,6; 3,6,2; 5,2,4
11             1,6,4; 5,4,2; 3,2,6
12             1,5,6; 2,6,4; 3,4,5
12             1,6,5; 3,5,4; 2,4,6

By concatenating each group it is possible to form 9-digit strings; the maximum
string for a 3-gon ring is 432621513.

Using the numbers 1 to 10, and depending on arrangements, it is possible to
form 16- and 17-digit strings. What is the maximum 16-digit string for a
"magic" 5-gon ring?

[p068_2]
"""

"""
    o0
      \
       i0   o1
     /   \  /
   i4     i1
  / \     /
o4  i3 - i2 - o2
     \
      o3
"""

from itertools import product

i = [0, 0, 0, 0, 0]
o = [0, 0, 0, 0, 0]

o[0] = 6
candidates_of_o = [7, 8, 9, 10]
candidates_of_i = [1, 2, 3, 4, 5]

def repr_pentagon(i, o):
    return ''.join(map(str, [
    o[0], i[0], i[1],
    o[1], i[1], i[2],
    o[2], i[2], i[3],
    o[3], i[3], i[4],
    o[4], i[4], i[0]]))
    
def sum_of_line(i, o):
    return sum(i) + sum(o) * 2 / 5

def validate(i, o):
    s = 14
    sum_is_14 = all((
    s == o[0] + i[0] + i[1],
    s == o[1] + i[1] + i[2],
    s == o[2] + i[2] + i[3],
    s == o[3] + i[3] + i[4],
    s == o[4] + i[4] + i[0]))
    appears_each_number = set(i + o) == set(range(1, 11))
    return sum_is_14 and appears_each_number


res = []
for o[1:] in product(candidates_of_o, repeat=5):
    for i[0] in candidates_of_i:
        i[1] = 14 - i[0] - o[0]
        i[4] = 14 - i[0] - o[4]
        #
        i[2] = 14 - i[1] - o[1]
        i[3] = 14 - i[2] - o[2]
        if not validate(i, o):
            continue
        pentagon = i + o
        if not all(map(lambda x: x in candidates_of_i, i)):
            continue
        if not all(map(lambda x: x in candidates_of_o + [6], o)):
            continue
        if pentagon.count(10) > 1:
            continue
        r = repr_pentagon(i, o)
        if len(r) == 16:
            res.append(r)
print max(res)

