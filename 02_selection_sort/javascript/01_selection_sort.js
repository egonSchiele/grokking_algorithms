'use strict';
/**
 * Finds the index of the element with the smallest value in the array
 * @param {Array} array Source array
 * @returns {number} Index of the element with the smallest value
 */
const findSmallest = (arr) => {
  let [smallestElement] = arr;
  let smallestIndex = 0;
  for (let i = 1; i < arr.length; i++) {
    const el = arr[i];
    if (el >= smallestElement) continue;
    smallestElement = el;
    smallestIndex = i;
  }
  return smallestIndex;
};

/**
 * Sort array by increment
 * @param {Array} array Source array
 * @returns {Array} New sorted array
 */
const selectionSort = (arr) => {
  const size = arr.length;
  const result = new Array(size).fill(0);
  for (let i = 0; i < size; i++) {
    const smallestIndex = findSmallest(arr);
    const [smallestElement] = arr.splice(smallestIndex, 1);
    result[i] = smallestElement;
  }
  return result;
};

const sourceArray = [5, 3, 6, 2, 10];
const sortedArray = selectionSort(sourceArray);

console.log('Source array - ', sourceArray); // [5, 3, 6, 2, 10]
console.log('New sorted array - ', sourtedArray); // [2, 3, 5, 6, 10]