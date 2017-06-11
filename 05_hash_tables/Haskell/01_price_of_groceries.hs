import qualified Data.HashMap.Strict as Map

prices = Map.fromList [("Apple", 0.67), ("Milk", 1.49), ("Avocado", 1.55)]

main = putStrLn (show (Map.lookup "Apple" prices))