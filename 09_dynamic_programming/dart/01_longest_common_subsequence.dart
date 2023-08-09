void main(List<String> args) {
  final table = longestCommonSubsequence('blue', 'clues');

  for (List<int> element in table) {
    print(element);
  }
}

List<List<int>> longestCommonSubsequence(String word1, String word2) {
  final tableWord1 = word1.split('');
  final tableWord2 = word2.split('');
  final table = List.generate(
      tableWord2.length, (index) => List<int>.filled(tableWord1.length, 0));

  for (int i = 0; i < tableWord1.length; i++) {
    for (int j = 0; j < tableWord2.length; j++) {
      if (tableWord2[j] == tableWord1[i]) {
        table[j][i] = (j - 1 >= 0 && i - 1 >= 0) ? table[j - 1][i - 1] + 1 : 1;
      } else {
        final top = (j - 1 >= 0) ? table[j - 1][i] : 0;
        final left = (i - 1 >= 0) ? table[j][i - 1] : 0;
        table[j][i] = (top > left) ? top : left;
      }
    }
  }
  return table;
}
