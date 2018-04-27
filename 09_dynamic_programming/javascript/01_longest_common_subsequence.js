
/**
 * Search for LCS
 *
 * @param {string} string1 first string
 * @param {string} string2 second string
 *
 * @return {object} with keys: lcs, offset, sequence
 */
function lcs( string1, string2 ) {
	if ( !string1 || !string2 ) {
		return {
			lcs: 0,
			offset: 0,
			sequence: '',
		};
	}

	let lcs = 0;

	let lastSubIndex = 0;

	let table = [];
	let len1 = string1.length;
	let len2 = string2.length;
	let row;
	let col;

	/**
	 * Matrix
	 * - has an increased dimension to avoid extra checks for previous elements
	 *
	 * - the number of rows is equal to the length of the first string + 1
	 * - the number of columns is equal to the length of the second string + 1
	 */
	for ( row = 0; row <= len1; row++ ) {
		table[row] = [];
		for (col = 0; col <= len2; col++) {
			table[row][col] = 0;
		}
	}

	// Fill the matrix
	let i;
	let j;

	for ( i = 0; i < len1; i++ ) {
		for ( j = 0; j < len2; j++ ) {
			if ( string1[i] === string2[j] ) {
				// The letters match
				if ( table[i][j] === 0 ) {
					table[i+1][j+1] = 1;
				} else {
					table[i+1][j+1] = table[i][j] + 1;
				}

				// increment lcs if it's needed
				if ( table[i+1][j+1] > lcs ) {
					lcs = table[i+1][j+1];
					lastSubIndex = i;
				}
			} else {
				// The letters don't match
				table[i+1][j+1] = 0;
			}
		}
	}

	return {
		lcs: lcs,
		offset: lastSubIndex-lcs + 1,
		sequence: string1.slice( lastSubIndex - lcs + 1, lastSubIndex + 1 ),
	};
}

console.log( lcs( 'hish', 'fish' ) ); // { lcs: 3, offset: 1, sequence: 'ish' }
console.log( lcs( 'vista', 'hish' ) ); // { lcs: 2, offset: 1, sequence: 'is' }
console.log( lcs( 'google', 'abcdefgooglehijklm' ) ); // { lcs: 6, offset: 0, sequence: 'google' }
console.log( lcs( '0', 0 ) ); // { lcs: 0, offset: 0, sequence: '' }
