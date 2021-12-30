"use strict";

/**
 * Calculate the largest number
 * This solution only works for arrays longer than one
 * @param {Array} array Array of numbers
 * @returns {number} The argest number
 */
function max(array) {
  if (array.length === 2) return array[0] > array[1] ? array[0] : array[1];
  let sub_max = max(array.slice(1));
  return array[0] > sub_max ? array[0] : sub_max;
}

/**
 * Calculate the largest number
 * This solution works for arrays of any length
 * @param {Array} array Array of numbers
 * @param {number} max Maximum value
 * @returns {number} The argest number
 */
function alternativeSolutionMax(array, max = 0) {
  return array.length === 0
    ? max
    : alternativeSolutionMax(array.slice(1), array[0] > max ? array[0] : max);
}

console.log(max([1, 5, 10, 25, 16, 1])); // 25
console.log(alternativeSolutionMax([1, 5, 10, 25, 16, 1])); // 25

module.exports = {
  max
};