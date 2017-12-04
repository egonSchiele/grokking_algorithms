package main

import "fmt"

func sum(arr []int) int {
	if len(arr) == 0 {
		return 0
	}
	return arr[0] + sum(arr[1:])
}

func main() {
	fmt.Println(sum([]int{1, 2, 3, 4}))
}
