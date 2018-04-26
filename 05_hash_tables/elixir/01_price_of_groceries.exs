import Map, only: [put: 3]

book =
  %{}
  |> put("apple", 0.67)
  |> put("milk", 1.49)
  |> put("avocado", 1.49)

IO.inspect(book)
