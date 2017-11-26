import qualified Data.Set as Set
import qualified Data.HashMap.Strict as Map

stations = Map.fromList [
  ("kone", Set.fromList(["id", "nv", "ut"])),
  ("ktwo", Set.fromList(["wa", "id", "mt"])),
  ("kthree", Set.fromList(["or", "nv", "ca"])),
  ("kfour", Set.fromList(["nv", "ut"])),
  ("kfive", Set.fromList(["ca", "az"]))
  ]

statesNeeded = Set.fromList ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]

bestStation statesNeeded selectedStations stations = foldl
  (\a@(station1, states1) b@(station2, states2) ->
      let fn states = Set.size $ (Set.intersection statesNeeded states)
          coverage1 = fn states1
          coverage2 = fn states2
      in if coverage1 > coverage2 then a else b
  )
  x
  xs
  where (x: xs) = filter (\(station, states) -> not $ station `elem` selectedStations) $ Map.toList stations


stationSet statesNeeded finalStations =
  let (station, coveredStations) = bestStation statesNeeded finalStations stations
      neededStations = Set.difference statesNeeded coveredStations
      newStations = station : finalStations
  in if (Set.size statesNeeded > 0) then stationSet neededStations newStations else finalStations

finalSet = stationSet statesNeeded []