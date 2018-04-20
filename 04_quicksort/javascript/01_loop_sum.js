const arr = [1, 2, 3, 4];

/**
 * Sums values in array by loop "for"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
const sumLoop = ( arr ) => {
    const newArr = Array.prototype.slice.call( arr );
    let result = 0;

    for ( let i = 0; i < newArr.length; i++ ) {
        result += newArr[i];
    }

    return result;
};

/**
 * Sums values in array by function "reduce"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
const sumReduce = ( arr ) => {
    const newArr = Array.prototype.slice.call( arr );
    let result = newArr.reduce( ( curr, prev ) => {
        return curr + prev;
    } );

    return result;
};

console.log( sumLoop( arr ) ); // 10
console.log( sumReduce( arr ) ); // 10
