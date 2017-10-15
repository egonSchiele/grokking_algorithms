const quickSort = (array) => {
  if (array.length < 2) {
    return array;
  }
  const pivot = array[0];
  const itemsAreLessPivot = array.slice(1).filter(item => item <= pivot);
  const itemsAreMorePivot = array.slice(1).filter(item => item > pivot);
  return [...quickSort(itemsAreLessPivot), pivot, ...quickSort(itemsAreMorePivot)];
};

quicksort([10, 5, 2, 3])); // [2, 3, 5, 10]
