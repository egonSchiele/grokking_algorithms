from collections import deque

def person_is_seller(name):
    if name[-1] == 'm':
        print(name + " is a mango seller!")
        return True
    return False

graph = {}
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

def search(name):
    search_queue = deque()
    if person_is_seller(name):
        return True
    searched = {name}
    search_queue += graph[name]
    # This is how you keep track of which people you've searched before.

    while search_queue:
        person = search_queue.popleft()
        # Only search this person if you haven't already searched them.
        if person in searched:
            continue
        if person_is_seller(person):
            return True
        search_queue += graph[person]
        # Marks this person as searched
        searched.add(person)
    return False

search("you")
