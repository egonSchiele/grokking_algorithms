/**
 * Sums values in array by loop "for"
 * @param {Array} arr Array of numbers
 * @return {total} Sum of the numbers
 */

function sum(arr) {
    let total = 0;
    for (let i = 0; i < arr.length; i++) {
        total += arr[i];
    }
    return total;
}

console.log(sum([1, 2, 3, 4])); // 10
