
countarr [] = 0
countarr (x:xs) = 1 + countarr xs

main = (putStrLn . show . countarr) [0, 1, 2, 3, 4, 5]