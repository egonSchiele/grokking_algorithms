"use strict";

/**
 * Count the number of elements in the array
 * @param {Array} array Array of numbers
 * @returns {number} The number of elements in the array
 */
function count(array) {
  if (array.length === 0) return 0;
  return 1 + count(array.slice(1));
}

console.log(count([0, 1, 2, 3, 4, 5])); // 6
