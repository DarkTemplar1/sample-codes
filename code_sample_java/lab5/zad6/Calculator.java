package code_sample_java.lab5.zad6;

public class Calculator {
    public double calculate(double base) {
        return Math.pow(base, 2);
    }

    public double calculate(double num1, double num2) {
        return num1 * num2;
    }

    public double calculate(double num1, double num2, double num3) {
        return num1 + num2 + num3;
    }

    public static void main(String[] args) {
        Calculator calc = new Calculator();

        double result1 = calc.calculate(2);
        System.out.println("2 ^ 2 = " + result1);

        double result2 = calc.calculate(2.5, 4.5);
        System.out.println("2.5 * 4.5 = " + result2);

        double result3 = calc.calculate(1, 2, 3);
        System.out.println("1 + 2 + 3 = " + result3);
    }
}

