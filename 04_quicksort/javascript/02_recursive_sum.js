"use strict";

/**
 * Sums values in the array by recursive
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */
const sumRecursive = (arr = []) => {
  if (!arr.length) return 0;
  const num = arr.shift();
  return num + sumRecursive(arr);
};


console.log(sumRecursive([1, 2, 3, 4])); // 10
