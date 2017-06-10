
helper :: (Integer, [Integer]) -> Integer -> (Integer, [Integer])
helper (min, xs) e
  | min <= e = (min, e : xs)
  | otherwise = (e, min : xs)

minandrest :: [Integer] -> (Integer, [Integer])
minandrest (x:xs) = foldl helper (x, []) xs

selectionsort :: [Integer] -> [Integer]
selectionsort [] = []
selectionsort xs = min : selectionsort rest
  where (min, rest) = minandrest xs

-- Usage
-- selectionsort [1,4,2,3,5,6,0,7,8,9,1,9,0]