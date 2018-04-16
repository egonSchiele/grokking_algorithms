/**
 * Searches recursively number from the list
 * @param {Array} list
 * @param {number} item Search item
 * @param {number} low Lower limit of search in the list
 * @param {number} high Highest limit of search in the list
 * @param {number} arrLength Length of the list
 * @return {(number | null)} Number if the value is found or NULL otherwise
 */
const binarySearch = ( list, item, low, high, arrLength ) => {
    while ( low <= high ) {
        let mid = Math.floor((low + high) / 2);
        let guess = list[mid];

        if ( guess === item ) {
            return mid;
        } else if ( guess > item ) {
            high = mid - 1;
            list = list.slice( 0, mid );
            return binarySearch( list, item, low, high );
        } else {
            low = mid + 1;
            list = list.slice( low, arrLength );
            return binarySearch( list, item, low, high );
        }
    }

    return null;
};

/**
 * Creates the array that contains numbers 1...N
 * @param {number} n - number N
 * @return {Array}
 */
const createArr = ( n ) => Array.from({length: n}, (v, k) => k + 1);

const myList = createArr( 100 );
const arrLength = myList.length;
let low = 0;
let high = arrLength - 1;

console.log( '3 ' + binarySearch( myList, 3, low, high, arrLength ) ); // 2
console.log( '-1 ' + binarySearch( myList, -1, low, high, arrLength ) ); // null
