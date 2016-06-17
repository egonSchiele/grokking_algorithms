'use strict';

function quicksort(array) {
  if (array.length < 2) {
    // base case, arrays with 0 or 1 element are already "sorted"
    return array;
  } else {
   // recursive case
   let pivot = array[0];
   // sub-array of all the elements less than the pivot
   let less = array.slice(1).filter(function(el) { return el <= pivot; });
   // sub-array of all the elements greater than the pivot
   let greater = array.slice(1).filter(function(el) { return el > pivot; });
   return quicksort(less).concat([pivot], quicksort(greater));
  }
}

console.log(quicksort([10, 5, 2, 3])); // [2, 3, 5, 10]
