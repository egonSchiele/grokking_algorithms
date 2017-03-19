import java.util.HashMap;
import java.util.Map;

public class PriceOfGroceries {

    public static void main(String[] args) {
        Map<String, Double> book = new HashMap<>();

        // an apple costs 67 cents
        book.put("apple", 0.67);
        // milk costs $1.49
        book.put("milk", 1.49);
        book.put("avocado", 1.49);

        System.out.println(book); // {apple=0.67, avocado=1.49, milk=1.49}
    }
}