'use strict';

function binarySearch(sortedList, item) {
  var low = 0;
  var high = sortedList.length - 1;
  
  while (low <= high) {
    var middle = Math.floor((low + high) / 2);
    var guess = sortedList[middle];

    if (guess === item) {
      return middle;
    }
    if (guess > item) {
      high = middle - 1;
    } else {
      low = middle + 1;
    }
  }
  
  return null;
}

var my_list = [1, 3, 5, 7, 9];

console.log(binarySearch(my_list, 3)); // 1
console.log(binarySearch(my_list, -1)); // null
