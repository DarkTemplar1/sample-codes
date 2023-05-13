package code_sample_java.lab6.zad3;

public class MojaData {
    private int dzien;
    private int miesiac;
    private int rok;

    public MojaData(int dzien, int miesiac, int rok) {
        this.dzien = dzien;
        this.miesiac = miesiac;
        this.rok = rok;
    }

    @Override
    public String toString() {
        String dzienString = dzien < 10 ? "0" + dzien : String.valueOf(dzien);
        String miesiacString;

        switch (miesiac) {
            case 1:
                miesiacString = "sty";
                break;
            case 2:
                miesiacString = "lut";
                break;
            case 3:
                miesiacString = "mar";
                break;
            case 4:
                miesiacString = "kwi";
                break;
            case 5:
                miesiacString = "maj";
                break;
            case 6:
                miesiacString = "cze";
                break;
            case 7:
                miesiacString = "lip";
                break;
            case 8:
                miesiacString = "sie";
                break;
            case 9:
                miesiacString = "wrz";
                break;
            case 10:
                miesiacString = "paź";
                break;
            case 11:
                miesiacString = "lis";
                break;
            case 12:
                miesiacString = "gru";
                break;
            default:
                miesiacString = String.valueOf(miesiac);
                break;
        }

        return dzienString + " " + miesiacString + " " + rok;
    }
}
