void main(List<String> args) {
  final graph = <String, Map<String, double>>{}..addAll(
      {
        'start': {
          'a': 6,
          'b': 2,
        },
        'a': {
          'end': 1,
        },
        'b': {
          'a': 3,
          'end': 5,
        },
        'end': {},
      },
    );

  final costs = <String, double>{
    'a': 6,
    'b': 2,
    'end': double.infinity,
  };

  final parents = <String, String?>{
    'a': 'start',
    'b': 'start',
    'end': null,
  };

  djikstra(graph, costs, parents);
  print(graph);
  print(costs);
  print(parents);
}

void djikstra(
  Map<String, Map<String, double>> graph,
  Map<String, double> costs,
  Map<String, String?> parents,
) {
  final processeds = <String>[];
  String? node = findTheCheapestOne(costs, processeds);

  while (node != null) {
    final cost = costs[node];
    final neighbors = graph[node];
    for (String neighbor in neighbors!.keys) {
      final double newCost = cost! + neighbors[neighbor]!;
      if (costs[neighbor]! > newCost) {
        costs[neighbor] = newCost;
        parents[neighbor] = node;
      }
    }
    processeds.add(node);
    node = findTheCheapestOne(costs, processeds);
  }
}

String? findTheCheapestOne(Map<String, double> costs, List<String> processed) {
  double cheapestCost = double.infinity;
  String? cheapestNode;

  for (String node in costs.keys) {
    final double cost = costs[node]!;
    if (cost < cheapestCost && !processed.contains(node)) {
      cheapestCost = cost;
      cheapestNode = node;
    }
  }
  return cheapestNode;
}
