package main

import "fmt"

var book map[string]float64

func main() {
	book = make(map[string]float64)
	book["apple"] = 0.67
	book["milk"] = 1.49
	book["avocado"] = 1.49
	fmt.Println(book)
}
