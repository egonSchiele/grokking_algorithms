/**
 * Recursive function of Euclidean algorithm for two numbers
 * @param {number} a first number
 * @param {number} b second number (base case)
 * @returns {number} GCD (greatest common divisor)
 */
const gcdOfTwo = (a, b) => (!b ? a : gcdOfTwo(b, a % b));

/**
 * Recursive function of Euclidean algorithm for set of the numbers
 * @param {Array} set Set of the numbers
 * @returns {number} GCD (greatest common divisor)
 */
const gcdOfSet = set => {
  let result = set[0];
  let newArr = set.slice(1);

  newArr.map(el => {
    result = gcdOfTwo(result, el);
  });

  return result;
};

const set = [1680, 640, 3360, 160, 240, 168000];

console.log(gcdOfSet(set)); // 80
