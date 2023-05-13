package code_sample_java.lab5.zad1;

class Cat extends animal {
    public Cat(String name, String color) {
        super(name, color);
    }

    @Override
    public String makeSound() {
        return "Meow! My name is " + getName() + " and I am " + getColor() + ".";
    }
}


