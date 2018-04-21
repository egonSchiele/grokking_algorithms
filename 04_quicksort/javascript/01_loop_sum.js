/**
 * Sums values in array by loop "for"
 * @param {Array} arr Array of numbers
 * @return {number} Sum of the numbers
 */
function sumLoop( arr ) {
    var newArr = Array.prototype.slice.call( arr );
    var result = 0;

    for ( var i = 0; i < newArr.length; i++ ) {
        result += newArr[i];
    }

    return result;
}

var arr = [1, 2, 3, 4];

console.log( sumLoop( arr ) ); // 10
