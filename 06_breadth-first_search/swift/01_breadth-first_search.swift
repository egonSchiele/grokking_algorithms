import Foundation

public struct Deque<T> {
    
    private class Node {
        
        let value: T
        var next: Node?
        var prev: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    private var count: UInt = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        let node = Node(value: element)
        
        if count == 0 {
            head = node
        } else {
            tail?.next = node
            node.prev = tail
        }
        
        tail = node
        count += 1
    }
    
    public mutating func enqueueFront(_ element: T) {
        let node = Node(value: element)
        
        if count == 0 {
            tail = node
        } else {
            head?.prev = node
            node.next = head
        }
        
        head = node
        count += 1
    }
    
    public mutating func dequeue() -> T? {
        let value = head?.value
        head = head?.next
        head?.prev = nil
        count -= 1
        return value
    }
    
    public mutating func dequeueBack() -> T? {
        let value = tail?.value
        tail = tail?.prev
        tail?.next = nil
        count -= 1
        return value
    }
}

func persionIsSeller(name: String) -> Bool {
    return name.characters.last == "m"
}

var graph = [String : [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

func search(name: String) -> Bool {
    var searchQueue = Deque<String>()
    //Swift Note: Our custom Deque doesn't have possibility to add new element as array so we have to add elements one by one (insted of +=graph["person"] in the book example)
    for string in graph[name]! {
        searchQueue.enqueue(string)
    }
    // This array is how you keep track of which people you've searched before.
    var searched: Set<String> = []
    while !searchQueue.isEmpty {
        let person = searchQueue.dequeue()
        // Only search this person if you haven't already searched them
        if !searched.contains(person!) {
            if persionIsSeller(name: person!) {
                print("\(person!) is a mango seller!")
                return true
            } else {
                for string in graph[person!]! {
                    searchQueue.enqueue(string)
                }
                // Marks this person as searched
                searched.insert(person!)
            }
        }
    }
    
    return false
}

if search(name: "you") == false {
    print("Mango seller Not Found!")
} // => thom is a mango seller!
