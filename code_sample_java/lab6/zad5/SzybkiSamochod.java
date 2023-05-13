package code_sample_java.lab6.zad5;

public class SzybkiSamochod extends Samochod {
    public SzybkiSamochod(String kolor, String marka, int rocznik) {
        super(kolor, marka, rocznik);
    }

    @Override
    public void przyspiesz() {
        if (super.predkosc + 20 <= 200) {
            super.predkosc += 20;
        } else {
            super.predkosc = 200;
        }
    }

    @Override
    public String toString() {
        return super.toString() + " (szybki)";
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof SzybkiSamochod) {
            SzybkiSamochod other = (SzybkiSamochod) obj;
            return super.equals(other);
        }
        return false;
    }
}
