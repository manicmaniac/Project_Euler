# coding:utf-8
"""
A common security method used for online banking is to ask the user for three
random characters from a passcode. For example, if the passcode was 531278,
they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be:
317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file
so as to determine the shortest possible secret passcode of unknown length.
"""

from itertools import permutations

FILE = '../resources/keylog.txt'

class KeySolver(object):
    def solve(self):
        perms = self.key_perms[:]
        for i in self.key_perms:
            for j in self.keylog:
                if not i.index(j//100) < i.index(j%100//10) < i.index(j%100%10):
                    perms.remove(i)
                    break
        return ''.join(str(i) for i in perms[0])

    def __init__(self, keylog):
        self.keylog = keylog
        self.used_numbers = sorted(map(int, set(''.join(str(i) for i in keylog))))
        self.key_perms = list(permutations(self.used_numbers))


if __name__ == '__main__':
    with open(FILE) as f:
        keylog = [int(i) for i in f.read().splitlines()]
    ks = KeySolver(keylog)
    print(ks.solve())
