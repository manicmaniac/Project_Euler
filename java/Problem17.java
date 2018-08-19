/*
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 *
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 *
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 */
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Problem17 {
    private static class EnglishNumber {
        private static final String[] NAME_0_19 = new String[]{
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
                "eighteen", "nineteen"
        };

        private static final String[] NAME_20_90 = new String[]{
            null, null, "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
                "ninety"
        };

        private final int value;

        public EnglishNumber(int value) {
            if (value < 0 || value > 1000) {
                throw new IllegalArgumentException("Invalid value: " + value);
            }
            this.value = value;
        }

        @Override
        public String toString() {
            int x = value;
            if (x == 0) {
                return "zero";
            }
            if (x == 1000) {
                return "onethousand";
            }
            StringBuilder builder = new StringBuilder();
            while (x > 0) {
                if (x < 20) {
                    builder.append(NAME_0_19[x]);
                    break;
                }
                if (100 <= x && x < 1000) {
                    builder.append(NAME_0_19[x / 100] + "handred");
                    x %= 100;
                    if (x > 0) {
                        builder.append("and");
                    }
                }
                if (20 <= x && x < 100) {
                    builder.append(NAME_20_90[x / 10]);
                    x %= 10;
                }
            }
            return builder.toString();
        }
    }

    public static void main(String[] args) {
        int answer = IntStream.rangeClosed(1, 1000)
                .mapToObj(x -> new EnglishNumber(x).toString())
                .collect(Collectors.joining())
                .length();
        System.out.println(answer);
    }
}
