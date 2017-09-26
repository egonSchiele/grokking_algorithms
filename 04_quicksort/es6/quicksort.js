const quickSort = (array) => {
	if (array.length < 2) {
		return array;
	}
	if (array.length === 2) {
		// if first elem more than second will swap them and return it like new array.
		return array[0] < array[1] ? array : [array[1], array[0]];
	}

	const pivot = array[0]
	const itemsAreLessPivotSubArray = array.filter(item => item < pivot);
	const itemsAreMoreThenPivotSubArray = array.filter(item => item > pivot);

	return [...quickSort(itemsAreLessPivotSubArray), pivot, ...quickSort(itemsAreMoreThenPivotSubArray)];
};

module.exports = quickSort;
console.log(quicksort([10, 5, 2, 3])); // [2, 3, 5, 10]
