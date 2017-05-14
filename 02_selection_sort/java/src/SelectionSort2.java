import java.util.Arrays;

public class SelectionSort2 {

    // this version uses raw arrays instead of ArrayList
    private static int[] selectionSort(int[] arr) {
        int[] newArr = new int[arr.length];

        for (int i = 0; i < newArr.length; i++) {
            int smallestIndex = findSmallest(arr);
            newArr[i] = arr[smallestIndex];

            arr = getNewArrWithoutSmallest(arr, smallestIndex);
        }

        return newArr;
    }

    private static int[] getNewArrWithoutSmallest(int[] arr, int smallestIndex) {
        int[] newArrWithoutSmallest = new int[arr.length - 1];
        for (int i = 0; i < arr.length; i++) {
            if (i < smallestIndex) {
                newArrWithoutSmallest[i] = arr[i];
            } else if (i > smallestIndex) {
                newArrWithoutSmallest[i - 1] = arr[i];
            }
        }
        return newArrWithoutSmallest;
    }

    private static int findSmallest(int[] arr) {
        int smallest = arr[0];
        int smallestIndex = 0;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < smallest) {
                smallest = arr[i];
                smallestIndex = i;
            }
        }
        return smallestIndex;
    }

    public static void main(String[] args) {
        int[] arr = {5, 3, 6, 2, 10};
        System.out.println(Arrays.toString(selectionSort(arr))); // [2, 3, 5, 6, 10]
    }
}
