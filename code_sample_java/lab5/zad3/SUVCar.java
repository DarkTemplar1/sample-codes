package code_sample_java.lab5.zad3;

public class SUVCar extends Car {
    private boolean offRoadCapable;

    public SUVCar(String brand, String color, boolean offRoadCapable) {
        super(brand, color);
        this.offRoadCapable = offRoadCapable;
    }

    public boolean isOffRoadCapable() {
        return offRoadCapable;
    }
}