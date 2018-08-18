/*
 * Comparing two numbers written in index form like 2^11 and 3^7 is not difficult,
 * as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
 *
 * However, confirming that 632382^518061 > 519432^525806 would be much more
 * difficult, as both numbers contain over three million digits.
 *
 * Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
 * containing one thousand lines with a base/exponent pair on each line, determine
 * which line number has the greatest numerical value.
 *
 * NOTE: The first two lines in the file represent the numbers in the example
 * given above.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import static java.util.Comparator.comparing;

public class Problem99 {
    public static void main(String[] args) throws IOException {
        Map<Integer, Double> resultsByLineNo = new HashMap<>();
        File file = new File("../resources/base_exp.txt");
        try (FileReader fileReader = new FileReader(file);
                BufferedReader bufferedReader = new BufferedReader(fileReader)) {
            String line;
            for (int lineNo = 1; (line = bufferedReader.readLine()) != null; lineNo++) {
                String[] splitted = line.split(",", 2);
                int base = Integer.parseInt(splitted[0]);
                int exp = Integer.parseInt(splitted[1]);
                resultsByLineNo.put(lineNo, Math.log(base) * exp);
            }
        }
        int answer = Collections.max(resultsByLineNo.entrySet(), comparing(Map.Entry::getValue)).getKey();
        System.out.println(answer);
    }
}
