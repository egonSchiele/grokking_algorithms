#include <stdio.h>

int sum(int *arr, int size) {
	int total = 0;
	for (int i = 0; i < size; i++) {
		total += arr[i];
	}
	return total;
}

int main(void) {
	int arr[4] = { 1,2,3,4 };
	printf("%d", sum(arr, 4));

	return 0;
}