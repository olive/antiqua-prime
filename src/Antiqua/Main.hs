module Main where

import Antiqua.Loading.TMXLoader
import Antiqua.Data.Flood

main :: IO ()
main = do
    loadTmx "holophote.tmx"
    return ()
