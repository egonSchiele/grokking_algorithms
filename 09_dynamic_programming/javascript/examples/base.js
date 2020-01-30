module.exports = function initialize_matrix(rows, cols) {
  let matrix = [];
  for (let i = 0; i < rows.length; i++) {
    matrix.push(Array(cols.length).fill(0));
  }
  return matrix;
};
