import { Graph, GraphIterable } from "./iterable_graph";

const dijkstraGraph: Graph<Graph<number>> = {
  start: { a: 6, b: 2 },
  a: { fin: 1 },
  b: { a: 3, fin: 5 },
  fin: {},
};

const costs: Graph<number> = {
  a: 6,
  b: 2,
  fin: Infinity,
};

const parents: Graph<string | null> = {
  a: "start",
  b: "start",
  fin: null,
};

let processed: string[] = [];

const findLowestCostNode = (costs: Graph<number>): string | null => {
  let lowestCost = Infinity;
  let lowestCostNode: string | null = null;

  const iterableGraph = new GraphIterable(costs);

  for (const node of iterableGraph) {
    const cost = costs[node];
    if (cost < lowestCost && !processed.includes(node)) {
      lowestCost = cost;
      lowestCostNode = node;
    }
  }
  return lowestCostNode;
};

let node = findLowestCostNode(costs);

while (node !== null) {
  const cost = costs[node];

  const neighbors = dijkstraGraph[node];
  Object.keys(neighbors).forEach((n: string) => {
    const newCost = cost + neighbors[n];
    if (costs[n] > newCost) {
      costs[n] = newCost;
      parents[n] = node;
    }
  });

  processed.push(node);
  node = findLowestCostNode(costs);
}

console.log("Cost from the start to each node:");
console.log(costs); // { a: 5, b: 2, fin: 6 }
