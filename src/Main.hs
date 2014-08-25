module Main where

import Antiqua.Loading.TMXLoader
import qualified Antiqua.Data.NonEmpty as NE
main :: IO ()
main = do
    let ne = NE.NonEmpty 1 [2, 3, 4, 5, 6]
    print ne
    (print . NE.reverse) (ne)
    loadTmx "holophote.tmx"
    return ()
