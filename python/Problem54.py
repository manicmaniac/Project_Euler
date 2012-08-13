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

FILE = './poker.txt'

class PlayingCard(object):
    SUITS = {'Club': '♣', 'Diamond': '♢',
            'Heart': '♡', 'Spade': '♠'}

    RANKS = {1: 'A', 2: '2', 3: '3', 4: '4',
            5: '5', 6: '6', 7: '7', 8: '8',
            9: '9', 10: '10', 11: 'J', 12: 'Q',
            13: 'K'}

    @classmethod
    def fullset(self):
        fullset = [PlayingCard(s, r)
                for s in self.SUITS
                for r in self.RANKS]
        return fullset

    def __init__(self, suit, rank):
        if suit in self.SUITS and rank in self.RANKS:
            self.suit = suit
            self.rank = rank
        else:
            raise ValueError

    def __repr__(self):
        return "%s%s" % (self.SUITS[self.suit], self.RANKS[self.rank])

    def __int__(self):
        return self.rank

    def __cmp__(self, other):
        if self.rank * other.rank == 1:
            return 0
        elif self.rank == 1:
            return 1
        elif other.rank == 1:
            return -1
        else:
            return self.rank - other.rank


class Hand(object):
    @classmethod
    def __str__(cls):
        return cls.__name__

    def __init__(self, first_ranks, *cards):
        if cards:
            self.__high_ranks = [first_ranks] + sorted(cards)[::-1]

    def __cmp__(self, other):
        if self.score == other.score:
            if self.__high_ranks > other.__high_ranks:
                return 1
            elif self.__high_ranks < other.__high_ranks:
                return -1
            else:
                return 0
        else:
            return self.score - other.score


class RoyalFlush(Hand): score = 10


class StraightFlush(Hand): score = 9


class FourOfAKind(Hand): score = 8


class FullHouse(Hand): score = 7


class Flush(Hand): score = 6


class Straight(Hand): score = 5


class ThreeOfAKind(Hand): score = 4


class TwoPairs(Hand): score = 3


class OnePair(Hand): score = 2


class HighCard(Hand): score = 1


def hand(*cards):
    ranks = sorted(i.rank for i in cards)
    suits = [i.suit for i in cards]

    def is_flush():
        return len(set(suits)) == 1
    def is_straight():
        return [i - min(ranks) for i in ranks] in [range(5), [0, 9, 10, 11, 12]]

    def group_by_ranks(rest=ranks, res=[]):
        if not rest:
            return dict(sorted(res))
        else:
            return group_by_ranks(rest[1:], res + [(rest[0], 1 + rest[1:].count(rest[0]))])

    if is_straight() and is_flush() and min(ranks) == 1:
        return RoyalFlush(PlayingCard('Spade', 1), *cards)
    elif is_straight() and is_flush():
        return StraightFlush(max(cards), *cards)
    elif sorted(group_by_ranks().values()) == [1, 4]:
        first_rank = PlayingCard('Spade', max(i for i in group_by_ranks().items() if i[1] == 4))
        return FourOfAKind(first_rank, *cards)
    elif sorted(group_by_ranks().values()) == [2, 3]:
        return FullHouse(max(cards), *cards)
    elif is_flush():
        return Flush(max(cards), *cards)
    elif is_straight():
        return Straight(max(cards), *cards)
    elif sorted(group_by_ranks().values()) == [1, 1, 3]:
        first_rank = PlayingCard('Spade', max(i[0] for i in group_by_ranks().items() if i[1] == 3))
        return ThreeOfAKind(first_rank, *cards)
    elif sorted(group_by_ranks().values()) == [1, 2, 2]:
        first_rank = PlayingCard('Spade', max(i[0] for i in group_by_ranks().items() if i[1] == 2))
        return TwoPairs(first_rank, *cards)
    elif sorted(group_by_ranks().values()) == [1, 1, 1, 2]:
        first_rank = PlayingCard('Spade', max(i[0] for i in group_by_ranks().items() if i[1] == 2))
        return OnePair(first_rank, *cards)
    else:
        return HighCard(max(cards), *cards)


class Player(object):
    def __init__(self):
        self.cards = []
        self.hand = ''

    def check(self):
        self.hand = hand(*self.cards)


class Dealer(object):
    def __init__(self, talon):
        self.talon = talon

    def deal(self, *players):
        for i in players:
            i.cards = self.talon[:5]
            del self.talon[:5]


def make_talon(data):
    suits = {'C': 'Club', 'D': 'Diamond', 'H': 'Heart', 'S': 'Spade'}
    ranks = {'A': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6,
            '7': 7, '8': 8, '9': 9, 'T': 10, 'J': 11, 'Q': 12, 'K': 13}
    return [PlayingCard(suits[i[1]], ranks[i[0]]) for i in data[:-1]]


if __name__ == '__main__':
    with open(FILE) as f:
        data = f.read().replace('\r\n', ' ').split(' ')
    TALON =  make_talon(data)

    dealer = Dealer(TALON)
    player1 = Player()
    player2 = Player()
    res = 0
    for i in range(len(TALON) / 10):
        dealer.deal(player1, player2)
        player1.check()
        player2.check()
        if player1.hand > player2.hand:
            print "o",
            res += 1
        else: print "x",
        print player1.cards, player1.hand, player2.cards, player2.hand
    print res
