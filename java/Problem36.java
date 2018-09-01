public class Problem36 {
    private static class Palindromes {
        private Palindromes() {
        }

        public static boolean isPalindrome(String s) {
            StringBuilder builder = new StringBuilder(s);
            builder.reverse();
            return builder.toString().equals(s);
        }
    }

    public static void main(String[] args) {
        int sum = 0;
        for (int i = 0; i < 1000000; i++) {
            String decimal = Integer.toString(i);
            if (Palindromes.isPalindrome(decimal)) {
                String binary = Integer.toBinaryString(i);
                if (Palindromes.isPalindrome(binary)) {
                    sum += i;
                }
            }
        }
        System.out.println(sum);
    }
}
