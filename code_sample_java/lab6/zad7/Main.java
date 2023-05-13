package code_sample_java.lab6.zad7;

public class Main {
    public static void main(String[] args) {
        int[] tab1 = {1, 2, 3};
        int[] tab2 = {4, 5, 6};
        int[] tab3 = {7, 8, 9};
        int suma = sumujTablice(tab1, tab2, tab3);
        System.out.println("Suma: " + suma);
    }

    public static int sumujTablice(int[]... tablice) {
        int suma = 0;
        for (int[] tablica : tablice) {
            for (int liczba : tablica) {
                suma += liczba;
            }
        }
        return suma;
    }
}
