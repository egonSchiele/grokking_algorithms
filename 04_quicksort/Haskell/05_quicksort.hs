import Data.List

quicksort [] = []
quicksort (x: []) = [x]
quicksort (x:xs) = (quicksort lessthan) ++ [x] ++ (quicksort greaterthan)
  where (lessthan, greaterthan) = partition (<= x) xs

main = (putStrLn . show . quicksort) [0,9,4,5,6,3,1,0,1]