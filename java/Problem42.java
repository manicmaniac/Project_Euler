/*
 * The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
 * so the first ten triangle numbers are:
 *
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 *
 * By converting each letter in a word to a number corresponding to its
 * alphabetical position and adding these values we form a word value. For
 * example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
 * is a triangle number then we shall call the word a triangle word.
 *
 * Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
 * containing nearly two-thousand common English words, how many are triangle
 * words?
 */

import java.io.File;
import java.io.IOException;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Problem42 {
    private static boolean isTriangle(int x) {
        double result = (Math.sqrt(8 * x + 1) - 1) / 2;
        return result == Math.floor(result);
    }

    private static int wordScore(String word) {
        int result = 0;
        for (char c : word.toCharArray()) {
            result += c - 64;
        }
        return result;
    }

    public static void main(String[] args) throws IOException {
        File file = new File("../resources/words.txt");
        Pattern pattern = Pattern.compile("\"([A-Z]*)\"");
        int answer = 0;
        try (Scanner scanner = new Scanner(file)) {
            scanner.useDelimiter(",");
            while (scanner.next(pattern) != null) {
                String word = scanner.match().group(1);
                if (isTriangle(wordScore(word))) {
                    answer++;
                }
            }
        } catch (NoSuchElementException e) {
            // ignore
        }
        System.out.println(answer);
    }
}
