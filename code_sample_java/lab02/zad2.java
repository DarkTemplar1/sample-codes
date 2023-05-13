package code_sample_java.lab02;
import java.util.Arrays;
import java.util.Scanner;
public class zad2 {

    public static class Tablica {
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Podaj rozmiar tablicy: ");
            int rozmiar = scanner.nextInt();
            System.out.print("Podaj pierwszy element: ");
            int pierwszy = scanner.nextInt();
            int[] tablica = new int[rozmiar];
            tablica[0] = pierwszy;
            for (int i = 1; i < rozmiar; i++) {
                tablica[i] = pierwszy + 2 * i;
            }
            System.out.println("Utworzona tablica to:");
            System.out.println(Arrays.toString(tablica));
            System.out.println("Min: " + znajdzMin(tablica));
            System.out.println("Max: " + znajdzMax(tablica));
            System.out.println("Suma: " + obliczSume(tablica));
            System.out.println("Srednia: " + obliczSrednia(tablica));
            System.out.println("Mediana: " + znajdzMediane(tablica));
        }

        public static int znajdzMin(int[] tablica) {
            int min = tablica[0];
            for (int i = 1; i < tablica.length; i++) {
                if (tablica[i] < min) {
                    min = tablica[i];
                }
            }
            return min;
        }

        public static int znajdzMax(int[] tablica) {
            int max = tablica[0];
            for (int i = 1; i < tablica.length; i++) {
                if (tablica[i] > max) {
                    max = tablica[i];
                }
            }
            return max;
        }

        public static int obliczSume(int[] tablica) {
            int suma = 0;
            for (int j : tablica) {
                suma += j;
            }
            return suma;
        }

        public static double obliczSrednia(int[] tablica) {
            double suma = 0;
            for (int j : tablica) {
                suma += j;
            }
            return suma / tablica.length;
        }

        public static double znajdzMediane(int[] tablica) {
            Arrays.sort(tablica);
            int srodek = tablica.length / 2;
            if (tablica.length % 2 == 0) {
                return (tablica[srodek - 1] + tablica[srodek]) / 2.0;
            } else {
                return tablica[srodek];
            }
        }
    }

}
