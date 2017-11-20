// Finds the smallest value in an array
const findSmallest = (arr) => {
  let smallest = arr[0]; // Stores the smallest value
  let smallestIndex = 0; // Stores the index of the smallest value
  for (let i = 1; i < arr.length; i += 1) {
    if (arr[i] < smallest) {
      smallest = arr[i];
      smallestIndex = i;
    }
  }
  return smallestIndex;
};

// Sort array
const selectionSort = (arr) => {
  const newArr = [];
  const length = arr.length;
  for (let i = 0; i < length; i += 1) {
    // Finds the smallest element in the array and adds it to the new array
    const smallest = findSmallest(arr);
    newArr.push(arr.splice(smallest, 1)[0]);
  }
  return newArr;
};

console.log(selectionSort([5, 3, 6, 2, 10])); // [2, 3, 5, 6, 10]
