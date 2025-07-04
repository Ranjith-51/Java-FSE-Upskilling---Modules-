
import java.lang.reflect.*;

public class Reflection {

    public static void main(String[] args) throws Exception {
        Class<?> c = Class.forName("java.lang.String");
        Method[] methods = c.getDeclaredMethods();

        for (Method m : methods) {
            System.out.println(m.getName());
        }
    }
}
