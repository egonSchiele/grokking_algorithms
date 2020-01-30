function findSmallestIndex<T>(array: T[]): number {
  let smallestIndex: number = 0;
  let smallestElement: T = array[smallestIndex];

  for (let i: number = 1; i < array.length; i++) {
    if (array[i] < smallestElement) {
      smallestElement = array[i];
      smallestIndex = i;
    }
  }

  return smallestIndex;
}

function selectionSort<T>(array: T[]): T[] {
  const sortedArray: T[] = [];
  const length = array.length;

  for (let i: number = 0; i < length; i++) {
    const smallestIndex: number = findSmallestIndex(array);
    sortedArray.push(array.splice(smallestIndex, 1)[0]);
  }

  return sortedArray;
}

console.log(selectionSort([5, 3, 6, 2, 10])); // [2, 3, 5, 6, 10]
