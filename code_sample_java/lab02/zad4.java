package code_sample_java.lab02;

public class zad4 {
    public static void printMatrix(int[][] matrix) {
        for (int[] row : matrix) {
            for (int elem : row) {
                System.out.print(elem + " ");
            }
            System.out.println();
        }
    }
    public static void main(String[] args) {
        int[][] Matrix = {{1, 2}, {3, 4}};
        printMatrix(Matrix);
    }
}
