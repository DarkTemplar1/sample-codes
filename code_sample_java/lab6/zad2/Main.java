package code_sample_java.lab6.zad2;

public class Main {
    public static void main(String[] args) {
        Pozycja pozycja1 = new Pozycja("Chleb", 2, 2.00);
        Pozycja pozycja2 = new Pozycja("Banany", 1, 6.00);

        Zamowienie zamowienie = new Zamowienie();
        zamowienie.dodajPozycje(pozycja1);
        zamowienie.dodajPozycje(pozycja2);

        System.out.println(zamowienie.toString());
    }
}