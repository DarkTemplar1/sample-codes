package code_sample_java.lab6.zad5;

public class Samochod {
    int predkosc;
    private String kolor;
    private String marka;
    private int rocznik;

    public Samochod(String kolor, String marka, int rocznik) {
        this.predkosc = 0;
        this.kolor = kolor;
        this.marka = marka;
        this.rocznik = rocznik;
    }

    public void przyspiesz() {
        if (predkosc + 20 <= 140) {
            predkosc += 20;
        } else {
            predkosc = 140;
        }
    }

    @Override
    public String toString() {
        return kolor + " " + marka + " rocznik " + rocznik;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Samochod) {
            Samochod other = (Samochod) obj;
            return this.kolor.equals(other.kolor)
                    && this.marka.equals(other.marka)
                    && this.rocznik == other.rocznik;
        }
        return false;
    }
}

