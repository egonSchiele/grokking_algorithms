import 'dart:collection';

void main(List<String> args) {
  final graph = <String, List<String>>{};
  graph.addAll(
    <String, List<String>>{
      'you': ['alice', 'bob', 'claire'],
      'bob': ['anuj', 'peggy'],
      'alice': ['peggy'],
      'claire': ['thom', 'jonny'],
      'anuj': [],
      'peggy': [],
      'thom': [],
      'jonny': [],
    },
  );

  search(graph, 'you');
}

bool search(Map<String, List<String>> graph, String name) {
  final searchQueue = Queue()..addAll(graph[name] ?? []);
  final searched = List<String>.empty(growable: true);

  while (searchQueue.isNotEmpty) {
    final String person = searchQueue.removeFirst();
    if (searched.contains(person) == false) {
      if (_personIsSeller(person)) {
        print('$person is a Mango seller!');
        return true;
      } else {
        searchQueue.addAll(graph[person] ?? []);
        searched.add(person);
      }
    }
  }
  return false;
}

bool _personIsSeller(String name) {
  return name.endsWith('m');
}
