'use strict';
/**
 * Finds smallest element of an aray
 * @param {Array} arr array for searching
 * @return {number} index of the smallest element in array
 */
const findSmallest = (arr, min = arr[0], smallestIndex = 0, i = 1) => {
  if (arr.length <= i) return smallestIndex;
  const num = arr[i];
  if (num < min) {
    min = num;
    smallestIndex = i;
  }
  return findSmallest(arr, min, smallestIndex, i + 1);
};

/**
 * Sorts recursively an array of numbers
 * @param {Array} arr An array of numbers
 * @return {Array} New sorted array
 */
const selectionSort = (arr, res = []) => {
  if (arr.length > 0) {
    const smallestIndex = findSmallest(arr);
    const [curr] = arr.splice(smallestIndex, 1);
    res.push(curr);
    return selectionSort(arr, res);
  }
  return res;
};

const arr = [5, 3, 6, 2, 10];
console.log(selectionSort(arr));
