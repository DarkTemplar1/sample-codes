package code_sample_java.lab6.zad6;

public class Main {
    public static String removeEveryNthWord(int n, String... words) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            if ((i + 1) % n != 0) {
                result.append(words[i]).append(" ");
            }
        }
        return result.toString().trim();
    }
    public static void main(String[] args) {
        String[] words = {"Ala", "nie", "ma", "test", "kota", "i", "psa", "papuge"};
        String result = removeEveryNthWord(2, words);
        System.out.println(result);
    }
}
