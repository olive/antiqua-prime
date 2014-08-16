module Antiqua.Graphics.Rect where

import Antiqua.Graphics.Tile
import Antiqua.Common
import Control.Monad.Random
import Control.Monad

createPlain :: Int -> Int -> Tile c -> [(XY, Tile c)]
createPlain cols rows t = [ ((x, y), t) | x <- [0..cols-1], y <- [0..rows-1]]


createTextured :: Int -> Int -> Rand g (Tile c) -> Rand g [(XY, Tile c)]
createTextured cols rows f = do
    ts <- replicateM (cols*rows) f
    return $ zip pairs ts
    where pairs = [ (x, y) | x <- [0..cols-1], y <- [0..rows-1] ]
