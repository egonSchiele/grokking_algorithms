/**
 * @param {string} string1 - The first input string.
 * @param {string} string2 - The second input string.
 * @returns An object containing:
 *  - `lcs`: the length of the longest common substring,
 *  - `offset`: the starting index of the substring in the first string,
 *  - `sequence`: the actual longest common substring found.
 */
function lcs(
    string1: string,
    string2: string
  ): { lcs: number; offset: number; sequence: string } {
    // Return early if either string is empty
    if (!string1 || !string2) {
      return { lcs: 0, offset: 0, sequence: "" };
    }
  
    let lcsLength = 0; 
    let lastSubIndex = 0; 
  
    const len1 = string1.length;
    const len2 = string2.length;
  
    // Create a 2D array (DP table) with all values initialized to 0
    const table: number[][] = Array.from({ length: len1 + 1 }, () =>
      Array(len2 + 1).fill(0)
    );
  
    // Loop through both strings to populate the DP table
    for (let i = 0; i < len1; i++) {
      for (let j = 0; j < len2; j++) {
        // If characters match, extend the previous substring
        if (string1[i] === string2[j]) {
          table[i + 1][j + 1] = table[i][j] + 1;
  
          // If this is the longest match so far, update our markers
          if (table[i + 1][j + 1] > lcsLength) {
            lcsLength = table[i + 1][j + 1];
            lastSubIndex = i;
          }
        } else {
          // No match here, so reset to 0
          table[i + 1][j + 1] = 0;
        }
      }
    }
  
    // Calculate where the substring starts
    const offset = lastSubIndex - lcsLength + 1;
  
    const sequence = string1.slice(offset, lastSubIndex + 1);
  
    
    return { lcs: lcsLength, offset, sequence };
  }
  
  // Example test cases

  console.log(lcs("hish", "fish"));             // { lcs: 3, offset: 1, sequence: 'ish' }
  console.log(lcs("vista", "hish"));            // { lcs: 2, offset: 1, sequence: 'is' }
  console.log(lcs("google", "abcdefgooglehijklm")); // { lcs: 6, offset: 0, sequence: 'google' }
  console.log(lcs("0", "0"));                   // { lcs: 1, offset: 0, sequence: '0' }
  