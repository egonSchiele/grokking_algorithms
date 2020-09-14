module GrokkingAlgos.BinarySearch where

import Prelude
import Data.Array ((!!))
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (logShow)

-- | Binary Search - input is a sorted list of elements
-- | Big o notation - log n
-- | Traveling salesman - O (n!)
binarysearch :: Int -> Array Int -> Int -> Int -> Maybe Int
binarysearch x arr low high
  | low > high = Nothing
  | otherwise =
    let
      mid = (high + low) / 2
    in
      arr !! mid
        >>= case _ of
            item
              | item == x -> Just mid
            item
              | item > x -> binarysearch x arr low (mid - 1)
            item
              | item < x -> binarysearch x arr (mid + 1) high
            _ -> Nothing

find :: Int -> Array Int -> Maybe Int
find x arr = binarysearch x arr low high
  where
  low = 0

  high = (Array.length arr) - 1

main :: Effect Unit
main = do
  logShow $ find 20 [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20 ]
