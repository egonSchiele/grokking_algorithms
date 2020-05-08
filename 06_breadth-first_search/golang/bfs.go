package main

import (
	"fmt"
)

func PersonIsSeller(name string) bool {
	return string(name[len(name)-1]) == "m"
}

func search(aGraph map[string][]string, name string) bool {

	//search queue
	var searchQueue []string
	searchQueue = append(searchQueue, aGraph[name]...)
	var searched []string

	for len(searchQueue) > 0 {
		var person = searchQueue[0]
		searchQueue = searchQueue[1:]
		personAlreadySearched := false

		/* Checking to see if this person has already been searched */
		for i := 0; i < len(searched); i++ {
			if searched[i] == person {
				personAlreadySearched = true
				break

			}
		}

		if personAlreadySearched == false {
			if PersonIsSeller(person) {
				fmt.Println(person, "is a mango seller!")
				return true
			}

			searchQueue = append(searchQueue, aGraph[person]...)
			searched = append(searched, person)
		}

	}
	return false

}

func main() {
	graph := make(map[string][]string)
	graph["you"] = []string{"alice", "bob", "claire"}
	graph["bob"] = []string{"anuj", "peggy"}
	graph["alice"] = []string{"peggy"}
	graph["claire"] = []string{"thom", "jonny"}
	graph["anuj"] = []string{}
	graph["peggy"] = []string{}
	graph["thom"] = []string{}
	graph["jonny"] = []string{}

	search(graph, "you")
}
