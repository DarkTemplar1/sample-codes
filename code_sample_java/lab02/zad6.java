package code_sample_java.lab02;
import java.util.Scanner;

public class zad6 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Podaj pierwszą liczbę: ");
        int a = scanner.nextInt();
        System.out.print("Podaj drugą liczbę: ");
        int b = scanner.nextInt();

        int nwd = nwd(a, b);
        System.out.printf("Największy wspólny dzielnik dla %d i %d to %d", a, b, nwd);
    }

    public static int nwd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}

