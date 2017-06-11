import qualified Data.HashMap.Strict as Map

all_voters = Map.fromList[("tom", True), ("mike", True)]

check_voter name voters_map = case Map.lookup name voters_map of
  Just _ -> ("kick them out!", voters_map)
  otherwise -> ("let them vote!", Map.insert name True voters_map)

log_vote name voters_map = do
  putStrLn str
  return new_voters_map
  where (str, new_voters_map) = check_voter name voters_map

main = do
  try_mike <- log_vote "mike" all_voters
  try_john <- log_vote "john" try_mike
  return try_john