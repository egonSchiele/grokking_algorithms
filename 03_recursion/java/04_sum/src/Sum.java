import java.util.*;

public class Sum {
    public static int sum(int[] arr, int startIndex){
        if (startIndex == arr.length) {
            return 0; // Base case: end of array
        }
        return arr[startIndex] + sum(arr, startIndex + 1);
    }

    public static void main(String[] args) {
        int[] numbers = new int[]{ 2, 4, 6};
        System.out.println(sum(numbers, 0));
    }
}
