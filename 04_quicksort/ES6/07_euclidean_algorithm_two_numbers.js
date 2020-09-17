/**
 * Recursive function of Euclidean algorithm
 * @param {number} a first number
 * @param {number} b second number (base case)
 * @returns {number} GCD (greatest common divisor)
 */
const getGCD = (a, b) => (!b ? a : getGCD(b, a % b));

console.log(getGCD(1680, 640)); // 80
