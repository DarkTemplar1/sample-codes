package code_sample_java.lab5.zad2;

public class Shop {
    private String adres;
    private int rozmiar;

    public Shop(String adres, int rozmiar) {
        this.adres = adres;
        this.rozmiar = rozmiar;
    }

    public String getAdres() {
        return adres;
    }

    public int getRozmiar() {
        return rozmiar;
    }

    public String getInformacje() {
        return "Adres sklepu: " + adres + ", rozmiar: " + rozmiar;
    }
}
