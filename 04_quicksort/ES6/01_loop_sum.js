/**
 * Sums values in the array by loop "for"
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */
const sumLoop = array => {
  let result = 0;
  for (let i = 0; i < array.length; i++) {
    result += array[i];
  }
  return result;
};

console.log(sumLoop([1, 2, 3, 4])); // 10
