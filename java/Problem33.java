/*
 * The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
 * in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
 * which is correct, is obtained by cancelling the 9s.
 *
 * We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.
 *
 * There are exactly four non-trivial examples of this type of fraction, less than
 * one in value, and containing two digits in the numerator and denominator.
 *
 * If the product of these four fractions is given in its lowest common terms,
 * find the value of the denominator.
 */
public class Problem33 {
    public static void main(String[] args) {
        double dProduct = 1;
        double nProduct = 1;
        for (int i = 1; i <= 9; i++) {
            for (int j = 1; j <= 9; j++) {
                for (int k = 1; k <= 9; k++) {
                    int d = i * 10 + j;
                    int n = j * 10 + k;
                    if ((d / (double) n) == (i / (double) k)) {
                        dProduct *= d;
                        nProduct *= n;
                    }
                }
            }
        }
        int answer = (int) (nProduct / dProduct);
        System.out.println(answer);
    }
}
