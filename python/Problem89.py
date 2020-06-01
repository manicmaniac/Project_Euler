"""
The rules for writing Roman numerals allow for many ways of writing each number
(see About Roman Numerals...). However, there is always a "best" way of writing
a particular number.

For example, the following represent all of the legitimate ways of writing the
number sixteen:

IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI

The last example being considered the most efficient, as it uses the least
number of numerals.

The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
contains one thousand numbers written in valid, but not necessarily minimal,
Roman numerals; that is, they are arranged in descending units and obey the
subtractive pair rule (see About Roman Numerals... for the definitive rules for
this problem).

Find the number of characters saved by writing each of these in their minimal
form.

Note: You can assume that all the Roman numerals in the file contain no more
than four consecutive identical units.
"""
import string

FILE = '../resources/roman.txt'

class Roman(int):
    roman_dict = {1000: 'M', 900: 'CM', 500: 'D', 400: 'CD', 100: 'C', 90: 'XC',
            50: 'L', 40: 'XL', 10: 'X', 9: 'IX', 5: 'V', 4: 'IV', 1: 'I'}

    @classmethod
    def cons(cls, literal):
        def to_int(s, n=0):
            if not s:
                return n
            else:
                for i in cls.roman_dict.items():
                    if len(i[1]) == 2:
                        if s.startswith(i[1]):
                            return to_int(s[2:], n + i[0])
                for i in cls.roman_dict.items():
                    if len(i[1]) == 1:
                        if s.startswith(i[1]):
                            return to_int(s[1:], n + i[0])
        return Roman(to_int(literal))

    def __init__(self, env):
        int.__init__(self, env)

    def __str__(self):
        def to_roman(n, res=''):
            if not n:
                return res
            else:
                for i in sorted(self.roman_dict.keys())[::-1]:
                    if n >= i: return to_roman(n - i, res + self.roman_dict[i])
        return to_roman(self)


if __name__ == '__main__':
    with open(FILE) as f:
        data = f.read().splitlines()
    original_length = len(''.join(i for i in data))
    translated_length = len(''.join(str(Roman.cons(i)) for i in data))

    print original_length - translated_length

    for i in data:
        print int(Roman.cons(i)), i, Roman.cons(i)

