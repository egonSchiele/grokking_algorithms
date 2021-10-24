void main() {
  final myList = [1, 3, 5, 7, 9];
  print(binarySearch(myList, 3));
  print(binarySearch(myList, -1));
}

int? binarySearch(List<int> list, int item) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    final mid = (low + high) ~/ 2;
    final guess = list[mid];

    if (guess == item) {
      return mid;
    }

    if (guess > item) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
}
