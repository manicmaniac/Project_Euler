/*
 * In the card game poker, a hand consists of five cards and are ranked, from
 * lowest to highest, in the following way:
 *
 *   • High Card: Highest value card.
 *   • One Pair: Two cards of the same value.
 *   • Two Pairs: Two different pairs.
 *   • Three of a Kind: Three cards of the same value.
 *   • Straight: All cards are consecutive values.
 *   • Flush: All cards of the same suit.
 *   • Full House: Three of a kind and a pair.
 *   • Four of a Kind: Four cards of the same value.
 *   • Straight Flush: All cards are consecutive values of same suit.
 *   • Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
 *
 * The cards are valued in the order:
 * 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
 *
 * If two players have the same ranked hands then the rank made up of the highest
 * value wins; for example, a pair of eights beats a pair of fives (see example 1
 * below). But if two ranks tie, for example, both players have a pair of queens,
 * then highest cards in each hand are compared (see example 4 below); if the
 * highest cards tie then the next highest cards are compared, and so on.
 *
 * Consider the following five hands dealt to two players:
 *
 * Hand   Player 1            Player 2              Winner
 * 1      5H 5C 6S 7S KD      2C 3S 8S 8D TD        Player 2
 *        Pair of Fives       Pair of Eights
 * 2      5D 8C 9S JS AC      2C 5C 7D 8S QH        Player 1
 *        Highest card Ace    Highest card Queen
 * 3      2D 9C AS AH AC      3D 6D 7D TD QD        Player 2
 *        Three Aces          Flush with Diamonds
 *        4D 6S 9H QH QC      3D 6D 7H QD QS
 * 4      Pair of Queens      Pair of Queens        Player 1
 *        Highest card Nine   Highest card Seven
 *        2H 2D 4C 4D 4S      3C 3D 3S 9S 9D
 * 5      Full House          Full House            Player 1
 *        With Three Fours    with Three Threes
 *
 * The file, poker.txt, contains one-thousand random hands dealt to two players.
 * Each line of the file contains ten cards (separated by a single space): the
 * first five are Player 1's cards and the last five are Player 2's cards. You can
 * assume that all hands are valid (no invalid characters or repeated cards), each
 * player's hand is in no specific order, and in each hand there is a clear
 * winner.
 *
 * How many hands does Player 1 win?
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

public class Problem54 {
    public static class PlayingCard implements Comparable<PlayingCard> {
        public static final int CLUB = 0;
        public static final int DIAMOND = 1;
        public static final int HEART = 2;
        public static final int SPADE = 3;

        private static final String SUITS = "CDHS";
        private static final String RANKS = "23456789TJQKA";
        private static PlayingCard[] cachedInstances = new PlayingCard[52];

        private final int value;

        private PlayingCard(int value) {
            this.value = value;
        }

        public static PlayingCard get(int suit, int rank) {
            if (suit < 0 || suit > 3) {
                throw new IllegalArgumentException("invalid suit: " + suit);
            }
            if (rank < 1 || rank > 13) {
                throw new IllegalArgumentException("invalid rank: " + rank);
            }
            int value = suit + 4 * (rank == 1 ? 12 : rank - 2);
            return get(value);
        }

        public static PlayingCard get(CharSequence chars) {
            if (chars.length() != 2) {
                throw new IllegalArgumentException("invalid chars: " + chars);
            }
            int value = SUITS.indexOf(chars.charAt(1)) + 4 * RANKS.indexOf(chars.charAt(0));
            return get(value);
        }

        private static PlayingCard get(int value) {
            PlayingCard instance = cachedInstances[value];
            if (instance == null) {
                instance = new PlayingCard(value);
                cachedInstances[value] = instance;
            }
            return instance;
        }

        @Override
        public int compareTo(PlayingCard o) {
            return Integer.compare(value, o.value);
        }

        @Override
        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            if (o == this) {
                return true;
            }
            if (!(o instanceof PlayingCard)) {
                return false;
            }
            return ((PlayingCard) o).value == value;
        }

        @Override
        public int hashCode() {
            return 31 ^ Integer.hashCode(value);
        }

        @Override
        public String toString() {
            return "" + RANKS.charAt(getRankValue()) + SUITS.charAt(getSuit());
        }

        public int getSuit() {
            return value % 4;
        }

        public int getRank() {
            int rankValue = getRankValue();
            return (rankValue == 12) ? 1 : rankValue + 2;
        }

        private int getRankValue() {
            return (value - getSuit()) / 4;
        }
    }

    public static class PokerHand implements Comparable<PokerHand> {
        public static final int HIGH_CARD = 0;
        public static final int ONE_PAIR = 1;
        public static final int TWO_PAIRS = 2;
        public static final int THREE_OF_A_KIND = 3;
        public static final int STRAIGHT = 4;
        public static final int FLUSH = 5;
        public static final int FULL_HOUSE = 6;
        public static final int FOUR_OF_A_KIND = 7;
        public static final int STRAIGHT_FLUSH = 8;
        public static final int ROYAL_FLUSH = 9;

        private static final String[] KIND_NAMES = new String[]{
            "High Card", "One Pair", "Two Pairs", "Three of a Kind", "Straight", "Flush",
            "Full House", "Four of a Kind", "Straight Flush", "Royal Flush"
        };

        private final PlayingCard[] playingCards;
        private final int kind;

        public PokerHand(PlayingCard p1, PlayingCard p2, PlayingCard p3, PlayingCard p4, PlayingCard p5) {
            List<PlayingCard> playingCards = new ArrayList<>(Arrays.asList(p1, p2, p3, p4, p5));
            playingCards.sort(Comparator.naturalOrder());
            int rankBits = 0;
            Map<Integer, SortedSet<PlayingCard>> groupedBySuit = new HashMap<>();
            Map<Integer, SortedSet<PlayingCard>> groupedByRank = new HashMap<>();
            for (final PlayingCard playingCard : playingCards) {
                int suit = playingCard.getSuit();
                int rank = playingCard.getRank();
                rankBits |= 1 << (rank - 1);
                groupedBySuit.compute(suit, (k, v) -> {
                    if (v == null) {
                        v = new TreeSet<>();
                    }
                    v.add(playingCard);
                    return v;
                });
                groupedByRank.compute(rank, (k, v) -> {
                    if (v == null) {
                        v = new TreeSet<>();
                    }
                    v.add(playingCard);
                    return v;
                });
            }
            boolean isCyclicSequence = (rankBits == 0b1111000000001);
            while ((rankBits & 1) == 0) {
                rankBits >>= 1;
            }
            boolean isSequence = isCyclicSequence || (rankBits == 0b11111);
            if (groupedBySuit.size() == 1) {
                if (isCyclicSequence) {
                    kind = ROYAL_FLUSH;
                } else if (isSequence) {
                    kind = STRAIGHT_FLUSH;
                } else {
                    kind = FLUSH;
                }
            } else if (isSequence) {
                kind = STRAIGHT;
            } else {
                int maxSizeOfGroups = groupedByRank.values().stream().mapToInt(SortedSet::size).max().getAsInt();
                switch (maxSizeOfGroups) {
                    case 4:
                        kind = FOUR_OF_A_KIND;
                        break;
                    case 3:
                        kind = (groupedByRank.size() == 2 ? FULL_HOUSE : THREE_OF_A_KIND);
                        break;
                    case 2:
                        kind = (groupedByRank.size() == 3 ? TWO_PAIRS : ONE_PAIR);
                        break;
                    case 1:
                        kind = HIGH_CARD;
                        break;
                    default:
                        throw new AssertionError("cannot reach here");
                }
                if (maxSizeOfGroups > 1) {
                    SortedSet<PlayingCard> majorGroup = Collections.max(groupedByRank.values(), Comparator.comparing(SortedSet::size));
                    for (final PlayingCard playingCard : majorGroup) {
                        playingCards.remove(playingCard);
                    }
                    playingCards.addAll(majorGroup);
                }
            }
            this.playingCards = playingCards.toArray(new PlayingCard[0]);
        }

        @Override
        public int compareTo(PokerHand o) {
            int result = Integer.compare(kind, o.kind);
            if (result != 0) {
                return result;
            }
            for (int i = 4; i >= 0; i--) {
                result = playingCards[i].compareTo(o.playingCards[i]);
                if (result != 0) {
                    return result;
                }
            }
            return 0;
        }

        @Override
        public String toString() {
            return getKindAsString() + Arrays.toString(playingCards);
        }

        public int getKind() {
            return kind;
        }

        public String getKindAsString() {
            return KIND_NAMES[getKind()];
        }
    }

    public static void main(String[] args) throws IOException {
        int answer = 0;
        File file = new File("../resources/poker.txt");
        try (FileReader fileReader = new FileReader(file);
             BufferedReader bufferedReader = new BufferedReader(fileReader)) {
            while (bufferedReader.ready()) {
                String line = bufferedReader.readLine();
                String[] symbols = line.split(" ");
                PlayingCard[] playingCards = Arrays.stream(symbols)
                        .map(PlayingCard::get)
                        .toArray(PlayingCard[]::new);
                PokerHand hand1 = new PokerHand(
                        playingCards[0],
                        playingCards[1],
                        playingCards[2],
                        playingCards[3],
                        playingCards[4]
                );
                PokerHand hand2 = new PokerHand(
                        playingCards[5],
                        playingCards[6],
                        playingCards[7],
                        playingCards[8],
                        playingCards[9]
                );
                if (hand1.compareTo(hand2) > 0) {
                    answer++;
                }
            }
        }
        System.out.println(answer);
    }
}
