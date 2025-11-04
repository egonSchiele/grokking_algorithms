import scala.collection.mutable

def personIsSeller(name: String): Boolean = {
  name.last == 'm'
}

val graph = mutable.Map[String, List[String]](
  "you" -> List("alice", "bob", "claire"),
  "bob" -> List("anuj", "peggy"),
  "alice" -> List("peggy"),
  "claire" -> List("thom", "jonny"),
  "anuj" -> List(),
  "peggy" -> List(),
  "thom" -> List(),
  "jonny" -> List()
)

def search(name: String): Boolean = {
  val searchQueue = mutable.Queue[String]()
  searchQueue.enqueue(name)
  // This is how you keep track of which people you've searched before.
  val searched = mutable.Set[String]()
  
  while(searchQueue.nonEmpty) {
    val person = searchQueue.dequeue()
    // Only search this person if you haven't already searched them.
    if(!searched.contains(person)) {
      if(personIsSeller(person)) {
        println(person + " is a mango seller!")
        return true
      }
      searchQueue.enqueueAll(graph(person))
      // Marks this person as searched
      searched.add(person)
    }
  }
  false
}

search("you")

