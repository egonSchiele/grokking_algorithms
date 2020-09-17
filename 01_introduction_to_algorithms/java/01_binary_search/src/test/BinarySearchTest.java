package test;

import main.BinarySearch;
import org.junit.Assert;
import org.junit.Test;

public class BinarySearchTest {
    @Test
    public void testListIsEmpty() {
        BinarySearch binarySearch = new BinarySearch();
        int[] myList = {6, 9};
        int[] emptyList = {};

        Assert.assertEquals(false, binarySearch.isListEmpty(myList));
        Assert.assertEquals(true, binarySearch.isListEmpty(emptyList));
    }

    @Test
    public void testGuessEqualsItem() {
        BinarySearch binarySearch = new BinarySearch();

        Assert.assertEquals(true, binarySearch.guessEqualsItem(3, 3));
        Assert.assertEquals(false, binarySearch.guessEqualsItem(0, 4));
    }

    @Test
    public void testGuessIsLessThanItem() {
        BinarySearch binarySearch = new BinarySearch();

        Assert.assertEquals(true, binarySearch.guessLessThanItem(2, 7));
        Assert.assertEquals(false, binarySearch.guessLessThanItem(6, 1));
    }

    @Test
    public void testGuessGreaterThanItem() {
        BinarySearch binarySearch = new BinarySearch();

        Assert.assertEquals(true, binarySearch.guessGreaterThanItem(17, 12));
        Assert.assertEquals(false, binarySearch.guessGreaterThanItem(13, 28));
    }

    @Test
    public void testGivenListAndItemReturnIndexOfItem() {
        BinarySearch binarySearch = new BinarySearch();
        int[] testList = {1, 3, 5, 7, 9};

        Assert.assertEquals(1, binarySearch.binarySearch(testList, 3));
        Assert.assertEquals(-1, binarySearch.binarySearch(testList, 77));
    }
}
