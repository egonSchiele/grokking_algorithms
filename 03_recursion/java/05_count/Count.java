package main;

import java.util.*;

public class Count {

    public static int count(ArrayList<Integer> arr) {

        if (arr.size() == 1) {
            return 1;
        } else {
            return 1 + arr.remove(0);
        }
    }

    public static void main(String[] args) {
        int total_count = count(new ArrayList<Integer>(Arrays.asList(2, 4, 6)));
        System.out.println(total_count);
    }
}
