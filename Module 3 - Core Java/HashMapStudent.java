
import java.util.HashMap;
import java.util.Scanner;

public class HashMapStudent {

    public static void main(String[] args) {
        HashMap<Integer, String> map = new HashMap<>();
        Scanner sc = new Scanner(System.in);

        map.put(101, "Alice");
        map.put(102, "Bob");
        map.put(103, "Charlie");

        System.out.print("Enter student ID to search: ");
        int id = sc.nextInt();

        String name = map.get(id);
        if (name != null) {
            System.out.println("Name: " + name);
        } else {
            System.out.println("Student not found.");
        }
    }
}
