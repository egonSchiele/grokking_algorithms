/**
 * Countdown
 * @param {number} i Number
 */
function countdown(i) {
  console.log(i);
  // base case
  if (i <= 0) return;
  countdown(i - 1);
}

countdown(5);
