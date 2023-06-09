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
 * This solution works for arrays of any length and returns the smallest possible number for empty arrays
 * @param {Array} array Array of numbers
 * @param {number} max Maximum value
 * @returns {number} The largest number
 */
function alternativeSolutionMax(array, max = Number.MIN_VALUE) {
  return array.length === 0
    ? max
    : alternativeSolutionMax(array.slice(1), array[0] > max ? array[0] : max);
}

/**
 * Calculate the largest number
 * This solution works for arrays of any length and returns null for empty arrays (can be modified to return Error or anything you need)
 * The third argument helps us to distinguish any last run from the first run but with an empty array (in both cases arr.length == 0)
 * @param {Array} array Array of numbers
 * @param {number} max Maximum value
 * @param {boolean} isFirstRun Flag used to mark the first run of the function
 * @returns {number} The largest number
 */
function alternativeSolutionMaxFixed(array, max = Number.MIN_VALUE, isFirstRun = true) {
  if (isFirstRun && array.length == 0) return null;
  return array.length === 0
    ? max
    : alternativeSolutionMaxFixed(array.slice(1), array[0] > max ? array[0] : max, false);
}

console.log(max([1, 5, 10, 25, 16, 1])); // 25
console.log(alternativeSolutionMax([1, 5, 10, 25, 16, 1])); // 25
console.log(alternativeSolutionMaxFixed([1, 5, 10, 25, 16, 1])); // 25

console.log(max([])); // RangeError: Maximum call stack size exceeded
console.log(alternativeSolutionMax([])); // Number.MIN_VALUE
console.log(alternativeSolutionMaxFixed([])); // null
