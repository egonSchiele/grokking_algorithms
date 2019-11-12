function createMatrix(rows, cols) {
  const matrix = new Array(rows);

  for (let i = 0; i < matrix.length; i++) {
    matrix[i] = new Array(cols).fill(0);
  }

  return matrix;
}

function substring(a, b) {
  const cell = createMatrix(a.length + 1, b.length + 1);
  let lcs = 0;
  let lastSubIndex = 0;

  for (let i = 1; i <= a.length; i++) {
    for (let j = 1; j <= b.length; j++) {
      if (a[i - 1] === b[j - 1]) {
        cell[i][j] = cell[i - 1][j - 1] + 1;

        if (cell[i][j] > lcs) {
          lcs = cell[i][j];
          lastSubIndex = i;
        }
      } else {
        cell[i][j] = 0;
      }
    }
  }

  return a.slice(lastSubIndex - lcs, lastSubIndex);
}

substring("vista", "hish"); // "is"
substring("fish", "hish"); // "ish"

function subsequence(a, b) {
  const cell = createMatrix(a.length + 1, b.length + 1);

  for (let i = 1; i <= a.length; i++) {
    for (let j = 1; j <= b.length; j++) {
      if (a[i - 1] === b[j - 1]) {
        cell[i][j] = cell[i - 1][j - 1] + 1;
      } else {
        cell[i][j] = Math.max(cell[i - 1][j], cell[i][j - 1]);
      }
    }
  }

  return cell[a.length][b.length];
}

subsequence("fish", "fosh"); // 3
subsequence("fort", "fosh"); // 2
