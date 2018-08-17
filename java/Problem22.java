/*
 * Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
 *
 * For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
 *
 * What is the total of all the name scores in the file?
 */

import java.io.IOException;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Problem22 {
    private static class Name {
        private String value;

        public Name(String value) {
            this.value = value;
        }

        public int getScore(int index) {
            char[] chars = value.toCharArray();
            int sum = 0;
            for (char c : chars) {
                sum += c - 64;
            }
            return sum * (index + 1);
        }
    }

    public static void main(String[] args) throws IOException {
        File file = new File("../resources/names.txt");
        List<String> names = new ArrayList<>();
        try (Scanner scanner = new Scanner(file)) {
            scanner.useDelimiter(",");
            Pattern pattern = Pattern.compile("\"([A-Z]*)\"");
            while (scanner.next(pattern) != null) {
                names.add(scanner.match().group(1));
            }
        } catch (NoSuchElementException e) {
            // ignore
        }
        names.sort(String::compareTo);
        long answer = 0;
        int index = 0;
        for (String name : names) {
            answer += new Name(name).getScore(index);
            index++;
        }
        System.out.println(answer);
    }
}
