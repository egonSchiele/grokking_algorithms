import java.util.Arrays;

public class Quicksort {
    public static void main(String[] args){
        int[] array = {10, 5, 2, 3};
        System.out.println(Arrays.toString(array)); // Original array
        quickSort(array, 0, array.length - 1);
        System.out.println(Arrays.toString(array)); // Sorted array
    }

    private static void quickSort(int[] array, int low, int high){
        if(low >= high){
            // Base case: arrays with 0 or 1 element are already "sorted"
            return;
        }
        // Recursive case
        int pivotIndex = partition(array, low, high);
        quickSort(array, low, pivotIndex - 1);   // Sub-array of elements less than pivot
        quickSort(array, pivotIndex + 1, high);  // Sub-array of elements greater than pivot
    }

   private static int partition(int[] array, int low, int high) {
        int pivot = array[high];
        int i = low - 1;
        for(int j = low; j < high; j++){
            if(array[j] <= pivot){
                i++;
                swap(array, i, j);
            }
        }
        swap(array, i + 1, high);
        return i + 1;
    }

    private static void swap(int[] array, int i, int j){
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}