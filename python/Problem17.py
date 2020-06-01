# coding:utf-8
"""
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
"""

class Number(int):
    dic = { 0:'',
            1:'one',
            2:'two',
            3:'three',
            4:'four',
            5:'five',
            6:'six',
            7:'seven',
            8:'eight',
            9:'nine',
            10:'ten',
            11:'eleven',
            12:'twelve',
            13:'thirteen',
            14:'fourteen',
            15:'fifteen',
            16:'sixteen',
            17:'seventeen',
            18:'eighteen',
            19:'nineteen',
            20:'twenty',
            30:'thirty',
            40:'forty',
            50:'fifty',
            60:'sixty',
            70:'seventy',
            80:'eighty',
            90:'ninety',
            100:'handred',
            1000:'onethousand'
            }
    def numtoen(self):
        def _translate(num):
            self.en += Number.dic[num]

        if self.num == 1000: _translate(self.num); return
        elif self.num < 20: _translate(self.num); return
        elif 100 <= self.num < 1000:
            _translate(self.d3)
            _translate(100)
            if self.d2 + self.d1: self.en += 'and'
        if self.d2 * 10 + self.d1 < 20: _translate(self.d2 * 10 + self.d1)
        else:
            _translate(self.d2 * 10)
            _translate(self.d1)

    def __init__(self, num):
        self.num = num
        if num > 99: self.d3 = int(str(num)[-3])
        if num > 9: self.d2 = int(str(num)[-2])
        self.d1 = int(str(num)[-1])
        self.digits = len(str(num))
        self.en = ''

if __name__ == '__main__':
    res = ''
    for i in range(1, 1001):
        i = Number(i)
        i.numtoen()
        res += i.en
    print len(res)
