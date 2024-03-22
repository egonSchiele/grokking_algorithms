'use strict';
/**
 * Finds smallest element of an aray
 * @param {Array} arr array for searching
 * @return {number} index of the smallest element in array
 */
const findSmallest = (arr, smallest = arr[0], smallestIndex = 0, i = 1) => {
  if (arr.length <= i) return smallestIndex;
  const curr = arr[i];
  if (curr < smallest) {
    smallest = curr;
    smallestIndex = i;
  }
  return findSmallest(arr, smallest, smallestIndex, i + 1);
};

/**
 * Sorts recursively an array of numbers
 * @param {Array} arr An array of numbers
 * @return {Array} New sorted array
 */
const selectionSort = (arr, result = []) => {
  if (arr.length > 0) {
    const smallestIndex = findSmallest(arr);
    const [smallest] = arr.splice(smallestIndex, 1);
    result.push(smallest);
    return selectionSort(arr, result);
  }
  return result;
};

const arr = [5, 3, 6, 2, 10];
console.log(selectionSort(arr));
