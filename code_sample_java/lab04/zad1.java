package code_sample_java.lab04;
public class zad1 {
    public static void main(String[] args) {
        Ulamek u1 = new Ulamek(3, 4);
        Ulamek u2 = new Ulamek(1, 2);

        System.out.println(u1 + " + " + u2 + " = " + u1.dodaj(u2));
        System.out.println(u1 + " - " + u2 + " = " + u1.odejmij(u2));
        System.out.println(u1 + " * " + u2 + " = " + u1.pomnoz(u2));
        System.out.println(u1 + " / " + u2 + " = " + u1.podziel(u2));
    }
}

class Ulamek {
    private int licznik;
    private int mianownik;

    public Ulamek(int licznik, int mianownik) {
        if (mianownik == 0) {
            throw new IllegalArgumentException("Mianownik nie może być równy zero");
        }
        this.licznik = licznik;
        this.mianownik = mianownik;
        skroc();
    }

    public int getLicznik() {
        return licznik;
    }

    public int getMianownik() {
        return mianownik;
    }

    public void setLicznik(int licznik) {
        this.licznik = licznik;
        skroc();
    }

    public void setMianownik(int mianownik) {
        if (mianownik == 0) {
            throw new IllegalArgumentException("Mianownik nie może być równy zero");
        }
        this.mianownik = mianownik;
        skroc();
    }

    public void skroc() {
        int gcd = gcd(licznik, mianownik);
        licznik /= gcd;
        mianownik /= gcd;
    }

    private int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    public Ulamek dodaj(Ulamek u) {
        int nowyLicznik = licznik * u.getMianownik() + u.getLicznik() * mianownik;
        int nowyMianownik = mianownik * u.getMianownik();
        return new Ulamek(nowyLicznik, nowyMianownik);
    }

    public Ulamek odejmij(Ulamek u) {
        int nowyLicznik = licznik * u.getMianownik() - u.getLicznik() * mianownik;
        int nowyMianownik = mianownik * u.getMianownik();
        return new Ulamek(nowyLicznik, nowyMianownik);
    }

    public Ulamek pomnoz(Ulamek u) {
        int nowyLicznik = licznik * u.getLicznik();
        int nowyMianownik = mianownik * u.getMianownik();
        return new Ulamek(nowyLicznik, nowyMianownik);
    }

    public Ulamek podziel(Ulamek u) {
        if (u.getLicznik() == 0) {
            throw new IllegalArgumentException("Nie można dzielić przez zero");
        }
        int nowyLicznik = licznik * u.getMianownik();
        return u;
    }
}