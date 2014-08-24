module Main where

import Antiqua.Loading.TMXLoader

main :: IO ()
main = do
    loadTmx "holophote.tmx"
    return ()
