
import java.util.Scanner;

public class TryCatchEx {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter dividend: ");
        int a = sc.nextInt();
        System.out.print("Enter divisor: ");
        int b = sc.nextInt();

        try {
            int result = a / b;
            System.out.println("Result: " + result);
        } catch (ArithmeticException e) {
            System.out.println("Error: Cannot divide by zero.");
        }
    }
}
