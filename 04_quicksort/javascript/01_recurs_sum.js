/**
 * Sums values in the array by recursion
 * @param {Array} array Array of numbers
 * @returns {number} Sum of the numbers
 */

window.sum_recurs = (array) => {
	if (arr.length === 0) return 0;

	return arr[0] + sum_recurs(arr.slice(1));
}

console.log('recursion sum = ', sum_recurs([1, 2, 4]));
