/*
The sum of the squares of the first ten natural numbers is,

1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
*/

import java.util.stream.IntStream;

public class Problem6 {
    private static int square(int x) {
        return x * x;
    }

    public static void main(String args[]) {
        int squareAndSum = IntStream.rangeClosed(1, 100).map(Problem6::square).sum();
        int sumAndSquare = square(IntStream.rangeClosed(1, 100).sum());
        int answer = sumAndSquare - squareAndSum;
        System.out.println(answer);
    }
}
