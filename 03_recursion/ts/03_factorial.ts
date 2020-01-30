function fact(x: number): number {
    if (x === 1) {
        return x;
    }

    return x * fact(x - 1);
}

console.log(fact(5));