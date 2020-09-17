/**
 * Searches recursively number from the list
 * @param {Array} list Source array
 * @param {number} item Search item
 * @param {number} low Lower limit of search in the list
 * @param {number} high Highest limit of search in the list
 * @returns {(number|null)} Number if the value is found or NULL otherwise
 */
const binarySearch = (list, item, low = 0, high = list.length - 1) => {
  if (low > high) return null;

  const mid = Math.floor((low + high) / 2);
  const guess = list[mid];

  if (guess === item) {
    return mid;
  } else if (guess > item) {
    return binarySearch(list, item, low, mid - 1);
  } else {
    return binarySearch(list, item, mid + 1, high);
  }
};

/**
 * Creates the array that contains numbers 1...N
 * @param {number} n - number N
 * @returns {Array} Array that contains numbers 1...N
 */
const createArr = n => Array.from({ length: n }, (v, k) => k + 1);

const myList = createArr(100);

console.log(binarySearch(myList, 3)); // 2
console.log(binarySearch(myList, -1)); // null
