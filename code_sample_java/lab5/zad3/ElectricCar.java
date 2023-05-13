package code_sample_java.lab5.zad3;

public class ElectricCar extends Car {
    private int batteryCapacity;

    public ElectricCar(String brand, String color, int batteryCapacity) {
        super(brand, color);
        this.batteryCapacity = batteryCapacity;
    }

    public int getBatteryCapacity() {
        return batteryCapacity;
    }
}