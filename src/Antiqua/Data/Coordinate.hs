module Antiqua.Data.Coordinate where

import Antiqua.Common

class Coordinate a where
    (|+|) :: a -> a -> a
    (|-|) :: a -> a -> a
    neg :: a -> a

instance Coordinate XY where
    (x, y) |+| (a, b) = (x + a, y + b)
    (x, y) |-| (a, b) = (x - a, y - b)
    neg (x, y) = (-x, -y)
