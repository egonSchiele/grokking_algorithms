#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define len(array) (sizeof(array) / sizeof(array[0]))
 
// Finds the smallest value in an array
int findSmallest(int *arr, int len) {
	// Stores the smallest value
	int smallest = arr[0];
	// Stores the index of the smallest value
	int smallest_index = 0;
	for (int i = 0; i < len; ++i) {
		if (arr[i] < smallest) {
			smallest = arr[i];
			smallest_index = i;
		}
	}
	return smallest_index;
}

int *selectionSort(int *arr, int len) {
	// Create new Array
	int *newArr = (int *)calloc(len,  sizeof(int));
	for (int i = 0; i < len; ++i) {
		int smallest = findSmallest(arr);
		newArr[i] = arr[smallest];
		// same as deleted by changing to the largest value
		arr[smallest] = INT_MAX;
	}
	return newArr;
}

int main(void) {
	
	int arr[] = { 5, 3, 6, 2, 10 };
	int arrLen = len(arr);
	int *sortarr = selectionSort(arr, arrLen);
	
	// print result
	for (int i = 0; i < arrLen; i++) {
		printf("%d ", sortarr[i]);
	}
	putchar('\n');
	
	free(sortarr);
	
	return 0;

}
