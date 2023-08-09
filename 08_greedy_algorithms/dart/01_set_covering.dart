void main(List<String> args) {
  final fruits = {'avocado', 'tomato', 'banana'};
  final vegetables = {'beet', 'carrot', 'tomato'};

  print(fruits.union(vegetables));
  print(fruits.intersection(vegetables));
  print(fruits.difference(vegetables));
  print(vegetables.difference(fruits));

  final coverStates = {
    'mt',
    'wa',
    'or',
    'id',
    'nv',
    'ut',
    'ca',
    'az',
  };

  final stations = <String, Set<String>>{}..addAll(
      {
        'kone': {'id', 'nv', 'uy'},
        'ktwo': {'wa', 'id', 'mt'},
        'kthree': {'or', 'nv', 'ca'},
        'kfour': {'nv', 'ut'},
        'kfive': {'ca', 'az'},
      },
    );

  final finalStations = stationSet(coverStates, stations);
  print(finalStations);
}

Set<String> stationSet(
    Set<String> coverStates, Map<String, Set<String>> stations) {
  final finalStations = <String>{};
  while (coverStates.isNotEmpty) {
    String? bestStation;
    Set<String> coveredStates = {};
    for (String station in stations.keys) {
      final covered = coverStates.intersection(stations[station] ?? {});
      if (covered.length > coveredStates.length) {
        bestStation = station;
        coveredStates = covered;
      }
    }
    coverStates.removeWhere((element) => coveredStates.contains(element));
    finalStations.add(bestStation!);
  }
  return finalStations;
}
