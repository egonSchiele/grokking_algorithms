package main

import "fmt"

func countdown(i int){
    fmt.Println(i)
    if i <= 0 {
	return
    }else{
        countdown(i-1)
    }
}

func main() {
    countdown(5);
}

