import Foundation

// the graph
var graph =  [String : [String: Double]] ()
graph["start"] = [String: Double]()
graph["start"]?["a"] = 6
graph["start"]?["b"] = 2

graph["a"] = [String: Double]()
graph["a"]?["fin"] = 1

graph["b"] = [String: Double]()
graph["b"]?["a"] = 3
graph["b"]?["fin"] = 5

graph["fin"] = [String: Double]()

// the costs table
let infinity = Double.infinity
var costs = [String: Double]()
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity

// the parents table
var parents = [String: String]()
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = nil

var processed = [String]()

func findLowestCostNode(costs: [String: Double]) -> [String: Double] {
    var lowestCost = Double.infinity
    var lowestCostNode = [String: Double]()
    // Go through each node.
    for node in costs {
        let cost = node.value
        // If it's the lowest cost so far and hasn't been processed yet...
        if (cost < lowestCost) && !processed.contains(node.key) {
            // ... set it as the new lowest-cost node.
            lowestCost = cost
            lowestCostNode = [node.key : node.value]
        }
        
    }
    return lowestCostNode
}

// Find the lowest-cost node that you haven't processed yet.
var node = findLowestCostNode(costs: costs)

// If you've processed all the nodes, this while loop is done.
while !node.isEmpty {
    // Swift Note: Unfortunately there are some limits for working with Dictionary inside Dictionary, so we have to use temp "nodeFirstKey" variable as workaround
    var nodeFirstKey = node.first?.key
    var cost = costs[nodeFirstKey!]
    // Go through all the neighbors of this node.
    var neighbors = graph[nodeFirstKey!]
    for n in (neighbors?.keys)! {
        var newCost = cost! + (neighbors?[n])!
        // If it's cheaper to get to this neighbor by going through this node...
        if costs[n]! > newCost {
            // ... update the cost for this node.
            costs[n] = newCost
            // This node becomes the new parent for this neighbor.
            parents[n] = nodeFirstKey
        }
    }
    // Mark the node as processed.
    processed.append(nodeFirstKey!)
    // Find the next node to process, and loop.
    node = findLowestCostNode(costs: costs)
}


print("Cost from the start to each node:")
print(costs) // -> ["b": 2.0, "fin": 6.0, "a": 5.0]

