/**
 * Sums values in array by function "reduce"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
function sumReduce(arr) {
  return arr.reduce(function(curr, prev) {
    return curr + prev;
  });
}

console.log(sumReduce([1, 2, 3, 4])); // 10
