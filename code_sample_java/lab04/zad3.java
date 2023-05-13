package code_sample_java.lab04;
public class zad3 {
    public enum Kolor {
        KIER,
        KARO,
        TREFL,
        PIK
    }

    public enum Figura {
        DWA,
        TRZY,
        CZTERY,
        PIEC,
        SZESC,
        SIEDM,
        OSIEM,
        DZIEWIEC,
        DZIESIEC,
        WALET,
        DAMA,
        KROL,
        AS
    }

    public static class Karta {
        private final Kolor kolor;
        private final Figura figura;

        public Karta(Kolor kolor, Figura figura) {
            this.kolor = kolor;
            this.figura = figura;
        }

        @Override
        public String toString() {
            String figuraStr = switch (figura) {
                case DWA -> "2";
                case TRZY -> "3";
                case CZTERY -> "4";
                case PIEC -> "5";
                case SZESC -> "6";
                case SIEDM -> "7";
                case OSIEM -> "8";
                case DZIEWIEC -> "9";
                case DZIESIEC -> "10";
                case WALET -> "Walet";
                case DAMA -> "Dama";
                case KROL -> "Król";
                case AS -> "As";
            };
            return figuraStr + " " + kolor.toString();
        }
    }

    public static void main(String[] args) {
        Kolor[] kolory = Kolor.values();
        Figura[] figury = Figura.values();

        Karta[] talia = new Karta[kolory.length * figury.length];

        int index = 0;
        for (Kolor kolor : kolory) {
            for (Figura figura : figury) {
                talia[index] = new Karta(kolor, figura);
                index++;
            }
        }

        for (Karta karta : talia) {
            System.out.println(karta.toString());
        }
    }
}

