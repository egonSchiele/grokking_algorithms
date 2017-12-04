#include <stdio.h>
#include <stdlib.h>
#define SIZE 5

// Finds the smallest value in an array
int findSmallest(int *arr) {
	// Stores the smallest value
	int smallest = arr[0];
	// Stores the index of the smallest value
	int smallest_index = 0;
	for (int i = 1; i < SIZE; i++) {
		if (arr[i] < smallest) {
			smallest = arr[i];
			smallest_index = i;
		}
	}
	return smallest_index;
}

int *selectionSort(int *arr) {
	// Create new Array
	int *newArr = (int *)malloc(SIZE * sizeof(int));
	for (int i = 0; i < SIZE; i++) {
		int smallest = findSmallest(arr);
		newArr[i] = arr[smallest];
		// same as deleted by changing to the largest value
		arr[smallest] = INT_MAX;
	}
	return newArr;
}

int main(void) {
	int arr[SIZE] = {5, 3, 6, 2, 10};
	int *sortarr = selectionSort(arr);
	// print result
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", sortarr[i]);
	}
	return 0;
}