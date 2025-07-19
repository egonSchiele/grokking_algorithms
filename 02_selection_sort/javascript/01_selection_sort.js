'use strict';
/**
 * Finds the index of the element with the smallest value in the array
 * @param {Array} arr Source array
 * @returns {number} Index of the element with the smallest value
 */
const findSmallestIndex = (arr) => {
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
 * @param {Array} arr Source array
 * @returns {Array} New sorted array
 */
const selectionSort = (arr) => {
  const sortedArray = [];
  const copyArray = [...arr];

  for (let i = 0; i < arr.length; i++) {
    const smallestIndex = findSmallestIndex(copyArray);
    const [smallestElement] = copyArray.splice(smallestIndex, 1);

    sortedArray.push(smallestElement);
  }

  return sortedArray;
};

const sourceArray = [5, 3, 6, 2, 10];
const sortedArray = selectionSort(sourceArray);

console.log('Source array - ', sourceArray); // [5, 3, 6, 2, 10]
console.log('New sorted array - ', sortedArray); // [2, 3, 5, 6, 10]
