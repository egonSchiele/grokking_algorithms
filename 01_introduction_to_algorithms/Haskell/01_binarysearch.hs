import Data.Array

binarysearch :: Integer -> Array Integer Integer -> Integer -> Integer -> Maybe Integer
binarysearch x arr low high
  | low > high = Nothing
  | guess > x = binarysearch x arr low (mid - 1)
  | guess < x = binarysearch x arr (mid + 1) high
  | otherwise = Just mid
  where
    mid = ((low + high) `div` 2)
    guess = arr ! mid

find :: Integer -> Array Integer Integer -> Maybe Integer
find x arr = binarysearch x arr low high
  where borders = bounds arr
        low = fst borders
        high = snd borders

-- Usage
-- let arr = array (0, 4) [(i, i*i) | i <- [0..4]]  // [(0,0),(1,1),(2,4),(3,9),(4,16)]
-- find 4 arr                                       // Just 2
-- find 25 arr                                      // Nothing