import { initializeMatrix } from "./base";

const diff = (firstWord, secondWord) => {
  const arr1 = firstWord.split("");
  const arr2 = secondWord.split("");
  const matrix = initializeMatrix(arr1, arr2);
  for (let i = 0; i < arr1.length; i += 1) {
    for (let j = 0; j < arr2.length; j += 1) {
      if (arr1[i] === arr2[j]) {
        if (i > 0 && j > 0) {
          matrix[i][j] = matrix[i - 1][j - 1] + 1;
        } else {
          matrix[i][j] = 1;
        }
      } else {
        if (i > 0 && j > 0) {
          matrix[i][j] = Math.max(matrix[i - 1][j], matrix[i][j - 1]);
        } else {
          matrix[i][j] = 0;
        }
      }
    }
  }
  return matrix[arr1.length - 1][arr2.length - 1];
};

export default diff;
