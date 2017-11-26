#include <stdio.h>

int sum(int *arr, int index, int size) {
	if (index == size)
		return 0;
	return arr[index] + sum(arr, index + 1, 4);
}

int main(void) {
	int arr[4] = { 1,2,3,4 };
	printf("%d", sum(arr, 0, 4));

	return 0;
}