/*
 * Starting in the top left corner of a 2×2 grid, and only being able to move to
 * the right and down, there are exactly 6 routes to the bottom right corner.
 *
 * [p015]
 *
 * How many such routes are there through a 20×20 grid?
 */

public class Problem15 {
    private static double c(int n, int r) {
        double res = 1;
        int i;
        for (i = r + 1; i < n + 1; i++) {
            res *= i;
        }
        for (i = 1; i < r + 1; i++) {
            res /= i;
        }
        return res;
    }

    public static void main(String[] args) {
        System.out.printf("%.0f\n", c(40, 20));
    }
}
