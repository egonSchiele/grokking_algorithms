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


// MARK: - Another implementation:
// Graph1:
var startGraphOne: [String: [String: Int]] = [:]
startGraphOne["Start"] = ["A": 6, "B": 2]
startGraphOne["A"] = ["Final": 1]
startGraphOne["B"] = ["A": 3, "Final": 5]
startGraphOne["Final"] = [:]

var costsGraphOne: [String: Int] = [:]
costsGraphOne["A"] = 6
costsGraphOne["B"] = 2
costsGraphOne["Final"] = Int.max

var parentsGraphOne: [String: String] = [:]
parentsGraphOne["A"] = "Start"
parentsGraphOne["B"] = "Start"
parentsGraphOne["Final"] = ""

// Graph2:
var startGraphTwo: [String: [String: Int]] = [:]
startGraphTwo["Start"] = ["A": 5, "B": 2]
startGraphTwo["A"] = ["C": 4, "D": 2]
startGraphTwo["B"] = ["A": 8, "D": 7]
startGraphTwo["C"] = ["Final": 3, "D": 6]
startGraphTwo["D"] = ["Final": 1]
startGraphTwo["Final"] = [:]

var costsGraphTwo: [String: Int] = [:]
costsGraphTwo["A"] = 5
costsGraphTwo["B"] = 2
costsGraphTwo["C"] = Int.max
costsGraphTwo["D"] = Int.max
costsGraphTwo["Final"] = Int.max

var parentsGraphTwo: [String: String] = [:]
parentsGraphTwo["A"] = "Start"
parentsGraphTwo["B"] = "Start"
parentsGraphTwo["C"] = ""
parentsGraphTwo["D"] = ""
parentsGraphTwo["Final"] = ""

// Graph3:
var startGraphThree: [String: [String: Int]] = [:]
startGraphThree["Start"] = ["A": 10]
startGraphThree["A"] = ["B": 20]
startGraphThree["B"] = ["C": 1, "Final": 30]
startGraphThree["C"] = ["A": 1]
startGraphThree["Final"] = [:]

var costsGraphThree: [String: Int] = [:]
costsGraphThree["A"] = 10
costsGraphThree["B"] = Int.max
costsGraphThree["C"] = Int.max
costsGraphThree["Final"] = Int.max

var parentsGraphThree: [String: String] = [:]
parentsGraphThree["A"] = "Start"
parentsGraphThree["B"] = ""
parentsGraphThree["C"] = ""
parentsGraphThree["Final"] = ""


var startGraph: [String: [String: Int]] = [:]
var costsGraph: [String: Int] = [:]
var parentsGraph: [String: String] = [:]


/// Set save only unic items.
var processed: Set<String> = []

// Method for finding lowest cost's node:
private func lowestCostNode(_ costs: [String: Int]) -> String {
    var lowestCost = Int.max
    var lowestNode = ""
    
    costs.forEach {
        guard $0.value < lowestCost, !processed.contains($0.key) else { return }
        lowestCost = $0.value
        lowestNode = $0.key
    }
    return lowestNode
}

// Method for finding lowest cost of any graphs:
private func findLowestCost(in costs: [String: Int]) -> Int {
    /// Current node.
    var node = lowestCostNode(costs)
    
    while !node.isEmpty {
        /// Node's cost.
        let cost = costsGraph[node]!
        /// Node's neighbors.
        let neighbors = startGraph[node]!
        
        neighbors.forEach {
            /// New cost.
            let newCost = cost + $0.value
            /// Check on max 'cost' in costsGraph.
            guard costsGraph[$0.key]! > newCost else { return }
            /// If checking is true - performing these actions.
            costsGraph[$0.key]! = newCost
            parentsGraph[$0.key]! = node
        }
        processed.insert(node)
        node = lowestCostNode(costsGraph)
    }
    return costsGraph["Final"]!
}

//1
startGraph = startGraphOne
costsGraph = costsGraphOne
parentsGraph = parentsGraphOne

//2
//startGraph = startGraphTwo
//costsGraph = costsGraphTwo
//parentsGraph = parentsGraphTwo

//3
//startGraph = startGraphThree
//costsGraph = costsGraphThree
//parentsGraph = parentsGraphThree

findLowestCost(in: startGraph["Start"] ?? [:]) // Result => parents' graph: '["A": "B", "Final": "A", "B": "Start"]'
                                                // Result => 'final' is 6
