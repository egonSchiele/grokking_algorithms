import java.util.Arrays;

public class SelectionSort2 {

    // this version uses raw arrays instead of ArrayList
    public static void selectionSort(int[] arr) {
        for (int i = 0; i < arr.length-1; i++) {
            for (int j = i+1; j < arr.length; j++) {
                if (arr[j] < arr[i]) {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
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
