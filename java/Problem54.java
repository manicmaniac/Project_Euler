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
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import static java.util.Comparator.comparingInt;
import static java.util.stream.Collectors.groupingBy;

public class Problem54 {

    private enum Suit {
        CLUB,
        DIAMOND,
        HEART,
        SPADE;

        private static final char[] SYMBOLS = new char[]{'C', 'D', 'H', 'S'};

        public static Suit get(int ordinal) {
            switch (ordinal) {
                case 0:
                    return CLUB;
                case 1:
                    return DIAMOND;
                case 2:
                    return HEART;
                case 3:
                    return SPADE;
                default:
                    throw new IllegalArgumentException("invalid ordinal: " + ordinal);
            }
        }

        public static Suit get(char symbol) {
            int ordinal = Arrays.binarySearch(SYMBOLS, symbol);
            if (ordinal < 0) {
                throw new IllegalArgumentException("invalid symbol: " + symbol);
            }
            return get(ordinal);
        }

        @Override
        public String toString() {
            return Character.toString(SYMBOLS[ordinal()]);
        }
    }

    private static class Rank implements Comparable<Rank> {
        private static final Rank[] sharedInstances = IntStream.range(0, 13)
                .mapToObj(Rank::new)
                .toArray(Rank[]::new);
        private static final char[] SYMBOLS = new char[]{'2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'};

        private final int value;

        private Rank(int value) {
            this.value = value;
        }

        static Rank get(int n) {
            int value = (n == 1) ? 12 : n - 2;
            return sharedInstances[value];
        }

        static Rank get(char symbol) {
            for (int i = 0; i < SYMBOLS.length; i++) {
                if (SYMBOLS[i] == symbol) {
                    return get(i == 12 ? 1 : i + 2);
                }
            }
            throw new IllegalArgumentException("invalid symbol: " + symbol);
        }

        @Override
        public int compareTo(Rank o) {
            return Integer.compare(value, o.value);
        }

        @Override
        public String toString() {
            return Character.toString(SYMBOLS[value]);
        }
    }

    private static class PlayingCard implements Comparable<PlayingCard> {
        private static final PlayingCard[] sharedInstances = IntStream.range(0, 52)
                .mapToObj(PlayingCard::new)
                .toArray(PlayingCard[]::new);

        private final Suit suit;
        private final Rank rank;

        private PlayingCard(Suit suit, Rank rank) {
            this.suit = suit;
            this.rank = rank;
        }

        private PlayingCard(int value) {
            this(Suit.get(value & 3), Rank.get((value >> 2) == 12 ? 1 : (value >> 2) + 2));
        }

        static PlayingCard get(Suit suit, Rank rank) {
            return get(suit.ordinal() | rank.value << 2);
        }

        static PlayingCard get(String symbol) {
            if (symbol.length() != 2) {
                throw new IllegalArgumentException("invalid symbol: " + symbol);
            }
            return get(Suit.get(symbol.charAt(1)), Rank.get(symbol.charAt(0)));
        }

        private static PlayingCard get(int value) {
            return sharedInstances[value];
        }

        Rank getRank() {
            return rank;
        }

        @Override
        public int compareTo(PlayingCard o) {
            int result = rank.compareTo(o.rank);
            if (result != 0) {
                return result;
            }
            return suit.compareTo(o.suit);
        }

        @Override
        public String toString() {
            return rank.toString() + suit.toString();
        }
    }

    private enum PokerHandKind {
        HIGH_CARD,
        ONE_PAIR,
        TWO_PAIRS,
        THREE_OF_A_KIND,
        STRAIGHT,
        FLUSH,
        FULL_HOUSE,
        FOUR_OF_A_KIND,
        STRAIGHT_FLUSH,
        ROYAL_FLUSH
    }

    private static class PokerHand implements Comparable<PokerHand> {
        private final PlayingCard[] playingCards;
        private final PokerHandKind kind;

        PokerHand(PlayingCard p1, PlayingCard p2, PlayingCard p3, PlayingCard p4, PlayingCard p5) {
            this(new PlayingCard[]{p1, p2, p3, p4, p5});
        }

        private PokerHand(PlayingCard... playingCards) {
            if (playingCards.length != 5) {
                throw new IllegalArgumentException("invalid number of playing cards: " + playingCards.length);
            }
            this.playingCards = playingCards;
            if (countSuits() == 1) {
                if (isSequential()) {
                    if (getMaxRank().equals(Rank.get(1))) {
                        kind = PokerHandKind.ROYAL_FLUSH;
                    } else {
                        kind = PokerHandKind.STRAIGHT_FLUSH;
                    }
                } else {
                    kind = PokerHandKind.FLUSH;
                }
                Arrays.sort(playingCards);
            } else if (isSequential()) {
                kind = PokerHandKind.STRAIGHT;
                Arrays.sort(playingCards);
            } else {
                switch (countRanks()) {
                    case 5:
                        kind = PokerHandKind.HIGH_CARD;
                        Arrays.sort(playingCards);
                        break;
                    case 4:
                        kind = PokerHandKind.ONE_PAIR;
                        sortByRankCommonality();
                        break;
                    case 3:
                        if (countMostCommonRanks() == 3) {
                            kind = PokerHandKind.THREE_OF_A_KIND;
                        } else {
                            kind = PokerHandKind.TWO_PAIRS;
                        }
                        sortByRankCommonality();
                        break;
                    case 2:
                        if (countMostCommonRanks() == 4) {
                            kind = PokerHandKind.FOUR_OF_A_KIND;
                        } else {
                            kind = PokerHandKind.FULL_HOUSE;
                        }
                        sortByRankCommonality();
                        break;
                    default:
                        throw new IllegalStateException("cannot reach here");
                }
            }
        }

        @Override
        public int compareTo(PokerHand o) {
            int result = kind.compareTo(o.kind);
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
            return kind + Arrays.toString(playingCards);
        }

        private boolean isSequential() {
            int bits = 0;
            for (final PlayingCard playingCard : playingCards) {
                bits |= 1 << (playingCard.rank.value);
            }
            if (bits == 0b1000000001111) {
                return true;
            }
            while ((bits & 1) == 0) {
                bits >>>= 1;
            }
            return bits == 0b11111;
        }

        private Rank getMaxRank() {
            Rank maxRank = null;
            for (final PlayingCard playingCard : playingCards) {
                Rank rank = playingCard.rank;
                if (maxRank == null || maxRank.compareTo(rank) < 0) {
                    maxRank = rank;
                }
            }
            return maxRank;
        }

        private int countSuits() {
            int bits = 0;
            for (final PlayingCard playingCard : playingCards) {
                bits |= 1 << playingCard.suit.ordinal();
            }
            return Integer.bitCount(bits);
        }

        private int countRanks() {
            int bits = 0;
            for (final PlayingCard playingCard : playingCards) {
                bits |= 1 << playingCard.rank.value;
            }
            return Integer.bitCount(bits);
        }

        private int countMostCommonRanks() {
            int[] counter = new int[13];
            for (final PlayingCard playingCard : playingCards) {
                counter[playingCard.rank.value]++;
            }
            int maxCount = 0;
            for (int count : counter) {
                if (maxCount < count) {
                    maxCount = count;
                }
            }
            return maxCount;
        }

        private void sortByRankCommonality() {
            PlayingCard[] newPlayingCards = Arrays.stream(playingCards)
                    .collect(groupingBy(PlayingCard::getRank))
                    .entrySet()
                    .stream()
                    .sorted(comparingInt((Map.Entry<Rank, List<PlayingCard>> entry) -> entry.getValue().size())
                            .thenComparing(Map.Entry.comparingByKey()))
                    .flatMap(entry -> entry.getValue().stream())
                    .toArray(PlayingCard[]::new);
            System.arraycopy(newPlayingCards, 0, playingCards, 0, newPlayingCards.length);
        }
    }

    public static void main(String[] args) throws IOException {
        File file = new File("../resources/poker.txt");
        int answer = 0;
        try (FileReader fileReader = new FileReader(file);
             BufferedReader bufferedReader = new BufferedReader(fileReader)) {
            while (bufferedReader.ready()) {
                String line = bufferedReader.readLine();
                String[] symbols = line.split(" ");
                PlayingCard[] playingCards = new PlayingCard[10];
                for (int i = 0; i < 10; i++) {
                    playingCards[i] = PlayingCard.get(symbols[i]);
                }
                PokerHand pokerHand1 = new PokerHand(
                        playingCards[0],
                        playingCards[1],
                        playingCards[2],
                        playingCards[3],
                        playingCards[4]
                );
                PokerHand pokerHand2 = new PokerHand(
                        playingCards[5],
                        playingCards[6],
                        playingCards[7],
                        playingCards[8],
                        playingCards[9]
                );
                if (pokerHand1.compareTo(pokerHand2) > 0) {
                    answer++;
                }
            }
        }
        System.out.println(answer);
    }
}
