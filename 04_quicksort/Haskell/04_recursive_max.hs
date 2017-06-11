
maxarr (x: []) = x
maxarr (x:xs) = if x > maxofrest then x else maxofrest
  where maxofrest = maxarr xs

main = (putStrLn . show . maxarr) [1, 5, 10, 25, 16, 1]