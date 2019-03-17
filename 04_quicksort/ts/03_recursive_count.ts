function count<T>(list: T[]): number {
    if (list.length === 1) {
        return 1;
    }

    return 1 + count(list.slice(1));
}

console.log(count([1, 2, 3]));