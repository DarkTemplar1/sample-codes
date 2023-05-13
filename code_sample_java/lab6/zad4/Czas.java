package code_sample_java.lab6.zad4;

public class Czas {
    private int godziny;
    private int minuty;

    public Czas(int godziny, int minuty) {
        this.godziny = godziny;
        this.minuty = minuty;
    }

    @Override
    public String toString() {
        return godziny + "h " + minuty + "min";
    }

    public Czas dodaj(Czas t) {
        int sumaMinut = (this.godziny * 60 + this.minuty) + (t.godziny * 60 + t.minuty);
        int noweGodziny = sumaMinut / 60;
        int noweMinuty = sumaMinut % 60;
        return new Czas(noweGodziny, noweMinuty);
    }

    public Czas odejmij(Czas t) {
        int roznicaMinut = (this.godziny * 60 + this.minuty) - (t.godziny * 60 + t.minuty);
        if (roznicaMinut < 0) {
            throw new IllegalArgumentException("Nie można odjąć większego czasu od mniejszego!");
        }
        int noweGodziny = roznicaMinut / 60;
        int noweMinuty = roznicaMinut % 60;
        return new Czas(noweGodziny, noweMinuty);
    }

    public Czas pomnóż(int krotnosc) {
        int noweMinuty = (this.godziny * 60 + this.minuty) * krotnosc;
        int noweGodziny = noweMinuty / 60;
        noweMinuty = noweMinuty % 60;
        return new Czas(noweGodziny, noweMinuty);
    }
}
