module GrokkingAlgos.SelectionSort where

import Prelude
import Data.Foldable (minimum)
import Data.List (List(..), delete, (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console (logShow)

selectionsort :: List Int -> List Int
selectionsort l = case minimum l of
  Nothing -> Nil
  Just min -> min : selectionsort (delete min l)

main :: Effect Unit
main = do
  logShow $ selectionsort $ 1 : 2 : 3 : 5 : 4 : Nil
