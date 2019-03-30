function countdown(i: number): null {
    console.log(i);

    if (i <= 0) {
        return null;
    }

    countdown(i-1);

    return null;
}

console.log(countdown(5));
