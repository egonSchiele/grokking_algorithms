package main

import "fmt"

func sum(arr []int) int {
	total := 0
	for _, num := range arr {
		total += num
	}
	return total
}

func main() {
	fmt.Println(sum([]int{1, 2, 3, 4}))
}
