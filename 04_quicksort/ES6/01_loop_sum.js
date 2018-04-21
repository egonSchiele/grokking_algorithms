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

let arr = [1, 2, 3, 4];

console.log( sumLoop( arr ) ); // 10
