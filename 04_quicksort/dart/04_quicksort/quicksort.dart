void main(List<String> args) {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(quickSort([0, 21, 3, 1, 6, 5, 0, 81, 2, 14, 56, 32, 1, 9, 8]));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

List<int> quickSort(List<int> toOrder) {
  if (toOrder.length < 2) {
    return toOrder;
  }
  final int mid = toOrder.length ~/ 2;

  final int pivot = toOrder[mid];
  toOrder.removeAt(mid);
  final List<int> lowers =
      List.from(toOrder.where((element) => element <= pivot));
  final List<int> highers =
      List.from(toOrder.where((element) => element > pivot));
  return quickSort(lowers) + [pivot] + quickSort(highers);
}
