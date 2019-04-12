

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SelectionSort3 {
    public static void main(String[] args) {
        SelectionSort3 selectionSort3 = new SelectionSort3();
        List<Integer> nums = new ArrayList<>(Arrays.asList(5, 3, 6, 2, 10));

        if (!selectionSort3.isEmpty(nums)) {
            System.out.print(selectionSort3.selectionSort(nums));
        }
    }

    public boolean isEmpty(List<Integer> nums) {
        if (nums.size() > 0) {
            return false;
        }
        return true;
    }

    public int getSmallest(List<Integer> nums) {
        int smallest = nums.get(0);

        for (int num : nums) {
            if (num < smallest) {
                smallest = num;
            }
        }

        return smallest;
    }

    public int removeSmallest(List<Integer> nums) {
        return nums.remove(nums.indexOf(getSmallest(nums)));
    }

    public List<Integer> selectionSort(List<Integer> nums) {
        List<Integer> sortedNums = new ArrayList<>();
        int boundary = nums.size();

        while (boundary > 0) {
            sortedNums.add(removeSmallest(nums));
            boundary--;
        }

        return sortedNums;
    }
}
