module Antiqua.Graphics.TileRenderer where

import Prelude hiding (foldl)

import Control.Monad.ST
import qualified Data.Array.MArray as Array
import qualified Data.Array.ST as ArrayST
import Data.Foldable
import Antiqua.Data.Coordinate
import Antiqua.Graphics.Tile
import Antiqua.Common
import Antiqua.Graphics.Animation



data TR c t s where
    TR :: c
       -> s
       -> TR c t s


put x t arr = do
    Array.writeArray arr x t
    return arr

empty :: (Array.MArray (ArrayST.STArray s) (Tile c) (ST s)) => (Int,Int) -> (Tile c) -> (ST s) ((Int,Int), ArrayST.STArray s (Int,Int) (Tile c))
empty (x, y) t = do
    arr <- Array.newArray ((0, 0), (x-1, y-1)) t
    return $ ((0,0), arr)

getArr (TR _ arr) = arr

type TileRenderer c = TR XY (Tile c)

move q (off, arr) = ((off |+| q), arr)

(off, arr) <+ (p, t) = do
    put (p |-| off) t arr
    return $ (off, arr)

withMove off tr f = do
    tr' <- move off tr <+< f
    return $ move (neg off) tr'

(off, arr) <++ fs = foldlM (<+) (off, arr) fs

(off, arr) |> (p, (Tile t _ fg)) =
    (off, arr) $> (p, (\(Tile _ bg _) -> Tile t bg fg))

(off, arr) ||> fs = foldlM (|>) (off, arr) fs

(off, arr) <# (p, anim) = (off, arr) <+ (p, getFrame anim)

(off, arr) #|> (p, anim) = (off, arr) |> (p, getFrame anim)

(off, arr) <+< f = f (off, arr)

(off, arr) <++< fs = foldlM (<+<) (off, arr) fs

(off, arr) $> (p, f) = do
    let i = p |-| off
    t <- Array.readArray arr i
    Array.writeArray arr i (f t)
    return $ (off, arr)

(off, arr) $$> fs = foldlM ($>) (off, arr) fs

--(<*<) ::  Ord c => TR c t -> TR c t -> TR c t
--(TR off mp1) <*< (TR _ mp2) = TR off $ Map.union mp2 mp1

--erase :: TR c t -> TR c t
--erase (TR off _) =
--    let (TR _ mp) = empty in (TR off mp)
