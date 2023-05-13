package code_sample_java.lab5.zad2;

public class Main {
    public static void main(String[] args) {
        Shop sklep = new Shop("ul. Główna 1", 100);
        System.out.println(sklep.getInformacje());

        Bookshop ksiegarnia = new Bookshop("ul. Książkowa 10", 50);
        System.out.println(ksiegarnia.getInformacje());

        Bakery piekarnia = new Bakery("ul. Chlebowa 5", 30);
        System.out.println(piekarnia.getInformacje());
    }
}
