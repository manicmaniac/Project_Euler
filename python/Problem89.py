'''
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
'''
import string

class Roman(int):
    def __init__(self, input, minimal=True):
        self.__input = input
        self.__minimal = bool(minimal)

    def __str__(self):
        def int_to_roman(n, res=''):
            roman_dict = {1000: 'M', 500: 'D', 100: 'C', 50: 'L', 10: 'X', 5: 'V', 1: 'I'}
            minimal_dict = {900: 'CM', 400: 'CD', 90: 'XC', 40: 'XL', 9: 'IX', 4: 'IV'}
            if self.__minimal: roman_dict = dict(roman_dict, **minimal_dict)
            if n > 0:
                for i in reversed(sorted(roman_dict.iterkeys())):
                    if n >= i: return int_to_roman(n-i, res+roman_dict[i])
            else:
                return res
        return int_to_roman(self.__input)



if __name__ == '__main__':
    print Roman(234, False)
