import Control.Applicative
import Data.List
import qualified Data.Set as Set
import qualified Data.HashMap.Strict as Map

items = Map.fromList [
  ("stereo", (4, 3000)),
  ("laptop", (3, 2000)),
  ("guitar", (1, 1500))
  ]

value set = (a, b)
  where
    weightandvalues = (sequence $ map (`Map.lookup`  items) set)
    Just (a,b) = Just (foldl (\(a,b) (c,d) -> (a+c, b+d)) (0,0)) <*> weightandvalues

powerSet xs = foldl (\acc x -> acc ++ (map (\e -> x:e) acc)) [[]] xs

solution = foldl
  (\acc v -> let
      (firstweight, firstvalue) = value acc
      (secondweight, secondvalue) = value v
    in if firstweight <= 4 && firstvalue >= secondvalue then acc else if secondweight <= 4 then v else acc)
  first
  rest
  where
    (first: rest) = filter (not . null) $ powerSet $ (Map.keys items)
