package code_sample_java.lab5.zad1;

class Dog extends animal {
    public Dog(String name, String color) {
        super(name, color);
    }

    @Override
    public String makeSound() {
        return "Woof! My name is " + getName() + " and I am " + getColor() + ".";
    }
}
