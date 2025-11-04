import scala.collection.mutable

// the graph
val graph = mutable.Map[String, mutable.Map[String, Int]](
  "start" -> mutable.Map("a" -> 6, "b" -> 2),
  "a" -> mutable.Map("fin" -> 1),
  "b" -> mutable.Map("a" -> 3, "fin" -> 5),
  "fin" -> mutable.Map[String, Int]()
)

// the costs table
val infinity = Double.PositiveInfinity
val costs = mutable.Map[String, Double](
  "a" -> 6,
  "b" -> 2,
  "fin" -> infinity
)

// the parents table
val parents = mutable.Map[String, String](
  "a" -> "start",
  "b" -> "start",
  "fin" -> null
)

val processed = mutable.ListBuffer[String]()

def findLowestCostNode(costs: mutable.Map[String, Double], processed: mutable.ListBuffer[String]): Option[String] = {
  var lowestCost = infinity
  var lowestCostNode: Option[String] = None
  // Go through each node.
  for((node, cost) <- costs) {
    // If it's the lowest cost so far and hasn't been processed yet...
    if(cost < lowestCost && !processed.contains(node)) {
      // ... set it as the new lowest-cost node.
      lowestCost = cost
      lowestCostNode = Some(node)
    }
  }
  lowestCostNode
}

// Find the lowest-cost node that you haven't processed yet.
var node = findLowestCostNode(costs, processed)
// If you've processed all the nodes, this while loop is done.
while(node.isDefined) {
  val cost = costs(node.get)
  // Go through all the neighbors of this node.
  val neighbors = graph(node.get)
  for((n, neighborCost) <- neighbors) {
    val newCost = cost + neighborCost
    // If it's cheaper to get to this neighbor by going through this node...
    if(costs(n) > newCost) {
      // ... update the cost for this node.
      costs(n) = newCost
      // This node becomes the new parent for this neighbor.
      parents(n) = node.get
    }
  }
  // Mark the node as processed.
  processed += node.get
  // Find the next node to process, and loop.
  node = findLowestCostNode(costs, processed)
}

println("Cost from the start to each node:")
println(costs)

