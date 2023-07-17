void main(List<String> args) {
  final Stopwatch stopwatch = Stopwatch()..start();
  print(recursiveFactorial(5));
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}

int recursiveFactorial(int value) {
  if (value == 1) {
    return 1;
  }
  return value * recursiveFactorial(value - 1);
}
