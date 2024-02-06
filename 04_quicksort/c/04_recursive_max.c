#include <stdio.h>

int max(int *arr, int index, int size){
    //base case
    if (index == size - 1)
        return arr[index];

    int sub_max = max(arr, index + 1, size);

    return (arr[index] > sub_max) ? arr[index] : sub_max;
}

int main(void){
    int arr[] = {2,3,6,5,5};
    // the C way of calculating the size of an array
    int size = sizeof(arr) / sizeof(arr[0]);
    printf("%d", max(arr, 0, size));
    return 0;
}
