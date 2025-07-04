
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class FileWriting {

    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in); FileWriter writer = new FileWriter("output.txt")) {
            System.out.print("Enter text to write to file: ");
            String data = sc.nextLine();
            writer.write(data);
            System.out.println("Data written to output.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
