

import main.SelectionSort3;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SelectionSort3Test {
    @Test
    public void testIsEmpty() {
        SelectionSort3 selectionSort3 = new SelectionSort3();
        List<Integer> nums = new ArrayList<>();
        List<Integer> nums2 = new ArrayList<>(Arrays.asList(0, 0, 7));

        Assert.assertEquals(true, selectionSort3.isEmpty(nums));
        Assert.assertEquals(false, selectionSort3.isEmpty(nums2));
    }

    @Test
    public void testGetSmallest() {
        SelectionSort3 selectionSort3 = new SelectionSort3();
        List<Integer> nums = new ArrayList<>(Arrays.asList(2, 1, 11, 19));

        Assert.assertEquals(1, selectionSort3.getSmallest(nums));
    }

    @Test
    public void testRemoveSmallest() {
        SelectionSort3 selectionSort3 = new SelectionSort3();
        List<Integer> nums = new ArrayList<>(Arrays.asList(4, 8, 11, 0));

        Assert.assertEquals(0, selectionSort3.removeSmallest(nums));
        Assert.assertNotEquals(11, selectionSort3.removeSmallest(nums));
    }

    @Test
    public void testSelectionSort() {
        SelectionSort3 selectionSort3 = new SelectionSort3();
        List<Integer> nums = new ArrayList<>(Arrays.asList(12, 14, 3, 1, 8));
        List<Integer> sortedNums = new ArrayList<>(Arrays.asList(1, 3, 8, 12, 14));

        Assert.assertEquals(sortedNums, selectionSort3.selectionSort(nums));
    }
}
