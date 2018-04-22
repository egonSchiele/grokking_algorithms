/**
 * Recursive function of Euclidean algorithm for two numbers
 *
 * @param {number} a first number
 * @param {number} b second number (base case)
 *
 * @return {number} GCD (greatest common divisor)
 */
function gcdOfTwo( a, b ) {
    if ( !b ) {
        return a;
    }
    return gcdOfTwo( b, a % b );
}

/**
 * Recursive function of Euclidean algorithm for set of the numbers
 *
 * @param {Array} set Set of the numbers
 *
 * @return {number} GCD (greatest common divisor)
 */
function gcdOfSet( set ){
    let result = set[0];
    let newArr = Array.prototype.slice.call( set, 1 );

    newArr.map( ( el ) => {
        result = gcdOfTwo( result, el );
    } );

    return result;
}

const set = [1680, 640, 3360, 160, 240, 168000];

console.log( gcdOfSet( set ) ); // 80
