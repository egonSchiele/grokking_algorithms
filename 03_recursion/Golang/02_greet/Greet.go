package main

import "fmt"

func greet2(name string){
    fmt.Println("how are you, "+name+"?")
}

func bye(){
    fmt.Println("ok bye!")
}

func greet(name string){
    fmt.Println("hello, "+name+"!")
    greet2(name)
    fmt.Println("getting ready to say bye...")
    bye()
}

func main() {
    greet("adit");
}

