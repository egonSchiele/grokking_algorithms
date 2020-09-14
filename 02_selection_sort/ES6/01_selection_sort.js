// Selection Sort - O(n^2)
// Parameter:
//  1. random array

// 1. Finds the smallest value in an array
const findSmallestIndex = (array) => {
  let smallestElement = array[0]; // Stores the smallest value
  let smallestIndex = 0; // Stores the index of the smallest value

  for (let i = 1; i < array.length; i++) {
    if (array[i] < smallestElement) {
      smallestElement = array[i];
      smallestIndex = i;
    }
  }

  return smallestIndex;
};

// 2. Sorts the array
const selectionSort = (array) => {
  //Copy values from array, because it must be immutable. Without that after call selectionSort origin array will become empty.
  const sortingArray = [...array];
  const sortedArray = [];
  const length = sortingArray.length;

  for (let i = 0; i < length; i++) {
    // Finds the smallest element in the given array 
    const smallestIndex = findSmallestIndex(sortingArray);
    // Adds the smallest element to new array
    sortedArray.push(sortingArray.splice(smallestIndex, 1)[0]);
  }

  return sortedArray;
};

const array = [5, 3, 6, 2, 10];
console.log(selectionSort(array)); // [2, 3, 5, 6, 10]
console.log(array); // [5, 3, 6, 2, 10]
