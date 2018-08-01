package main

import "fmt"

func count(list []int) int {
	if len(list) == 0 {
		return 0
	}
	return 1 + count(list[1:])
}

func main() {
	fmt.Println(count([]int{0, 1, 2, 3, 4, 5}))
}
