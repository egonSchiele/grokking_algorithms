/**
 * Sums values in array by loop "for"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
const sumLoop = arr => {
  let result = 0;
  for (let i = 0; i < arr.length; i++) {
    result += arr[i];
  }
  return result;
};

console.log(sumLoop([1, 2, 3, 4])); // 10
