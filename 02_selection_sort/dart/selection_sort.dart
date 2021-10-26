main() {
  print(selectionSort([5, 3, 6, 2, 10]));
}

List<int> selectionSort(List<int> arr) {
  final List<int> newArr = List.empty(growable: true);
  final arrLength = arr.length;

  for (int i = 0; i < arrLength; i++) {
    final smallest = findSmallest(arr);
    newArr.add(arr.removeAt(smallest));
  }

  return newArr;
}

int findSmallest(List<int> arr) {
  int smallest = arr[0];
  int smallestIndex = 0;

  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < smallest) {
      smallest = arr[i];
      smallestIndex = i;
    }
  }

  return smallestIndex;
}
