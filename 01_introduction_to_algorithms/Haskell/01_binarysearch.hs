import Data.Array

binarysearch :: Integer -> Array Integer Integer -> Integer -> Integer -> Maybe Integer
binarysearch x arr low high
  | low > high = Nothing
  | mid > x = binarysearch x arr low (high - 1)
  | mid < x = binarysearch x arr (low + 1) high
  | otherwise = Just mid
  where
    mid = arr ! ((low + high) `div` 2)


find :: Integer -> Array Integer Integer -> Maybe Integer
find x arr = binarysearch x arr low high
  where p = bounds arr
        low = fst p
        high = snd p

-- Usage
-- let arr = array (0, 4) [(i, i*i) | i <- [0..4]]
-- find 4 arr