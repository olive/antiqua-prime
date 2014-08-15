module Antiqua.Graphics.Tile where

import Control.Monad

import Antiqua.Common

data Tile a where
    Tile :: (Code c) => c -> Color -> Color -> Tile c

getCode :: Tile a -> a
getCode (Tile c _ _) = c

getBg :: Tile a -> Color
getBg (Tile _ b _) = b

getFg :: Tile a -> Color
getFg (Tile _ _ f) = f

setCode :: a -> Tile a -> Tile a
setCode c (Tile _ bg fg) = Tile c bg fg

setBg :: Color -> Tile a -> Tile a
setBg bg (Tile c _ fg) = Tile c bg fg

setFg :: Color -> Tile a -> Tile a
setFg fg (Tile c bg _) = Tile c bg fg

mapBg :: Tile a -> (Color -> Color) -> Tile a
mapBg t f =
     join (setBg . f . getBg) $ t
