/**
 * Sums values in array by function "reduce"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
function sumReduce( arr ) {
    var result = newArr.reduce( ( curr, prev ) => {
        return curr + prev;
    } );

    return result;
}

var arr = [1, 2, 3, 4];

console.log( sumReduce( arr ) ); // 10
