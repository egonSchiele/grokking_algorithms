/**
 * Sums values in array recursively
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
function sumRecursive(arr) {
  if (arr.length == 1) {
    return arr[0];
  }
  return arr[0] + sumRecursive(arr.slice(1));
}

console.log(sumRecursive([1, 2, 3, 4])); // 10
