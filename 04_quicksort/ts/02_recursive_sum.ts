function sum(arr: number[]): number {
    if (arr.length === 1) {
        return arr[0];
    }

    return arr[0] + sum(arr.slice(1));
}

console.log(sum([1, 2, 3, 4]));