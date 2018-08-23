package golang

import (
	"fmt"
)

func PersonIsSeller(name string) bool {
	/* Assuming the person whose name ends with m as the mango seller as per the book */
	return string(name[len(name)-1]) == "m"
}

func search(name string) bool {
	graph := make(map[string][]string)
	graph["you"] = []string{"alice", "bob", "claire"}
	graph["bob"] = []string{"anuj", "peggy"}
	graph["alice"] = []string{"peggy"}
	graph["claire"] = []string{"thom", "jonny"}
	graph["anuj"] = []string{}
	graph["peggy"] = []string{}
	graph["thom"] = []string{}
	graph["jonny"] = []string{}

	//search queue
	var search_queue []string
	search_queue = append(search_queue, graph[name]...)
	var searched []string
	for len(search_queue) > 0 {
		var person = search_queue[0]
		search_queue = search_queue[1:]
		var person_already_searched = false
		/* Checking to see if this person has already been searched */
		for i := 0; i < len(searched); i++ {
			if searched[i] == person {
				person_already_searched = true

			}
		}
		if person_already_searched == false {
			if PersonIsSeller(person) {
				fmt.Println(person + " is the mango seller!")
				return true
			} else {
				search_queue = append(search_queue, graph[person]...)
				searched = append(searched, person)
			}
		}

	}
	return false

}

func main() {
	search("you")
}
