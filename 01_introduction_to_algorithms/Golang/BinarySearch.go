package main

import "fmt"

func checkBin(list []int, i int) bool {
	low := 0
	high := len(list) - 1
	for low <= high {
		mid := (low + high) / 2
		if list[mid] == i {
			return true
		}
		if list[mid] < i {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
	return false
}

func main() {
	fmt.Println(checkBin([]int{1, 2, 3, 4, 5}, 1))  // true
	fmt.Println(checkBin([]int{1, 2, 3, 4, 5}, -1)) //false
}
