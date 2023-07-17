void main(List<String> args) {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(recursiveSum([0, 21, 3, 1, 6, 5, 81, 2, 14, 56, 32, 1, 9, 8]));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

int recursiveSum(List<int> array) {
  if (array.isEmpty) {
    return 0;
  }
  final List<int> newArray = [...array]..removeAt(0);
  return array[0] + recursiveSum(newArray);
}
