
import java.util.*;
import java.util.stream.Collectors;

public class StreamEvenFilter {

    public static void main(String[] args) {
        List<Integer> nums = Arrays.asList(10, 15, 20, 25, 30);
        List<Integer> evens = nums.stream().filter(n -> n % 2 == 0).collect(Collectors.toList());
        System.out.println("Even numbers: " + evens);
    }
}
