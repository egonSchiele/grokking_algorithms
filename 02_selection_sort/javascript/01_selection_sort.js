'use strict';
/**
 * Finds the index of the element with the smallest value in the array
 * @param {Array} array Source array
 * @returns {number} Index of the element with the smallest value
 */
const findSmallest = (arr) => {
  let min = arr[0];
  let index = 0;
  for (let i = 1; i < arr.length; i++) {
    const el = arr[i];
    if (el >= min) continue;
    min = el;
    index = i;
  }
  return index;
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
    const [curr] = arr.splice(smallestIndex, 1);
    result[i] = curr;
  }
  return result;
};

const sourceArray = [5, 3, 6, 2, 10];
const sourtedArray = selectionSort([5, 3, 6, 2, 10]);

console.log('Source array - ', sourceArray); // [5, 3, 6, 2, 10]
console.log('New sorted array - ', sourtedArray); // [2, 3, 5, 6, 10]
