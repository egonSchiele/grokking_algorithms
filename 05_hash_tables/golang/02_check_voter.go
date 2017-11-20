package main

import "fmt"

var voted map[string]bool

func main() {
    voted = make(map[string]bool)
    check_voter("tom")
    check_voter("mike")
    check_voter("mike")
}

func check_voter(name string){
    if voted[name]{
    	fmt.Println("kick tem out!")
    }else{
    	voted[name] = true
	    fmt.Println("let tem vote!")
	}
}
