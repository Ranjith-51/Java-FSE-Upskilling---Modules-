
public class TypeCasting {

    public static void main(String[] args) {
        double d = 10.75;
        int i = (int) d; // explicit cast
        System.out.println("Double to int: " + i);

        int j = 20;
        double newDouble = j; // implicit cast
        System.out.println("Int to double: " + newDouble);
    }
}
