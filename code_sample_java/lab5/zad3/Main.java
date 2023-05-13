package code_sample_java.lab5.zad3;
public class Main {
    public static void main(String[] args) {
        Car[] cars = new Car[4];
        cars[0] = new Car("Toyota", "red");
        cars[1] = new ElectricCar("Tesla", "blue", 100);
        cars[2] = new SportsCar("Ferrari", "yellow", 300);
        cars[3] = new SUVCar("Jeep", "green", true);

        for (Car car : cars) {
            System.out.println("Brand: " + car.getBrand() + ", Color: " + car.getColor());
            if (car instanceof ElectricCar) {
                System.out.println("Battery Capacity: " + ((ElectricCar) car).getBatteryCapacity());
            } else if (car instanceof SportsCar) {
                System.out.println("Max Speed: " + ((SportsCar) car).getMaxSpeed());
            } else if (car instanceof SUVCar) {
                System.out.println("Off-Road Capable: " + ((SUVCar) car).isOffRoadCapable());
            }
            System.out.println();
        }
    }
}

