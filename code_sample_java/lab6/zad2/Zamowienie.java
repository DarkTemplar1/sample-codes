package code_sample_java.lab6.zad2;

public class Zamowienie {
    private Pozycja[] pozycje;
    private int maksRozmiar;

    public Zamowienie(int maksRozmiar) {
        this.maksRozmiar = maksRozmiar;
        this.pozycje = new Pozycja[maksRozmiar];
    }

    public Zamowienie() {
        this(10);
    }

    public void dodajPozycje(Pozycja pozycja) {
        if (pozycje[pozycje.length - 1] != null) {
            System.out.println("Nie można dodać kolejnej pozycji - osiągnięto maksymalną liczbę pozycji w zamówieniu");
            return;
        }

        for (int i = 0; i < pozycje.length; i++) {
            if (pozycje[i] == null) {
                pozycje[i] = pozycja;
                break;
            }
        }
    }

    public double obliczWartosc() {
        double wartosc = 0;
        for (Pozycja pozycja : pozycje) {
            if (pozycja != null) {
                wartosc += pozycja.obliczWartosc();
            }
        }
        return wartosc;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Zamówienie:\n");
        for (Pozycja pozycja : pozycje) {
            if (pozycja != null) {
                sb.append(pozycja.toString()).append("\n");
            }
        }
        sb.append("Razem: ").append(obliczWartosc()).append(" zł");
        return sb.toString();
    }
}
