module Antiqua.Graphics.TileRenderer where

import Prelude hiding (foldl)

import qualified Data.Map as Map
import Data.Foldable
import Antiqua.Data.Coordinate
import Antiqua.Graphics.Tile
import Antiqua.Common
import Antiqua.Graphics.Animation

black :: Color
black = (0,0,0,255)

white :: Color
white = (255,255,255,255)

red :: Color
red = (255, 0, 0, 255)

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

(|>) :: Ord c => TR c (Tile c) -> (c, (Tile c)) -> TR c (Tile c)
tr |> (p, (Tile t _ fg)) =
    tr $> (p, (\(Tile _ bg _) -> Tile t bg fg))

(||>) :: (Foldable f, Ord c) => TR c (Tile c) -> f (c, (Tile c)) -> TR c (Tile c)
tr ||> fs = foldl (|>) tr fs

(#>) :: Ord c => TR c (Tile c) -> (c, Animation c) -> TR c (Tile c)
tr #> (p, anim) = tr <+ (p, getFrame anim)

(#|>) :: Ord c => TR c (Tile c) -> (c, Animation c) -> TR c (Tile c)
tr #|> (p, anim) = tr |> (p, getFrame anim)

(<+<) :: TR c t -> (TR c t -> TR c t) -> TR c t
tr <+< f = f tr

(<++<) :: (Foldable f) => TR c t -> f (TR c t -> TR c t) -> TR c t
tr <++< fs = foldl (<+<) tr fs

($>) :: Ord c => TR c t -> (c, t -> t) -> TR c t
(TR off mp) $> (p, f) =
    TR off $ Map.adjust f (p |-| off) mp

($$>) :: (Foldable f, Ord c) => TR c t -> f (c, t -> t) -> TR c t
tr $$> fs = foldl ($>) tr fs

(<*<) :: Ord c => TR c t -> TR c t -> TR c t
(TR off mp1) <*< (TR _ mp2) = TR off $ Map.union mp2 mp1

erase :: TR c t -> TR c t
erase (TR off _) = TR off $ Map.empty
