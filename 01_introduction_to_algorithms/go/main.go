package main

import "fmt"

func main() {
	//Creating data to search through
	sliceToSearch := []int{1, 3, 5, 7, 9}
	//What we are searching for
	target := 9

	position := binarySearch(sliceToSearch, target)

	if position < 0 {
		fmt.Printf("%v doesn't exist in the slice %v\n", target, sliceToSearch)
	} else {
		fmt.Printf("Found %v in position: %v \n", target, position)
	}
}

func binarySearch(list []int, target int) int {
	low := 0
	high := len(list)

	for low <= high {
		mid := (low + high) / 2

		guess := list[mid]

		if guess == target {
			return mid
		}

		if guess > target {
			high = mid - 1
		} else {
			low = mid + 1
		}
	}
	return -1
}
