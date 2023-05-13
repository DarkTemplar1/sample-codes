package code_sample_java.lab6.zad1;
    public class Firma {
        public enum Czas {
            DZIEN, MIESIAC, ROK
        }
        private Pracownik[] pracownicy;

        public Firma() {
            this.pracownicy = pracownicy;
        }

        public double obliczMiesiecznyKosztFirmy() {
            double kosztMiesieczny = 0;
            for (Pracownik pracownik : pracownicy) {
                kosztMiesieczny += pracownik.obliczWynagrodzenie(20);
            }
            return kosztMiesieczny;
        }

        public double obliczRocznyKosztFirmy() {
            return obliczMiesiecznyKosztFirmy() * 12;
        }

        public double obliczKosztFirmy(Czas czas, int krotnosc) {
            double koszt = 0;
            int dni = 0;
            switch (czas) {
                case DZIEN:
                    dni = 1;
                    break;
                case MIESIAC:
                    dni = 20;
                    break;
                case ROK:
                    dni = 365;
                    break;
            }
            for (Pracownik pracownik : pracownicy) {
                koszt += pracownik.obliczWynagrodzenie(dni);
            }
            return koszt * krotnosc;
        }
    }

