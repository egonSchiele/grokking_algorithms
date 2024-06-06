package main

func person_is_seller(name string) bool {
	return name[len(name)-1] == 'm'
}

var graph = make(map[string][]string)

func main() {
	graph["you"] = []string{"alice", "bob", "claire"}
	graph["bob"] = []string{"anuj", "peggy"}
	graph["alice"] = []string{"peggy"}
	graph["claire"] = []string{"thom", "jonny"}
	graph["anuj"] = []string{}
	graph["peggy"] = []string{}
	graph["thom"] = []string{}
	graph["jonny"] = []string{}

	search("you")
}

func search(name string) bool {
	var search_queue []string
	search_queue = append(search_queue, graph[name]...)
	searched := make(map[string]bool)
	var person string
	for len(search_queue) != 0 {
		person = search_queue[0]
		search_queue = search_queue[1:]
		if !searched[person] {
			if person_is_seller(person) {
				println(person + " is mango seller!")
				return true
			}

			search_queue = append(search_queue, graph[person]...)
			searched[person] = true

		}
	}
	return false
}
