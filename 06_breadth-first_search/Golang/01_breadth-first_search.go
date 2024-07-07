package main

import "fmt"

// isSeller returns true if person's name ends with "m"
func isSeller(name string) bool {
	return name[len(name)-1] == 'm'
}

// Initialize new graph
var graph = make(map[string][]string)

func main() {
	// Populate graph with friends
	graph["you"] = []string{"alice", "bob", "claire"}
	graph["bob"] = []string{"anuj", "peggy"}
	graph["alice"] = []string{"peggy"}
	graph["claire"] = []string{"thom", "jonny"}
	graph["anuj"] = []string{}
	graph["peggy"] = []string{}
	graph["thom"] = []string{}
	graph["jonny"] = []string{}

	// Search for seller among your friends
	search("you")
}

// search returns true if a seller is found among friends (or friends of friends) of the given person.
// It also prints the name of the seller to the console.
func search(name string) bool {
	var searchQueue []string
	searchQueue = append(searchQueue, graph[name]...)
	// This is how you keep track of which people you've searched before.
	searched := make(map[string]bool)
	var person string
	for len(searchQueue) != 0 {
		person = searchQueue[0]
		searchQueue = searchQueue[1:]
		// Only search this person if you haven't already searched them.
		if !searched[person] {
			if isSeller(person) {
				fmt.Println(person, "is mango seller!")
				return true
			}
			searchQueue = append(searchQueue, graph[person]...)
			// Marks this person as searched.
			searched[person] = true
		}
	}
	return false
}
