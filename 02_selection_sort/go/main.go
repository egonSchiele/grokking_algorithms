package main

import "fmt"

func main() {
	sliceToSort := []int{99, 5, 3, 6, 2, 10, 1}
	sortedSlice := selectionSort(sliceToSort)

	fmt.Printf("Sorted! \n%v\n", sortedSlice)
}

//Return the smallest int in the slice
func findSmallest(values []int) int {
	smallestValue := values[0]
	smallestIndex := 0

	for i, v := range values {
		if v < smallestValue {
			smallestValue = v
			smallestIndex = i
		}
	}
	return smallestIndex
}

func selectionSort(values []int) []int {
	sortedArray := make([]int, 0)

	for range values {
		//find the smallest int in the slice
		smallestIndex := findSmallest(values)
		//add that int to the sorted array
		sortedArray = append(sortedArray, values[smallestIndex])
		//remove the int from the unsorted array
		values = append(values[:smallestIndex], values[smallestIndex+1:]...)
	}
	return sortedArray
}
