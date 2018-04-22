/**
 * Finds smallest/greatest element of an array
 *
 * @param {Array} arr array for searching
 * @param {boolean} mod TRUE for smallest or FALSE for greatest value
 *
 * @return {number} index of smallest/greatest element in array
 */
const find = ( arr, mod ) => {
    let currentValue = arr[0];
    let currentValueIndex = 0;
    let arrLen = arr.length;

    for ( let i = 0; i < arrLen; i++ ) {
        if ( mod ) {
            // Find min
            if ( arr[i] < currentValue ) {
                currentValue = arr[i];
                currentValueIndex = i;
            }
        } else {
            // Find max
            if ( arr[i] > currentValue ) {
                currentValue = arr[i];
                currentValueIndex = i;
            }
        }
    }

    return currentValueIndex;
};

/**
 * Sorts an array of numbers
 *
 * @param {Array} arr An array of numbers
 * @param {boolean} mod TRUE for ascending order or FALSE for descending order
 *
 * @return {Array} New sorted array
 */
const selectionSort = ( arr, mod ) => {
    let arrCopy = arr.slice( arr );
    let arrNew = [];
    let arrLen = arrCopy.length;

    for ( let i = 0; i < arrLen; i++ ) {
        currentIndex = find( arrCopy, mod );
        arrNew.push( arrCopy.splice( currentIndex, 1 )[0] );
    }

    return arrNew;
};

let arr = [5, 3, 6, 2, 10];

console.log( selectionSort( arr, true ) ); // [ 2, 3, 5, 6, 10 ]
console.log( selectionSort( arr, false ) ); // [ 10, 6, 5, 3, 2 ]
