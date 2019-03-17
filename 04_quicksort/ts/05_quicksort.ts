function quicksort(arr: number[]): number[] {
    if (arr.length < 2) {
        return arr;
    }

    const pivot = arr[0];
    const less = arr.slice(1).filter(el => el <= pivot);
    const greater = arr.slice(1).filter(el => el > pivot);

    return quicksort(less).concat(pivot, quicksort(greater));
}

console.log(quicksort([10, 5, 2, 3]));
