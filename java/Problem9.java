/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 *
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */
import java.util.stream.IntStream;

public class Problem9 {
    private static class PythagorianTriplet {
        private final int a;
        private final int b;
        private final int c;

        public PythagorianTriplet(int a, int b, int c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }

        public PythagorianTriplet(int m, int n) {
            this(m * m - n * n, 2 * m * n, m * m + n * n);
        }

        public int sum() {
            return a + b + c;
        }

        public int product() {
            return a * b * c;
        }
    }

    public static void main(String[] args) {
        int answer = IntStream.iterate(1, x -> x + 1)
                .flatMap(x -> IntStream.range(1, x)
                            .mapToObj(y -> new PythagorianTriplet(x, y))
                            .filter(p -> p.sum() == 1000)
                            .mapToInt(PythagorianTriplet::product))
                .findAny()
                .getAsInt();
        System.out.println(answer);
    }
}
