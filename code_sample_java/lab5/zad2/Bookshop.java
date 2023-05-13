package code_sample_java.lab5.zad2;

class Bookshop extends Shop {
    private String[] produkty;

    public Bookshop(String adres, int rozmiar) {
        super(adres, rozmiar);
        this.produkty = new String[]{"Harry Potter i Kamień Filozoficzny", "Władca Pierścieni", "Zabić drozda"};
    }

    @Override
    public String getInformacje() {
        String informacjeSklepu = super.getInformacje();
        String listaProduktow = String.join(", ", produkty);
        return informacjeSklepu + ", produkty: " + listaProduktow;
    }
}
