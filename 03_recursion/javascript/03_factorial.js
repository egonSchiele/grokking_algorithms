function fact(x) {
  if (x === 1) {
    return 1;
  }
  return x * fact(x - 1);
}

console.log(fact(5));
