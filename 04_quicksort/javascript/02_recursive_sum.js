"use strict";

/**
 * Sums values in the array by recursive
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */
function sumRecursive(array) {
  if (array.length == 1) return array[0];
  return array[0] + sumRecursive(array.slice(1));
}

console.log(sumRecursive([1, 2, 3, 4])); // 10

module.exports = {
  sumRecursive
};
