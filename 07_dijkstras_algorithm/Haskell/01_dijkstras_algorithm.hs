import Data.List
import Control.Applicative
import qualified Data.HashMap.Strict as Map

type Costs = Map.HashMap String Double
type Parents = Map.HashMap String String
type WeightedEdge = (String, Double)

inf = read "Infinity" :: Double

graph = Map.fromList [
  ("book", [("rarelp", 5.0), ("poster", 0.0)]),
  ("rarelp", [("guitar", 15.0), ("drumset", 20.0)]),
  ("poster", [("drumset", 35.0), ("guitar", 30.0)]),
  ("drumset", [("piano", 10.0)]),
  ("guitar", [("piano", 20.0)]),
  ("piano", [])
  ]

neighbors :: String -> Costs
neighbors node = Map.fromList (maybe [] id (Map.lookup node graph))

closest :: String -> WeightedEdge
closest node = head $ sortBy (\x y -> compare (snd x) (snd y)) $ Map.toList $ (neighbors node)

buildmap graph def initmapfn node = foldl
  (\accMap key -> Map.insert key def accMap)
  startingMap
  keystoadd
  where startingMap = initmapfn node
        startKeys = node : (Map.keys startingMap)
        allKeys = Map.keys graph
        keystoadd = filter (not . (`elem` startKeys)) allKeys

initcosts node = buildmap graph inf neighbors node

initparents node = buildmap graph "" ((Map.map (\x -> node)) . neighbors) node

safeHead [] = Nothing
safeHead (x:xs) = Just x

cheapest :: [String] -> Costs -> Maybe WeightedEdge
cheapest processed costs = safeHead $
  sortBy (\x y -> compare (snd x) (snd y)) $
  filter (\(a, b) -> (not . (`elem` processed)) a) $
  Map.toList $
  costs

updatecosts :: Costs -> WeightedEdge -> Costs
updatecosts costs (node, cost) = foldl
  (\acc (neighbor, neighborcost) ->
    let (Just newcost) = min (neighborcost + cost) <$> (Map.lookup neighbor acc)
    in Map.insert neighbor newcost acc)
  costs
  edges
  where edges = Map.toList $ neighbors node

updateparents :: Parents -> Costs -> WeightedEdge -> Parents
updateparents parents costs (node, cost) = foldl
  (\acc (neighbor, neighborcost) -> case (((cost + neighborcost) <) <$> (Map.lookup neighbor costs)) of
    Just True -> Map.insert neighbor node acc
    _ -> acc)
  parents
  edges
  where edges = Map.toList $ neighbors node

shortestpath :: Costs -> Parents -> [String] -> (Costs, Parents)
shortestpath costs parents processed = case (cheapest processed costs) of
  Just (node, cost) -> shortestpath newcosts newparents (node : processed)
                       where newcosts = updatecosts costs (node, cost)
                             newparents = updateparents parents costs (node, cost)
  Nothing -> (costs, parents)

costto :: String -> Costs -> Double
costto node costMap = case (Map.lookup node costMap) of
  Just cost -> cost
  _ -> inf

pathto :: String -> Parents -> [String]
pathto node parentsMap = buildpath node parentsMap [node]
  where buildpath node parentsMap acc = case (Map.lookup node parentsMap) of
          Just "book" -> "book" : acc
          Just parent -> buildpath parent parentsMap (parent : acc)

costs = initcosts "book"

parents = initparents "book"

processed = ["book"]

main = do
  (putStrLn . show . (costto "piano")) costsolution
  (putStrLn . show . (pathto "piano")) parentsolution
  where (costsolution, parentsolution) = shortestpath costs parents processed