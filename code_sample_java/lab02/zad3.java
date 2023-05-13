package code_sample_java.lab02;
import java.util.Arrays;
import java.util.Scanner;
public class zad3 {
    public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);

            System.out.print("Podaj długość pierwszego ciągu: ");
            int length1 = scanner.nextInt();
            int[] arr1 = new int[length1];
            System.out.println("Podaj elementy pierwszego ciągu:");
            for (int i = 0; i < length1; i++) {
                arr1[i] = scanner.nextInt();
            }

            System.out.print("Podaj długość drugiego ciągu: ");
            int length2 = scanner.nextInt();
            int[] arr2 = new int[length2];
            System.out.println("Podaj elementy drugiego ciągu:");
            for (int i = 0; i < length2; i++) {
                arr2[i] = scanner.nextInt();
            }

            int[] sum = sumArrays(arr1, arr2);
            System.out.println(Arrays.toString(sum));
        }

        public static int[] sumArrays(int[] arr1, int[] arr2) {
            if (arr1.length != arr2.length) {
                return new int[0];
            }

            int[] result = new int[arr1.length];
            for (int i = 0; i < arr1.length; i++) {
                result[i] = arr1[i] + arr2[i];
            }

            return result;
        }
}

