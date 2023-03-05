import java.util.*;

public class Sum {
    public static int sum(ArrayList<Integer> num_list) {

        if (num_list.size() == 0) {
            return 0;
        } else {
            int num = num_list.get(0);
            num_list.remove(0);
            return num + sum(num_list);
        }

    }

    public static void main(String[] args) {
        int total = sum(new ArrayList<Integer>(Arrays.asList(2, 4, 6)));
        System.out.println(total);
    }
}
