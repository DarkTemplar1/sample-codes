package code_sample_java.lab5.zad4;
public class MyClass {
    private int arg1;
    private String arg2;
    private double arg3;
    private boolean arg4;
    private char arg5;

    public MyClass(int arg1, String arg2, double arg3, boolean arg4, char arg5) {
        this.arg1 = arg1;
        this.arg2 = arg2;
        this.arg3 = arg3;
        this.arg4 = arg4;
        this.arg5 = arg5;
    }

    @Override
    public String toString() {
        return "MyClass{" +
                "arg1=" + arg1 +
                ", arg2='" + arg2 + '\'' +
                ", arg3=" + arg3 +
                ", arg4=" + arg4 +
                ", arg5=" + arg5 +
                '}';
    }
}
