package main

import "fmt"

func checkBin(list []int, i int) int {
	low := 0
	high := len(list) - 1
	for low <= high {
		mid := (low + high) / 2
		if list[mid] == i {
			return mid
		}
		if list[mid] < i {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
	return -1
}

func RecursiveCheckBin(list []int, item int, high, low int) int {
	if high >= low {
		mid := (high + low) / 2

		if list[mid] == item {
			return mid
		} else if list[mid] > item {
			return RecursiveCheckBin(list, item, mid-1, low)
		} else {
			return RecursiveCheckBin(list, item, high, mid+1)
		}

	}
	return -1
}

func main() {
	list := []int{1, 2, 3, 4, 5}
	fmt.Println(checkBin(list, 2))                                          // 0
	fmt.Println(checkBin(list, -1))                                         // -1
	fmt.Println(RecursiveCheckBin([]int{1, 2, 3, 4, 5}, 2, len(list)-1, 0)) // 1
	fmt.Println(RecursiveCheckBin([]int{1, 2, 3, 4, 5}, 0, len(list)-1, 0)) //-1
}
