void main(List<String> args) {
  final book = <String, double>{};
  book.addAll(
    {
      'apple': 0.67,
      'milk': 1.49,
      'avocado': 1.49,
    },
  );

  print(book);
  print(book['apple']);
  print(book['milk']);
  print(book['avocado']);
}
