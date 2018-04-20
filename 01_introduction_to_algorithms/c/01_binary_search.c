#include <stdio.h>
#include <stdlib.h>

#define SIZE 4;

int binarySearch(int[], int);

int main()
{
    int myList[] = {1, 3, 5, 7, 9};
    printf("%d\n", binarySearch(myList, 3));  // 1
    printf("%d\n", binarySearch(myList, -1)); //-1
    return 0;
}

int binarySearch(int list[], int item)
{
    int low = 0;
    int high = SIZE;
    while (low <= high)
    {
        int mid = (int)((low + high) / 2);
        int guess = list[mid];

        if (guess == item)
        {
            return mid;
        }
        else if (guess > item)
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    return -1; //number not find
}
