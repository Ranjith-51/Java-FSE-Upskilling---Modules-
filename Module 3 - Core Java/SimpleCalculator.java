
import java.util.Scanner;

public class SimpleCalculator {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double a = sc.nextDouble();
        System.out.print("Enter second number: ");
        double b = sc.nextDouble();
        System.out.print("Choose operation (+ - * /): ");
        char op = sc.next().charAt(0);
        double result;
        switch (op) {
            case '+' ->
                result = a + b;
            case '-' ->
                result = a - b;
            case '*' ->
                result = a * b;
            case '/' ->
                result = b != 0 ? a / b : Double.NaN;
            default -> {
                System.out.println("Invalid operation");
                return;
            }
        }
        System.out.println("Result: " + result);
    }
}
