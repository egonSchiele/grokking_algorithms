void main(List<String> args) {
  final table = longestCommonSubstring('fish', 'hish');

  for (List<int> element in table) {
    print(element);
  }
}

List<List<int>> longestCommonSubstring(String word1, String word2) {
  final tableWord1 = word1.split('');
  final tableWord2 = word2.split('');
  final table = List.generate(
      tableWord2.length, (index) => List<int>.filled(tableWord1.length, 0));

  for (int i = 0; i < tableWord1.length; i++) {
    for (int j = 0; j < tableWord2.length; j++) {
      if (tableWord2[j] == tableWord1[i]) {
        table[j][i] = table[j - 1][j - 1] + 1;
      } else {
        table[j][i] = 0;
      }
    }
  }
  return table;
}
