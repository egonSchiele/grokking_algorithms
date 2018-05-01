/**
 * Compute the edit distance between the two given strings
 *
 * @param {*} source
 * @param {*} target
 *
 * @return {number}
 */
function getEditDistance(source, target) {
	if (source.length == 0) return target.length;
	if (target.length == 0) return source.length;

	let i;
	let j;
	let matrix = [];

	// Fill the column
	for (i = 0; i <= target.length; i++) {
		matrix[i] = [i];
	}

	// Fill the column
	for (j = 0; j <= source.length; j++) {
		matrix[0][j] = j;
	}

	// Fill in the rest of the matrix
	for (i = 1; i <= target.length; i++) {
		for (j = 1; j <= source.length; j++) {
			if (target.charAt(i - 1) == source.charAt(j - 1)) {
				matrix[i][j] = matrix[i - 1][j - 1];
			} else {
				matrix[i][j] = Math.min(
					matrix[i - 1][j - 1] + 1, // substitution
					Math.min(
						matrix[i][j - 1] + 1, // insertion
						matrix[i - 1][j] + 1
					)
				); // deletion
			}
		}
	}

	return matrix[target.length][source.length];
}

console.log(getEditDistance("google", "notgoogl")); // 4
