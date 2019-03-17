function sum(arr: number[]): number {
    let total = 0;
    arr.forEach(number => {
        total += number;
    });

    return total;
}

console.log(sum([1, 2, 3, 4]));