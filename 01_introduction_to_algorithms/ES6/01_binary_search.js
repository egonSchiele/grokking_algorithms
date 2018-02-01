const binarySearch = (sortedList, item) => {
  let low = 0;
  let high = sortedList.length - 1;

  while (low <= high) {
    const middle = Math.floor((low + high) / 2);
    const guess = sortedList[middle];

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
};

const myList = [1, 3, 5, 7, 9];

console.log(binarySearch(myList, 3)); // 1
console.log(binarySearch(myList, -1)); // null
