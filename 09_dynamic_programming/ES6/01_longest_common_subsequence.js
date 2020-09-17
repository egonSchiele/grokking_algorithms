/**
 * Create a matrix
 * @param {number} rows Number of rows
 * @param {number} columns ANumber of columns
 * @returns {Array} Matrix
 */
const createMatrix = (rows = 0, columns = 0) => {
  const matrix = [];

  for (let i = 0; i < rows; i++) {
    matrix[i] = Array(columns).fill(0);
  }

  return matrix;
};

/**
 * Find the longest substring
 * @param {string} firstWord First word
 * @param {string} secondWord Second word
 * @returns {string} The longest substring
 */
const longestSubstring = (firstWord = "", secondWord = "") => {
  const matrix = JSON.parse(
    JSON.stringify(createMatrix(firstWord.length, secondWord.length))
  );
  let sizeSequence = 0;
  let indexSequence = 0;

  for (let i = 0; i < firstWord.length; i++) {
    for (let j = 0; j < secondWord.length; j++) {
      if (firstWord[i] === secondWord[j]) {
        matrix[i][j] = (i && j) > 0 ? matrix[i - 1][j - 1] + 1 : 1;

        if (matrix[i][j] >= sizeSequence) {
          sizeSequence = matrix[i][j];
          indexSequence = i + 1;
        }
      } else {
        matrix[i][j] = 0;
      }
    }
  }

  return firstWord.slice(indexSequence - sizeSequence, indexSequence);
};

longestSubstring("vista", "hish"); // "is"
longestSubstring("fish", "hish"); // "ish"

/**
 * Find the longest common subsequence
 * @param {string} firstWord First word
 * @param {string} secondWord Second word
 * @returns {number} The longest common subsequence
 */
const longestCommonSubsequence = (firstWord = "", secondWord = "") => {
  const matrix = JSON.parse(
    JSON.stringify(createMatrix(firstWord.length, secondWord.length))
  );
  if (matrix.length === 0 || matrix[0].length === 0) return 0;
  for (let i = 0; i < firstWord.length; i++) {
    for (let j = 0; j < secondWord.length; j++) {
      if (firstWord[i] === secondWord[j]) {
        matrix[i][j] = (i && j) > 0 ? matrix[i - 1][j - 1] + 1 : 1;
      } else {
        matrix[i][j] = Math.max(
          i > 0 ? matrix[i - 1][j] : 0,
          j > 0 ? matrix[i][j - 1] : 0
        );
      }
    }
  }
  return matrix[firstWord.length - 1][secondWord.length - 1];
};

longestCommonSubsequence("fish", "fosh"); // 3
longestCommonSubsequence("fort", "fosh"); // 2
