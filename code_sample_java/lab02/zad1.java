package code_sample_java.lab02;
import java.util.Scanner;
public class zad1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Podaj rozmiar tablicy: ");
        int rozmiar = scanner.nextInt();
        char[] tablica = new char[rozmiar];
        System.out.println("Wpisz " + rozmiar + " znaków:");
        for (int i = 0; i < rozmiar; i++) {
            tablica[i] = scanner.next().charAt(0);
        }
        System.out.println("Utworzona tablica to:");
        for (int i = 0; i < rozmiar; i++) {
            System.out.print(tablica[i] + " ");
        }
    }
}
