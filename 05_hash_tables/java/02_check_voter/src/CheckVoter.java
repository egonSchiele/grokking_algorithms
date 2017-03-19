import java.util.HashMap;
import java.util.Map;

public class CheckVoter {
    private static Map<String, Boolean> voted = new HashMap<>();

    private static void checkVoter(String name) {
        if (voted.containsKey(name)) {
            System.out.println("kick them out!");
        } else {
            voted.put(name, true);
            System.out.println("let them vote!");
        }
    }

    public static void main(String[] args) {
        checkVoter("tom"); // let them vote!
        checkVoter("mike"); // let them vote!
        checkVoter("mike"); // kick them out!
    }
}
