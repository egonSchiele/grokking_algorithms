"use strict";

/**
 * Sums values in the array by function "reduce"
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */
function sumReduce(array) {
  return array.reduce(function(prev, cur) {
    return prev + cur;
  });
}

console.log(sumReduce([1, 2, 3, 4])); // 10
