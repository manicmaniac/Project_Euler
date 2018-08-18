/*
 * It is possible to write five as a sum in exactly six different ways:
 *
 * 4 + 1
 * 3 + 2
 * 3 + 1 + 1
 * 2 + 2 + 1
 * 2 + 1 + 1 + 1
 * 1 + 1 + 1 + 1 + 1
 *
 * How many different ways can one hundred be written as a sum of at least two
 * positive integers?
 */

public class Problem76 {
    private static int npartitions(int n) {
        int[] cache = new int[n + 1];
        cache[0] = 1;
        for (int i = 1; i <= n; i++) {
            for (int j = i; j <= n; j++) {
                cache[j] += cache[j - i];
            }
        }
        int result = cache[n];
        return result;
    }

    public static void main(String[] args) {
        int answer = npartitions(100);
        System.out.println(answer);
    }
}
