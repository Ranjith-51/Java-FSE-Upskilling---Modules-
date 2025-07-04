
import java.util.Random;
import java.util.Scanner;

public class NumberGuessingGame {

    public static void main(String[] args) {
        Random rand = new Random();
        int target = rand.nextInt(100) + 1;
        Scanner sc = new Scanner(System.in);
        int guess;

        do {
            System.out.print("Guess a number (1 to 100): ");
            guess = sc.nextInt();
            if (guess > target) {
                System.out.println("Too high!"); 
            }else if (guess < target) {
                System.out.println("Too low!");
            }
        } while (guess != target);

        System.out.println("Correct! The number was " + target);
    }
}
