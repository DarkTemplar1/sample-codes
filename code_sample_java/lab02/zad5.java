package code_sample_java.lab02;

import java.util.Scanner;

public class zad5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Podaj liczbę wierszy: ");
        int rows = scanner.nextInt();
        System.out.print("Podaj liczbę kolumn: ");
        int cols = scanner.nextInt();

        System.out.println("Podaj elementy macierzy 1:");
        int[][] matrix1 = readMatrix(rows, cols, scanner);

        System.out.println("Podaj elementy macierzy 2:");
        int[][] matrix2 = readMatrix(rows, cols, scanner);

        int[][] result = addMatrices(matrix1, matrix2);
        System.out.println("Wynik dodawania:");
        printMatrix(result);
    }

    public static int[][] readMatrix(int rows, int cols, Scanner scanner) {
        int[][] matrix = new int[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                System.out.printf("Podaj element [%d][%d]: ", i, j);
                matrix[i][j] = scanner.nextInt();
            }
        }
        return matrix;
    }

    // Metoda wczytująca macierz
    public static int[][] addMatrices(int[][] matrix1, int[][] matrix2) {
        int rows1 = matrix1.length;
        int cols1 = matrix1[0].length;
        int rows2 = matrix2.length;
        int cols2 = matrix2[0].length;

        if (rows1 != rows2 || cols1 != cols2) {
            throw new IllegalArgumentException("Macierze muszą być tej samej wielkości!");
        }

        int[][] result = new int[rows1][cols1];

        for (int i = 0; i < rows1; i++) {
            for (int j = 0; j < cols1; j++) {
                result[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }

        return result;
    }
    public static void printMatrix(int[][] matrix) {
        for (int[] ints : matrix) {
            for (int anInt : ints) {
                System.out.print(anInt + " ");
            }
            System.out.println();
        }
    }
}

