/**
 * Sums values in the array by recursive
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */
const sum = array => (array.length === 0 ? 0 : array[0] + sum(array.slice(1)));

console.log(sum([1, 2, 3, 4])); // 10
