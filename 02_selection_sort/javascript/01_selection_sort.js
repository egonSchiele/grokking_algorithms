'use strict';

// Finds the smallest value in an array
function findSmallest(arr) {
  let smallest = arr[0]; // Stores the smallest value
  let smallest_index = 0; // Stores the index of the smallest value
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] < smallest) {
      smallest = arr[i];
      smallest_index = i;
    }
  }
  return smallest_index;
}

// Sort array
function selectionSort(arr) {
  const newArr = [];
  for (let i = 0, length = arr.length; i < length; i++) {
    // Finds the smallest element in the array and adds it to the new array
    let smallest = findSmallest(arr);
    newArr.push(arr.splice(smallest, 1)[0]);
  }
  return newArr;
}

console.log(selectionSort([5, 3, 6, 2, 10])); // [2, 3, 5, 6, 10]
