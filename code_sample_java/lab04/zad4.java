package code_sample_java.lab04;
import java.util.Scanner;
import java.util.Random;
public class zad4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of coin flips: ");
        int numFlips = scanner.nextInt();

        Random random = new Random();
        int heads = 0;
        int tails = 0;

        for (int i = 0; i < numFlips; i++) {
            int coin = random.nextInt(2);
            if (coin == 0) {
                heads++;
            } else {
                tails++;
            }
        }

        System.out.println("Heads: " + heads + " (" + (heads * 100.0 / numFlips) + "%)");
        System.out.println("Tails: " + tails + " (" + (tails * 100.0 / numFlips) + "%)");
    }
}
