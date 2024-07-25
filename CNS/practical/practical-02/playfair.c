#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define SIZE 5

void prepare_key(char *key, char matrix[SIZE][SIZE]) {
    char alphabet[26] = "ABCDEFGHIKLMNOPQRSTUVWXYZ";
    int i, j, k, flag = 0;
    
    for (i = 0; i < strlen(key); i++) {
        if (key[i] == 'J') key[i] = 'I';
        if (!flag) {
            for (j = 0; j < i; j++) {
                if (key[i] == key[j]) {
                    flag = 1;
                    break;
                }
            }
            if (!flag) {
                for (k = 0; k < 25; k++) {
                    if (key[i] == alphabet[k]) {
                        alphabet[k] = ' ';
                        break;
                    }
                }
            }
        }
        flag = 0;
    }

    k = 0;
    for (i = 0; i < SIZE; i++) {
        for (j = 0; j < SIZE; j++) {
            if (k < strlen(key) && key[k] != ' ')
                matrix[i][j] = key[k++];
            else {
                while (alphabet[k - strlen(key)] == ' ')
                    k++;
                matrix[i][j] = alphabet[k - strlen(key)];
                k++;
            }
        }
    }
}

void find_position(char matrix[SIZE][SIZE], char ch, int *row, int *col) {
    int i, j;
    for (i = 0; i < SIZE; i++) {
        for (j = 0; j < SIZE; j++) {
            if (matrix[i][j] == ch) {
                *row = i;
                *col = j;
                return;
            }
        }
    }
}

void playfair_encrypt(char *plaintext, char matrix[SIZE][SIZE], char *ciphertext) {
    int i, r1, c1, r2, c2;
    for (i = 0; i < strlen(plaintext); i += 2) {
        find_position(matrix, plaintext[i], &r1, &c1);
        find_position(matrix, plaintext[i+1], &r2, &c2);

        if (r1 == r2) {
            ciphertext[i] = matrix[r1][(c1+1)%SIZE];
            ciphertext[i+1] = matrix[r2][(c2+1)%SIZE];
        }
        else if (c1 == c2) {
            ciphertext[i] = matrix[(r1+1)%SIZE][c1];
            ciphertext[i+1] = matrix[(r2+1)%SIZE][c2];
        }
        else {
            ciphertext[i] = matrix[r1][c2];
            ciphertext[i+1] = matrix[r2][c1];
        }
    }
    ciphertext[strlen(plaintext)] = '\0';
}

void playfair_decrypt(char *ciphertext, char matrix[SIZE][SIZE], char *plaintext) {
    int i, r1, c1, r2, c2;
    for (i = 0; i < strlen(ciphertext); i += 2) {
        find_position(matrix, ciphertext[i], &r1, &c1);
        find_position(matrix, ciphertext[i+1], &r2, &c2);

        if (r1 == r2) {
            plaintext[i] = matrix[r1][(c1-1+SIZE)%SIZE];
            plaintext[i+1] = matrix[r2][(c2-1+SIZE)%SIZE];
        }
        else if (c1 == c2) {
            plaintext[i] = matrix[(r1-1+SIZE)%SIZE][c1];
            plaintext[i+1] = matrix[(r2-1+SIZE)%SIZE][c2];
        }
        else {
            plaintext[i] = matrix[r1][c2];
            plaintext[i+1] = matrix[r2][c1];
        }
    }
    plaintext[strlen(ciphertext)] = '\0';
}

void display_matrix(char matrix[SIZE][SIZE]) {
    printf("Playfair Cipher Matrix:\n");
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%c ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int main() {
    char key[] = "DEVANSH";
    char matrix[SIZE][SIZE];
    char plaintext[] = "CNSPRACTICALTWO";
    char ciphertext[100], decrypted[100];

    prepare_key(key, matrix);

    playfair_encrypt(plaintext, matrix, ciphertext);
    playfair_decrypt(ciphertext, matrix, decrypted);

    printf("Key: %s\n", key);
    display_matrix(matrix);
    printf("Plaintext: %s\n", plaintext);
    printf("Ciphertext: %s\n", ciphertext);
    printf("Decrypted: %s\n", decrypted);

    return 0;
}