package code_sample_java.lab03;
import java.util.Scanner;
public class zad02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Podaj koordynaty pierwszego punktu:");
        double x1 = scanner.nextDouble();
        double y1 = scanner.nextDouble();
        Punkt punkt1 = new Punkt(x1, y1);
        System.out.println("Podaj koordynaty drugiego punktu:");
        double x2 = scanner.nextDouble();
        double y2 = scanner.nextDouble();
        Punkt punkt2 = new Punkt(x2, y2);

        System.out.println("Odległość między punktem 1 a punktem 2 wynosi: " + punkt1.obliczOdleglosc(punkt2));
    }

    static class Punkt {
        private double x;
        private double y;

        public Punkt(double x, double y) {
            this.x = x;
            this.y = y;
        }

        public double obliczOdleglosc(Punkt punkt) {
            return Math.sqrt(Math.pow(punkt.getX() - x, 2) + Math.pow(punkt.getY() - y, 2));
        }

        public double getX() {
            return x;
        }

        public double getY() {
            return y;
        }
    }
}
