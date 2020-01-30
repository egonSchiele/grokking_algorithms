/**
 * Searches recursively number from the list
 * @param {Array} list
 * @param {number} item Search item
 * @param {number} low Lower limit of search in the list
 * @param {number} high Highest limit of search in the list
 * @return {(number | null)} Number if the value is found or NULL otherwise
 */
const binarySearch = ( list, item, low = 0, high = list.length - 1 ) => {
    let mid = Math.floor((low + high) / 2);
    let guess = list[mid];

    if ( low > high ) return null;

    if ( guess === item ) {
        return mid;
    } else if ( guess > item ) {
        high = mid - 1;
        return binarySearch( list, item, low, high );
    } else {
        low = mid + 1;
        return binarySearch( list, item, low, high );
    }
};

/**
 * Creates the array that contains numbers 1...N
 * @param {number} n - number N
 * @return {Array}
 */
const createArr = ( n ) => Array.from({length: n}, (v, k) => k + 1);

const myList = createArr( 100 );

console.log( binarySearch( myList, 3 ) ); // 2
console.log( binarySearch( myList, -1 ) ); // null
