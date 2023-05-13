package code_sample_java.lab04;
import java.util.Random;
public class zad5 {
    public static class Zawodnik {
        private final String imie;
        private final int predkoscMin;
        private final int predkoscMax;
        private double dystans;

        public Zawodnik(String imie, int predkoscMin, int predkoscMax) {
            this.imie = imie;
            this.predkoscMin = predkoscMin;
            this.predkoscMax = predkoscMax;
            this.dystans = 0.0;
        }
        public void biegnij() {
            Random random = new Random();
            int predkosc = random.nextInt(predkoscMax - predkoscMin + 1) + predkoscMin;
            dystans += predkosc / 10.0;
            System.out.println(imie + " przebiegł(a) " + dystans + "km");
        }

        public double getDystans() {
            return dystans;
        }

        public String getImie() {
            return imie;
        }
    }

    public static class Wyscig {
        public void main(String[] args) {
            Zawodnik zawodnika = new Zawodnik("Robert", 2, 12);

            Zawodnik zawodnikb = new Zawodnik("Adam", 3, 10);

            Zawodnik zawodnikc = new Zawodnik("Kasia", 4, 14);

            boolean wygrana = false;
            Zawodnik zwyciezca = null;
            while (!wygrana) {
                zawodnika.biegnij();
                zawodnikb.biegnij();
                zawodnikc.biegnij();

                if (zawodnika.getDystans() >= 50.0) {
                    wygrana = true;
                    zwyciezca = zawodnika;
                } else if (zawodnikb.getDystans() >= 50.0) {
                    wygrana = true;
                    zwyciezca = zawodnikb;
                } else if (zawodnikc.getDystans() >= 50.0) {
                    wygrana = true;
                    zwyciezca = zawodnikc;
                }
            }

            System.out.println("Zwycięzcą jest " + zwyciezca.getImie() + "!");
        }
    }
}
