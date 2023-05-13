package code_sample_java.lab5.zad3;

public class SportsCar extends Car {
    private int maxSpeed;

    public SportsCar(String brand, String color, int maxSpeed) {
        super(brand, color);
        this.maxSpeed = maxSpeed;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }
}

