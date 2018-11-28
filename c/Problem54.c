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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int bit_count(int x) {
    x = (x & 0x55555555) + (x >> 1 & 0x55555555);
    x = (x & 0x33333333) + (x >> 2 & 0x33333333);
    x = (x & 0x0f0f0f0f) + (x >> 4 & 0x0f0f0f0f);
    x = (x & 0x00ff00ff) + (x >> 8 & 0x00ff00ff);
    return (x & 0x0000ffff) + (x >> 16 & 0x0000ffff);
}

static const char rank_symbols[] = { 0, 'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K' };

int rank_init(int *rank, char symbol) {
    int i;

    for (i = 0; i < sizeof(rank_symbols) / sizeof(rank_symbols[0]); i++) {
        if (symbol == rank_symbols[i]) {
            if (rank) {
                *rank = i;
            }
            return 1;
        }
    }
    return 0;
}

int rank_compare(int lhs, int rhs) {
    lhs = (lhs == 1) ? 14 : (lhs - 2);
    rhs = (rhs == 1) ? 14 : (rhs - 2);
    return memcmp(&lhs, &rhs, sizeof(int));
}

char rank_to_symbol(int rank) {
    if (rank < 1 || rank > 13) {
        return 0;
    }
    return rank_symbols[rank];
}

typedef enum {
    SUIT_CLUB = 0,
    SUIT_DIAMOND,
    SUIT_HEART,
    SUIT_SPADE,
} suit_t;

static const char suit_symbols[] = { 'C', 'D', 'H', 'S' };

int suit_init(suit_t *suit, char symbol) {
    int i;

    for (i = 0; i < sizeof(suit_symbols) / sizeof(suit_symbols[0]); i++) {
        if (symbol == suit_symbols[i]) {
            if (suit) {
                *suit = i;
            }
            return 1;
        }
    }
    return 0;
}

int suit_compare(suit_t lhs, suit_t rhs) {
    return memcmp(&lhs, &rhs, sizeof(suit_t));
}

char suit_to_symbol(suit_t suit) {
    return suit_symbols[suit];
}

typedef struct {
    int suit;
    int rank;
} card_t;

int card_init(card_t *card, const char *symbols) {
    int rank;
    suit_t suit;

    if (!rank_init(&rank, symbols[0])) {
        return 0;
    }
    if (!suit_init(&suit, symbols[1])) {
        return 0;
    }
    if (card) {
        card->rank = rank;
        card->suit = suit;
    }
    return 1;
}

int card_compare(const card_t *lhs, const card_t *rhs) {
    int result;

    result = rank_compare(lhs->rank, rhs->rank);
    if (!result) {
        result = suit_compare(lhs->suit, rhs->suit);
    }
    return result;
}

void card_get_symbols(const card_t *card, char *buffer) {
    if (buffer) {
        buffer[0] = rank_to_symbol(card->rank);
        buffer[1] = suit_to_symbol(card->suit);
        buffer[2] = 0;
    }
}

int cards_count_suits(const card_t *cards, int ncards) {
    int bits = 0, i;

    for (i = 0; i < ncards; i++) {
        bits |= 1 << cards[i].suit;
    }
    return bit_count(bits);
}

int cards_count_ranks(const card_t *cards, int ncards) {
    int bits = 0, i;

    for (i = 0; i < ncards; i++) {
        bits |= 1 << cards[i].rank;
    }
    return bit_count(bits);
}

int cards_are_sequential(const card_t *cards, int ncards) {
    int bits = 0, i;

    for (i = 0; i < ncards; i++) {
        bits |= 1 << cards[i].rank;
    }
    if (bits == /* 0b1000000001111 */ 0x100f) {
        return 1;
    }
    while (!(bits & 1)) {
        bits >>= 1;
    }
    return bits == /* 0b11111 */ 0x1f;
}

int cards_get_max_rank(const card_t *cards, int ncards) {
    int max, i;
    const card_t *left, *right;

    max = cards[0].rank;
    for (i = 0; i < ncards - 1; i++) {
        left = &(cards[i]);
        right = &(cards[i + 1]);
        if (rank_compare(left->rank, right->rank) < 0) {
            max = right->rank;
        }
    }
    return max;
}

int cards_count_most_common_ranks(const card_t *cards, int ncards) {
    int counter[14] = { 0 }, i, max;

    for (i = 0; i < ncards; i++) {
        counter[cards[i].rank]++;
    }
    for (i = 0; i < sizeof(counter) / sizeof(counter[0]); i++) {
        if (max < counter[i]) {
            max = counter[i];
        }
    }
    return max;
}

typedef enum {
    HAND_HIGH_CARD = 0,
    HAND_ONE_PAIR,
    HAND_TWO_PAIRS,
    HAND_THREE_OF_A_KIND,
    HAND_STRAIGHT,
    HAND_FLUSH,
    HAND_FULL_HOUSE,
    HAND_FOUR_OF_A_KIND,
    HAND_STRAIGHT_FLUSH,
    HAND_ROYAL_FLUSH,
} hand_kind_t;

int hand_kind_compare(hand_kind_t lhs, hand_kind_t rhs) {
    return memcmp(&lhs, &rhs, sizeof(hand_kind_t));
}

typedef struct {
    int count;
    card_t cards[5];
} card_grouped_by_rank;

int card_grouped_by_rank_compare_by_count(const card_grouped_by_rank *lhs, const card_grouped_by_rank *rhs) {
    int result;

    result = memcmp(&(lhs->count), &(rhs->count), sizeof(int));
    if (result) {
        return result;
    }
    return rank_compare(lhs->cards[0].rank, rhs->cards[0].rank);
}

void hand_kind_sort_cards(hand_kind_t kind, card_t *cards) {
    int i, j;
    card_grouped_by_rank entries[14] = { 0 };
    card_grouped_by_rank *entry;

    switch (kind) {
        case HAND_HIGH_CARD:
        case HAND_STRAIGHT:
        case HAND_FLUSH:
        case HAND_STRAIGHT_FLUSH:
        case HAND_ROYAL_FLUSH:
            qsort(cards, 5, sizeof(cards[0]), (int (*)(const void *, const void *))card_compare);
            break;
        case HAND_ONE_PAIR:
        case HAND_TWO_PAIRS:
        case HAND_THREE_OF_A_KIND:
        case HAND_FULL_HOUSE:
        case HAND_FOUR_OF_A_KIND:
            for (i = 0; i < 5; i++) {
                entry = &(entries[cards[i].rank]);
                memcpy(&(entry->cards[entry->count]), &(cards[i]), sizeof(card_t));
                entry->count++;
            }
            qsort(entries, 14, sizeof(entries[0]), (int (*)(const void *, const void *))card_grouped_by_rank_compare_by_count);
            for (i = 0; i < 14; i++) {
                for (j = 0; j < entries[i].count; j++, cards++) {
                    memcpy(cards, &(entries[i].cards[j]), sizeof(card_t));
                }
            }
            break;
    }
}

static const char *hand_kind_names[] = {
    "HIGH_CARD",
    "ONE_PAIR",
    "TWO_PAIRS",
    "THREE_OF_A_KIND",
    "STRAIGHT",
    "FLUSH",
    "FULL_HOUSE",
    "FOUR_OF_A_KIND",
    "STRAIGHT_FLUSH",
    "ROYAL_FLUSH",
};

char *hand_kind_get_name(hand_kind_t kind, char *buffer, size_t count) {
    return strncpy(buffer, hand_kind_names[kind], count);
}

typedef struct {
    hand_kind_t kind;
    card_t cards[5];
} hand_t;

int hand_init(hand_t *hand,
              const card_t *c1,
              const card_t *c2,
              const card_t *c3,
              const card_t *c4,
              const card_t *c5) {
    card_t cards[5];
    hand_kind_t kind;

    memcpy(&(cards[0]), c1, sizeof(card_t));
    memcpy(&(cards[1]), c2, sizeof(card_t));
    memcpy(&(cards[2]), c3, sizeof(card_t));
    memcpy(&(cards[3]), c4, sizeof(card_t));
    memcpy(&(cards[4]), c5, sizeof(card_t));

    if (cards_count_suits(cards, 5) == 1) {
        if (cards_are_sequential(cards, 5)) {
            if (cards_get_max_rank(cards, 5) == 1) {
                kind = HAND_ROYAL_FLUSH;
            } else {
                kind = HAND_STRAIGHT_FLUSH;
            }
        } else {
            kind = HAND_FLUSH;
        }
    } else if (cards_are_sequential(cards, 5)) {
        kind = HAND_STRAIGHT;
    } else switch (cards_count_ranks(cards, 5)) {
        case 5:
            kind = HAND_HIGH_CARD;
            break;
        case 4:
            kind = HAND_ONE_PAIR;
            break;
        case 3:
            if (cards_count_most_common_ranks(cards, 5) == 3) {
                kind = HAND_THREE_OF_A_KIND;
            } else {
                kind = HAND_TWO_PAIRS;
            }
            break;
        case 2:
            if (cards_count_most_common_ranks(cards, 5) == 4) {
                kind = HAND_FOUR_OF_A_KIND;
            } else {
                kind = HAND_FULL_HOUSE;
            }
            break;
        default:
            return 0;
    }
    hand_kind_sort_cards(kind, cards);
    hand->kind = kind;
    memcpy(&(hand->cards), cards, sizeof(hand->cards));
    return 1;
}

int hand_compare(const hand_t *lhs, const hand_t *rhs) {
    int result, i;

    result = hand_kind_compare(lhs->kind, rhs->kind);
    for (i = 4; i >= 0 && !result; i--) {
        result = card_compare(&(lhs->cards[i]), &(rhs->cards[i]));
    }
    return result;
}

char *hand_get_string(const hand_t *hand, char *buffer, int count) {
    char kind_name[20];
    char c[5][3];

    hand_kind_get_name(hand->kind, kind_name, 19);
    card_get_symbols(&(hand->cards[0]), c[0]);
    card_get_symbols(&(hand->cards[1]), c[1]);
    card_get_symbols(&(hand->cards[2]), c[2]);
    card_get_symbols(&(hand->cards[3]), c[3]);
    card_get_symbols(&(hand->cards[4]), c[4]);
    snprintf(buffer, count, "%s[%s %s %s %s %s]", kind_name, c[0], c[1], c[2], c[3], c[4]);
    return buffer;
}

int main(int argc, const char *argv[]) {
    const char *path = "../resources/poker.txt";
    FILE *fp;
    int i, read, count;
    char symbols[3];
    card_t cards[10];
    hand_t hand1, hand2;

    fp = fopen(path, "r");
    if (!fp) {
        perror(path);
        return 1;
    }
    count = 0;
    for (i = 0; (read = fscanf(fp, "%3s", symbols)) == 1; i++) {
        if (!card_init(&(cards[i % 10]), symbols)) {
            goto fail;
        }
        if (i % 10 == 9) {
            if (!hand_init(&hand1, &(cards[0]), &(cards[1]), &(cards[2]), &(cards[3]), &(cards[4]))) {
                goto fail;
            }
            if (!hand_init(&hand2, &(cards[5]), &(cards[6]), &(cards[7]), &(cards[8]), &(cards[9]))) {
                goto fail;
            }
            if (hand_compare(&hand1, &hand2) > 0) {
                count++;
            }
        }
    }
    if (read != EOF) {
        goto fail;
    }
    fclose(fp);
    printf("%d\n", count);
    return 0;

fail:
    fclose(fp);
    return 1;
}
