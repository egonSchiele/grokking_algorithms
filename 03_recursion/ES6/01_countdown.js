const countdown = (i) => {
  console.log(i);
  // base case
  if (i <= 0) {
    return null;
  }
  countdown(i - 1);
  return null;
};

countdown(5);
