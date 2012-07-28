#/usr/bin/env python
# -*- coding:utf-8 -*-
'''
In the card game poker, a hand consists of five cards and are ranked, from
lowest to highest, in the following way:

  • High Card: Highest value card.
  • One Pair: Two cards of the same value.
  • Two Pairs: Two different pairs.
  • Three of a Kind: Three cards of the same value.
  • Straight: All cards are consecutive values.
  • Flush: All cards of the same suit.
  • Full House: Three of a kind and a pair.
  • Four of a Kind: Four cards of the same value.
  • Straight Flush: All cards are consecutive values of same suit.
  • Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest
value wins; for example, a pair of eights beats a pair of fives (see example 1
below). But if two ranks tie, for example, both players have a pair of queens,
then highest cards in each hand are compared (see example 4 below); if the
highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:

Hand   Player 1            Player 2              Winner
1      5H 5C 6S 7S KD      2C 3S 8S 8D TD        Player 2
       Pair of Fives       Pair of Eights
2      5D 8C 9S JS AC      2C 5C 7D 8S QH        Player 1
       Highest card Ace    Highest card Queen
3      2D 9C AS AH AC      3D 6D 7D TD QD        Player 2
       Three Aces          Flush with Diamonds
       4D 6S 9H QH QC      3D 6D 7H QD QS
4      Pair of Queens      Pair of Queens        Player 1
       Highest card Nine   Highest card Seven
       2H 2D 4C 4D 4S      3C 3D 3S 9S 9D
5      Full House          Full House            Player 1
       With Three Fours    with Three Threes

The file, poker.txt, contains one-thousand random hands dealt to two players.
Each line of the file contains ten cards (separated by a single space): the
first five are Player 1's cards and the last five are Player 2's cards. You can
assume that all hands are valid (no invalid characters or repeated cards), each
player's hand is in no specific order, and in each hand there is a clear
winner.

How many hands does Player 1 win?
'''

TALON = "./poker.txt"


class Player(object):
    '''
    引数なしでインスタンス生成できます。
    Dealerオブジェクトからカードを受け取り、checkメソッドで役(self.hand)とスコア(self.score)を計算します。
    不等号により別のPlayerオブジェクトとスコアを比較できます。
    '''
    def __init__(self):
        self.cards = []
        self.hand = ''
        self.score = 0

    def check(self):
        if not self.cards:
            raise AttributeError
        def is_flush():
            return len(set(i[0] for i in self.cards)) == 1
        def is_for_of_a_kind():
            return len(set(i[1] for i in self.cards)) == 2
        return is_for_of_a_kind()
        
            

class Dealer(object):
    '''
    インスタンス生成時にカードの山(rawdata)を受け取ります。
    dealメソッドはカードの山から２人のプレイヤーに５枚ずつ配ります。
    Dealerが配るカードは５つの要素からなるリストで、リストの各要素はマークと数字からなるタプルでできています。
    例：dict('Heart': 5, 'Club': 5, 'Spade': 6, 'Spade': 7, 'Diamond': 13)
    '''
    def __init__(self, rawdata):
        self.rawdata = rawdata

    def deal(self, player1, player2):
        rawcards = self.rawdata.pop(0).split(' ')
        def replace_mark(rawcard_mark):
            '''
            'S', 'H'などのマークをわかりやすい言葉'Spade', 'Heart'などに変換します。
            '''
            marks = {'S': 'Spade', 'H': 'Heart', 'D': 'Diamond', 'C': 'Club'}
            return [marks[i] for i in rawcard_mark]

        def replace_number(rawcard_number):
            '''
            'A', 'Q'などの記号をわかりやすい数字 1, 12などに変換します。
            '''
            numbers = {
                    'A': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
                    '8': 8, '9': 9, 'T': 10, 'J': 11, 'Q': 12, 'K': 13
                    }
            return [numbers[i] for i in rawcard_number]
        dealing_cards = zip(replace_mark([rawcard[1] for rawcard in rawcards]),
                replace_number([rawcard[0] for rawcard in rawcards]))

        '''
        Playerオブジェクトにカードを配ります。
        '''
        player1.cards = dealing_cards[:5]
        player2.cards = dealing_cards[5:]


if __name__ == '__main__':
    with open(TALON) as f:
        rawdata = f.read().splitlines()
    player1 = Player()
    player2 = Player()
    dealer = Dealer(rawdata)
    for i in range(900):
        dealer.deal(player1, player2)
        if player1.check(): print player1.cards
        if player2.check(): print player2.cards
