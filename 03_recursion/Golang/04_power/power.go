package main

import "fmt"

func power(base, exp int) int {
	if exp == 0 {
		return 1
	}
	return base * power(base, exp-1)
}

func main() {
	fmt.Println(power(2, 5))
}
