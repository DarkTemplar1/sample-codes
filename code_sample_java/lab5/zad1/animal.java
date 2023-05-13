package code_sample_java.lab5.zad1;

public class animal {
    private String name;
    private String color;

    public animal(String name, String color) {
        this.name = name;
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public String getColor() {
        return color;
    }

    public String makeSound() {
        return "Generic animal sound";
    }

    public static void main(String[] args) {
        Dog myDog = new Dog("Buddy", "brown");
        System.out.println(myDog.makeSound());

        Cat myCat = new Cat("Fluffy", "grey");
        System.out.println(myCat.makeSound());
    }
}



