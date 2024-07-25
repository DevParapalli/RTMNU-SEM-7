import java.util.*;

public class PlayfairCipher {
    private static char[][] prepareKey(String key) {
        key = key.toUpperCase().replace("J", "I");
        StringBuilder sb = new StringBuilder(key + "ABCDEFGHIKLMNOPQRSTUVWXYZ");
        String uniqueKey = sb.chars().distinct()
                             .mapToObj(ch -> String.valueOf((char)ch))
                             .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
                             .toString();
        
        char[][] matrix = new char[5][5];
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                matrix[i][j] = uniqueKey.charAt(i * 5 + j);
            }
        }
        return matrix;
    }

    private static int[] findPosition(char[][] matrix, char ch) {
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (matrix[i][j] == ch) {
                    return new int[]{i, j};
                }
            }
        }
        return null;
    }

    public static String encrypt(String plaintext, String key) {
        char[][] matrix = prepareKey(key);
        plaintext = plaintext.toUpperCase().replace("J", "I");
        if (plaintext.length() % 2 != 0) {
            plaintext += "X";
        }

        StringBuilder ciphertext = new StringBuilder();
        for (int i = 0; i < plaintext.length(); i += 2) {
            char a = plaintext.charAt(i);
            char b = plaintext.charAt(i + 1);
            int[] posA = findPosition(matrix, a);
            int[] posB = findPosition(matrix, b);

            if (posA[0] == posB[0]) { // Same row
                ciphertext.append(matrix[posA[0]][(posA[1] + 1) % 5]);
                ciphertext.append(matrix[posB[0]][(posB[1] + 1) % 5]);
            } else if (posA[1] == posB[1]) { // Same column
                ciphertext.append(matrix[(posA[0] + 1) % 5][posA[1]]);
                ciphertext.append(matrix[(posB[0] + 1) % 5][posB[1]]);
            } else { // Rectangle
                ciphertext.append(matrix[posA[0]][posB[1]]);
                ciphertext.append(matrix[posB[0]][posA[1]]);
            }
        }
        return ciphertext.toString();
    }

    public static String decrypt(String ciphertext, String key) {
        char[][] matrix = prepareKey(key);
        StringBuilder plaintext = new StringBuilder();

        for (int i = 0; i < ciphertext.length(); i += 2) {
            char a = ciphertext.charAt(i);
            char b = ciphertext.charAt(i + 1);
            int[] posA = findPosition(matrix, a);
            int[] posB = findPosition(matrix, b);

            if (posA[0] == posB[0]) { // Same row
                plaintext.append(matrix[posA[0]][(posA[1] - 1 + 5) % 5]);
                plaintext.append(matrix[posB[0]][(posB[1] - 1 + 5) % 5]);
            } else if (posA[1] == posB[1]) { // Same column
                plaintext.append(matrix[(posA[0] - 1 + 5) % 5][posA[1]]);
                plaintext.append(matrix[(posB[0] - 1 + 5) % 5][posB[1]]);
            } else { // Rectangle
                plaintext.append(matrix[posA[0]][posB[1]]);
                plaintext.append(matrix[posB[0]][posA[1]]);
            }
        }
        return plaintext.toString();
    }

    public static void main(String[] args) {
        String key = "DEVANSH";
        String plaintext = "CNSPRACTICALTWO";
        String ciphertext = encrypt(plaintext, key);
        String decrypted = decrypt(ciphertext, key);

        System.out.println("Plaintext: " + plaintext);
        System.out.println("Ciphertext: " + ciphertext);
        System.out.println("Decrypted: " + decrypted);

        System.out.println("Matrix:");
        char[][] matrix = prepareKey(key);
        for (char[] row : matrix) {
            System.out.println(Arrays.toString(row));
        }
    }
}