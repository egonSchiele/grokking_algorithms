const fact = x => x === 1 ? 1 : x * fact(--x);

console.log(fact(5));
