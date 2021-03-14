import java.util.Arrays;

public class SelectionSort2 {

    // this version uses raw arrays instead of ArrayList
    public static void selectionSort(int[] target) {
        for (int i = 0; i < target.length - 1; i++) {
            int left = target[i];
            for (int j = i + 1; j < target.length; j++) {
                int right = target[j];
                if (left > right) {
                    target[i] = right;
                    target[j] = left;
                    left = right;
                }
            }
        }
    }

    public static void main(String[] args) {
        int[] arr = {5, 3, 6, 2, 10};
        selectionSort(arr);
        System.out.println(Arrays.toString(arr)); // [2, 3, 5, 6, 10]
    }
}
