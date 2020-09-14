/**
 * Calculate the largest number
 * This solution only works for arrays longer than one
 * @param {Array} array Array of numbers
 * @returns {number} The argest number
 */
const max = array => {
  if (array.length === 2) return array[0] > array[1] ? array[0] : array[1];
  const subMax = max(array.slice(1));
  return array[0] > subMax ? array[0] : subMax;
};

/**
 * Calculate the largest number
 * This solution works for arrays of any length
 * @param {Array} array Array of numbers
 * @param {number} max Maximum value
 * @returns {number} The argest number
 */
const alternativeSolutionMax = (array, max = 0) =>
  array.length === 0
    ? max
    : alternativeSolutionMax(array.slice(1), array[0] > max ? array[0] : max);

console.log(max([1, 5, 10, 25, 16, 1])); // 25
console.log(alternativeSolutionMax([1, 5, 10, 25, 16, 1])); // 25
