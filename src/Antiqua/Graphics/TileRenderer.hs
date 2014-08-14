module Antiqua.Graphics.TileRenderer where

import Prelude hiding (foldl)

import GHC.Word
import qualified Data.Map as Map
import Data.Foldable
import Control.Monad
import Antiqua.Data.Coordinate
import Antiqua.Common


black :: Color
black = (0,0,0,255)

white :: Color
white = (255,255,255,255)

class Code c where
    getIndex :: c -> Int
instance Code Int where
    getIndex = id
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

data TR c t where
    TR :: (Coordinate c) => c -> (Map.Map c t) -> TR c t

empty :: TR XY (Tile c)
empty = TR (0,0) Map.empty

type TileRenderer c = TR XY (Tile c)

move :: c -> TR c t -> TR c t
move q (TR p mp) = TR (p |+| q) mp

withMove :: Coordinate c => c -> TR c t -> (TR c t -> TR c t) -> TR c t
withMove off tr f =  move (neg off) $ move off tr <+< f

(<+) :: Ord c => TR c t -> (c, t) -> TR c t
(TR off mp) <+ (p, t) = TR off $ Map.insert (p |-| off) t mp

(<++) :: (Foldable f, Ord c) => TR c t -> f (c, t) -> TR c t
tr <++ fs = foldl (<+) tr fs

(<+<) :: TR c t -> (TR c t -> TR c t) -> TR c t
tr <+< f = f tr

(<++<) :: (Foldable f) => TR c t -> f (TR c t -> TR c t) -> TR c t
tr <++< fs = foldl (<+<) tr fs
