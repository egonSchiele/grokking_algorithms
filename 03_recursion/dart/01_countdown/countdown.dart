main() {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(recursiveCount([0, 21, 3, 1, 6, 5, 81, 2, 14, 56, 32, 1, 9, 8]));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

int recursiveCount(List array) {
  if (array.isEmpty) {
    return 0;
  }
  final List newArray = [...array]..removeAt(0);
  return 1 + recursiveCount(newArray);
}
