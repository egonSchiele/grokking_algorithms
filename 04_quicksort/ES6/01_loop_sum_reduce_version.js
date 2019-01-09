/**
 * Sums values in array by function "reduce"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
const sumReduce = ( arr ) => {
    let result = newArr.reduce( ( curr, prev ) => {
        return curr + prev;
    } );

    return result;
};

let arr = [1, 2, 3, 4];

console.log( sumReduce( arr ) ); // 10
