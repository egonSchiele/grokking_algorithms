import Control.Applicative
import Data.List
import qualified Data.Set as Set
import qualified Data.HashMap.Strict as Map

stationsMap = Map.fromList [
  ("kone", Set.fromList(["id", "nv", "ut"])),
  ("ktwo", Set.fromList(["wa", "id", "mt"])),
  ("kthree", Set.fromList(["or", "nv", "ca"])),
  ("kfour", Set.fromList(["nv", "ut"])),
  ("kfive", Set.fromList(["ca", "az"]))
  ]

statesNeeded = Set.fromList ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]

powerSet xs = foldl (\acc x -> acc ++ (map (\e -> x:e) acc)) [[]] xs

allStationCombinations = powerSet $ Map.keys stationsMap

coverage stationsMap stations = map (`Map.lookup` stationsMap) stations

stationsCoverage stations =
  fmap (Set.size . (Set.intersection statesNeeded)) $
  Just (foldl Set.union Set.empty ) <*>
  (sequence (coverage stationsMap stations))

solution = foldl
  (\x y -> if stationsCoverage x >= stationsCoverage y then x else y)
  first
  rest
  where (first: rest) =
          sortBy (\a b -> compare (length a) (length b)) $
          (filter (not . null) allStationCombinations)