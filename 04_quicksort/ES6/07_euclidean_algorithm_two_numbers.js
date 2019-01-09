/**
 * Recursive function of Euclidean algorithm
 *
 * @param {number} a first number
 * @param {number} b second number (base case)
 *
 * @return {number} GCD (greatest common divisor)
 */
let getGCD = ( a, b ) => {
    if ( !b ) {
        return a;
    }
    return getGCD( b, a % b );
};

const a = 1680;
const b = 640;

console.log( getGCD( a, b ) ); // 80
