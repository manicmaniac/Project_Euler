/*
 * By starting at the top of the triangle below and moving to adjacent numbers on
 * the row below, the maximum total from top to bottom is 23.
 *
 * 3
 * 7 4
 * 2 4 6
 * 8 5 9 3
 *
 * That is, 3 + 7 + 4 + 9 = 23.
 *
 * Find the maximum total from top to bottom of the triangle below:
 *
 * 75
 * 95 64
 * 17 47 82
 * 18 35 87 10
 * 20 04 82 47 65
 * 19 01 23 75 03 34
 * 88 02 77 73 07 63 67
 * 99 65 04 28 06 16 70 92
 * 41 41 26 56 83 40 80 70 33
 * 41 48 72 33 47 32 37 16 94 29
 * 53 71 44 65 25 43 91 52 97 51 14
 * 70 11 33 28 77 73 17 78 39 68 17 57
 * 91 71 52 38 17 14 91 43 58 50 27 29 48
 * 63 66 04 68 89 53 67 30 73 16 69 87 40 31
 * 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
 *
 * NOTE: As there are only 16384 routes, it is possible to solve this problem by
 * trying every route. However, Problem 67, is the same challenge with a triangle
 * containing one-hundred rows; it cannot be solved by brute force, and requires a
 * clever method! ;o)
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Problem18 {
    private static class Node {
        private final int value;
        private Node left;
        private Node right;

        public Node(int value) {
            this.value = value;
        }

        public boolean hasLeft() {
            return left != null;
        }

        public Node getLeft() {
            return left;
        }

        public void setLeft(Node left) {
            this.left = left;
        }

        public boolean hasRight() {
            return right != null;
        }

        public Node getRight() {
            return right;
        }

        public void setRight(Node right) {
            this.right = right;
        }

        public int sum() {
            if (left == null && right == null) {
                return value;
            }
            return value + Integer.max(left.sum(), right.sum());
        }

        @Override
        public String toString() {
            StringBuilder builder = new StringBuilder();
            builder.append(value);
            if (hasLeft()) {
                builder.append(" (");
                builder.append(left);
                if (hasRight()) {
                    builder.append(", ");
                    builder.append(right);
                }
                builder.append(")");
            }
            return builder.toString();
        }
    }

    private static class Triangulars {
        private Triangulars() {
        }

        public static boolean isTriangular(int n) {
            return ((Math.sqrt(8 * n + 1) - 1) / 2) % 1 == 0;
        }
    }

    private static final String DATA = "" +
            "75\n" +
            "95 64\n" +
            "17 47 82\n" +
            "18 35 87 10\n" +
            "20 04 82 47 65\n" +
            "19 01 23 75 03 34\n" +
            "88 02 77 73 07 63 67\n" +
            "99 65 04 28 06 16 70 92\n" +
            "41 41 26 56 83 40 80 70 33\n" +
            "41 48 72 33 47 32 37 16 94 29\n" +
            "53 71 44 65 25 43 91 52 97 51 14\n" +
            "70 11 33 28 77 73 17 78 39 68 17 57\n" +
            "91 71 52 38 17 14 91 43 58 50 27 29 48\n" +
            "63 66 04 68 89 53 67 30 73 16 69 87 40 31\n" +
            "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23\n";

    public static void main(String[] args) {
        List<Node> nodes = new ArrayList<>();
        int currentNodeIndex = 0;
        try (Scanner scanner = new Scanner(DATA)) {
            for (int i = 0; scanner.hasNextInt(); i++) {
                int value = scanner.nextInt();
                Node node = new Node(value);
                nodes.add(node);
                Node currentNode = nodes.get(currentNodeIndex);
                if (currentNode == node) {
                    continue;
                }
                if (!currentNode.hasLeft()) {
                    currentNode.setLeft(node);
                    continue;
                }
                if (!currentNode.hasRight()) {
                    currentNode.setRight(node);
                    currentNodeIndex++;
                    if (Triangulars.isTriangular(i) || Triangulars.isTriangular(i + 1)) {
                        continue;
                    }
                    Node nextNode = nodes.get(currentNodeIndex);
                    nextNode.setLeft(node);
                }
            }
        }
        int answer = nodes.get(0).sum();
        System.out.println(answer);
    }
}
