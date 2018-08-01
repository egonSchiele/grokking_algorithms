// the graph
const graph = {};
graph.start = {};
graph.start.a = 6;
graph.start.b = 2;

graph.a = {};
graph.a.fin = 1;

graph.b = {};
graph.b.a = 3;
graph.b.fin = 5;

graph.fin = {};

// The costs table
const costs = {};
costs.a = 6;
costs.b = 2;
costs.fin = Infinity;

// the parents table
const parents = {};
parents.a = 'start';
parents.b = 'start';
parents.fin = null;

let processed = [];


const findLowestCostNode = (itCosts) => {
  let lowestCost = Infinity;
  let lowestCostNode = null;

  Object.keys(itCosts).forEach((node) => {
    const cost = itCosts[node];
    // If it's the lowest cost so far and hasn't been processed yet...
    if (cost < lowestCost && (processed.indexOf(node) === -1)) {
      // ... set it as the new lowest-cost node.
      lowestCost = cost;
      lowestCostNode = node;
    }
  });
  return lowestCostNode;
};

let node = findLowestCostNode(costs);

while (node !== null) {
  const cost = costs[node];
  // Go through all the neighbors of this node
  const neighbors = graph[node];
  Object.keys(neighbors).forEach((n) => {
    const newCost = cost + neighbors[n];
    // If it's cheaper to get to this neighbor by going through this node
    if (costs[n] > newCost) {
      // ... update the cost for this node
      costs[n] = newCost;
      // This node becomes the new parent for this neighbor.
      parents[n] = node;
    }
  });

  // Mark the node as processed
  processed = processed.concat(node);

  // Find the next node to process, and loop
  node = findLowestCostNode(costs);
}

console.log('Cost from the start to each node:');
console.log(costs); // { a: 5, b: 2, fin: 6 }
