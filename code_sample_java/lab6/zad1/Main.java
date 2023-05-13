package code_sample_java.lab6.zad1;

public class Main {
    public static void main(String[] args) {
        // tworzenie pracowników i firmy
        Pracownik pracownik1 = new Pracownik("Jan", "Kowalski", 150.0);
        Pracownik pracownik2 = new Pracownik("Anna", "Nowak", 200.0);
        Pracownik[] pracownicy = {pracownik1, pracownik2};
        Firma firma = new Firma();

        // obliczenie kosztów firmy
        double kosztMiesieczny = firma.obliczMiesiecznyKosztFirmy();
        double kosztRoczny = firma.obliczRocznyKosztFirmy();
        double koszt6Miesiecy = firma.obliczKosztFirmy(Firma.Czas.MIESIAC, 6);

        // wyświetlenie wyników
        System.out.println("Koszt miesięczny firmy: " + kosztMiesieczny);
        System.out.println("Koszt roczny firmy: " + kosztRoczny);
        System.out.println("Koszt firmy przez 6 miesięcy: " + koszt6Miesiecy);
    }
}
