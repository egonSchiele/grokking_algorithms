'use strict';
// Selection Sort - O(n^2)
// Parameter:
//  1. random array

// 1. Finds the smallest value in an array
function findSmallestIndex(array) {
  var smallestElement = array[0]; // Stores the smallest value
  var smallestIndex = 0; // Stores the index of the smallest value

  for (var i = 0; i < array.length; i++) {
    if (array[i] < smallestElement) {
      smallestElement = array[i];
      smallestIndex = i;
    }
  }

  return smallestIndex;
}

// 2. Sort the array
function selectionSort(array) {
  var sortedArray = [];
  var length = array.length;

  for (var i = 0; i < length; i++) {
    // Finds the smallest element in the array 
    var smallestIndex = findSmallestIndex(array);
    // Adds the smallest element to new array
    sortedArray.push(array.splice(smallestIndex, 1)[0]);
  }

  return sortedArray;
}

console.log(selectionSort([5, 3, 6, 2, 10])); // [2, 3, 5, 6, 10]
