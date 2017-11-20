if (word_a[i] === word_b[j]) {
  // The letters match
  cell[i][j] = cell[i - 1][j - 1] + 1;
} else {
  // The letters don't match
  cell[i][j] = Math.max(cell[i - 1][j], cell[i][j - 1]);
}
