/**
 * Calculate the largest number
 * This solution only works for arrays longer than one
 * @param {Array} array Array of numbers
 * @returns {number} The largest number
 */
const max = (array) => {
  if (array.length === 0) return 0;
  if (array.length === 1) {
    return array[0];
  }
  const subMax = max(array.slice(1));
  return array[0] > subMax ? array[0] : subMax;
};

console.log(max([1, 5, 10, 25, 16, 1])); // 25
