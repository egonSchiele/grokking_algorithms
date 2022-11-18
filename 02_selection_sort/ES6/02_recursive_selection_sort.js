/**
 * Finds the index of the element with the smallest value in the array
 * @param {Array} array Source array
 * @returns {number} Index of the element with the smallest value
 */
const findSmallestIndex = array => {
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

/**
 * Sort array by increment
 * @param {Array} array Source array
 * @returns {Array} New sorted array
 */
const selectionSort = array => {
  if (!array.length) return [];
  const copyArray = [...array];
  const smallest = copyArray.splice(findSmallestIndex(copyArray), 1);
  return smallest.concat(selectionSort(copyArray));
};

const sourceArray = [5, 3, 6, 2, 10];
const sourtedArray = selectionSort([5, 3, 6, 2, 10]);

console.log("Source array - ", sourceArray); // [5, 3, 6, 2, 10]
console.log("New sorted array - ", sourtedArray); // [2, 3, 5, 6, 10]
