import java.util.Arrays;

public class SelectionSort2 {

    // this version uses raw arrays instead of ArrayList
    public static void selectionSort(int[] target) {
        for (int i = 0; i < target.length - 1; i++) {
            int left = target[i];
            for (int j = i + 1; j < target.length; j++) {
                int rigth = target[j];
                if (left > rigth) {
                    target[i] = rigth;
                    target[j] = left;
                    left = rigth;
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
