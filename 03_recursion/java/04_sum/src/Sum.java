import java.util.*;

public class Sum {
    public static int sum(ArrayList<Integer> num_list, int index) {

        if (num_list.size() == index) {
            return 0;
        } else {
            int num = num_list.get(index);
            return num + sum(num_list, index);
        }

    }

    public static void main(String[] args) {
        int total = sum(new ArrayList<Integer>(Arrays.asList(2, 4, 6)), 0);
        System.out.println(total);
    }
}
