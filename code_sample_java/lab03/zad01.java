package code_sample_java.lab03;
import java.util.Scanner;

public class zad01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Podaj długość boku kwadratu:");
        double bok = scanner.nextDouble();
        Kwadrat kwadrat = new Kwadrat(bok);
        System.out.println("Pole kwadratu wynosi: " + kwadrat.obliczPole());
        System.out.println("Obwód kwadratu wynosi: " + kwadrat.obliczObwod());
    }

    static class Kwadrat {
        private double bok;
        public Kwadrat(double bok) {
            this.bok = bok;
        }

        public double obliczPole() {
            return bok * bok;
        }

        public double obliczObwod() {
            return 4 * bok;
        }
    }
}
