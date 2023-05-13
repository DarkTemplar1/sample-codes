package code_sample_java.lab6.zad1;

public class Pracownik {
    private String imie;
    private String nazwisko;
    private double dzienneWynagrodzenie;

    public Pracownik(String imie, String nazwisko, double dzienneWynagrodzenie) {
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.dzienneWynagrodzenie = dzienneWynagrodzenie;
    }

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public double getDzienneWynagrodzenie() {
        return dzienneWynagrodzenie;
    }

    public void setDzienneWynagrodzenie(double dzienneWynagrodzenie) {
        this.dzienneWynagrodzenie = dzienneWynagrodzenie;
    }

    public double obliczWynagrodzenie(int liczbaDni) {
        return dzienneWynagrodzenie * liczbaDni;
    }
}
