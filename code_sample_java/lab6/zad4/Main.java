package code_sample_java.lab6.zad4;

public class Main {
    public static void main(String[] args) {
        Czas czas1 = new Czas(2, 45);
        Czas czas2 = new Czas(1, 30);

        System.out.println("Czas 1: " + czas1);
        System.out.println("Czas 2: " + czas2);

        Czas sumaCzasow = czas1.dodaj(czas2);
        System.out.println("Suma czasów: " + sumaCzasow);

        Czas roznicaCzasow = czas1.odejmij(czas2);
        System.out.println("Różnica czasów: " + roznicaCzasow);

        Czas pomnozonyCzas = czas1.pomnóż(3);
        System.out.println("Czas pomnożony przez 3: " + pomnozonyCzas);
    }
}
