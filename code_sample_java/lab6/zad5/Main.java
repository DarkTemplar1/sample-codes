package code_sample_java.lab6.zad5;

public class Main {
    public static void main(String[] args) {
        Samochod samochod = new Samochod("Czerwony", "BMW", 2000);
        System.out.println(samochod.toString());
        samochod.przyspiesz();
        System.out.println(samochod.toString());

        Samochod samochod2 = new Samochod("Czerwony", "BMW", 2000);
        System.out.println("Czy samochod i samochod2 są takie same? " + samochod.equals(samochod2));

        SzybkiSamochod szybkiSamochod = new SzybkiSamochod("Czarny", "Audi", 2010);
        System.out.println(szybkiSamochod.toString());
        szybkiSamochod.przyspiesz();
        System.out.println(szybkiSamochod.toString());

        System.out.println("Czy samochod i szybkiSamochod są takie same? " + samochod.equals(szybkiSamochod));
        System.out.println("Czy szybkiSamochod i samochod2 są takie same? " + szybkiSamochod.equals(samochod2));
    }
}
