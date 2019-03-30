/**
 * Sums values in array by function "reduce"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
const sumReduce = arr => arr.reduce((curr, prev) => curr + prev);

console.log(sumReduce([1, 2, 3, 4])); // 10
