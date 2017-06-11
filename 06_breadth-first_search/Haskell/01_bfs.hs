import qualified Data.HashMap.Strict as Map
import Control.Applicative

graph = Map.fromList [
  ("you", ["alice", "bob", "claire"]),
  ("bob", ["anuj", "peggy"]),
  ("alice", ["peggy"]),
  ("claire", ["mangoes", "jonny"]),
  ("anuj", []),
  ("peggy", []),
  ("mangoes", []),
  ("jonny", [])
  ]

connections name = Map.lookup name graph

bfs tosearch searched = case tosearch of
  Just (x: xs)
    | x == "mangoes" -> Just x
    | x `elem` searched -> bfs (Just xs) searched
    | otherwise -> bfs ((++) <$> Just xs <*> (connections x)) (x : searched)
  _ -> Nothing

main = do
  putStrLn (show (bfs (Just ["you"]) []))