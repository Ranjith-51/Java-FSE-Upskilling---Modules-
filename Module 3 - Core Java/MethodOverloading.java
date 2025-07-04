
public class MethodOverloading {

    static int add(int a, int b) {
        return a + b;
    }

    static double add(double a, double b) {
        return a + b;
    }

    static int add(int a, int b, int c) {
        return a + b + c;
    }

    public static void main(String[] args) {
        System.out.println("add(int, int): " + add(10, 20));
        System.out.println("add(double, double): " + add(5.5, 4.5));
        System.out.println("add(int, int, int): " + add(1, 2, 3));
    }
}
