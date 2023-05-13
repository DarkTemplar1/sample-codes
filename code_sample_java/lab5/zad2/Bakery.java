package code_sample_java.lab5.zad2;

class Bakery extends Shop {
    private String[] produkty;

    public Bakery(String adres, int rozmiar) {
        super(adres, rozmiar);
        this.produkty = new String[]{"chleb", "ciastka", "bułki"};
    }

    @Override
    public String getInformacje() {
        String informacjeSklepu = super.getInformacje();
        String listaProduktow = String.join(", ", produkty);
        return informacjeSklepu + ", produkty: " + listaProduktow;
    }
}
