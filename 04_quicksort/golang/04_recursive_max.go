package main

import "fmt"

func max(list []int) int {
	if len(list) == 2 {
		if list[0] > list[1] {
			return list[0]
		}
		return list[1]
	}

	subMax := max(list[1:])
	if list[0] > subMax {
		return list[0]
	}
	return subMax
}

func main() {
	fmt.Println(max([]int{1, 5, 10, 25, 16, 1}))
}
