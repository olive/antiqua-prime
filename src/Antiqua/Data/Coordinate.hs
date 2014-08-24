module Antiqua.Data.Coordinate where

import Antiqua.Common


data Direction2 = D'Up | D'Down | D'Left | D'Right

class Coordinate a b | a -> b where
    (|+|) :: a -> a -> a
    (|+) :: a -> b -> a
    (+|) :: a -> b -> a

    (|-|) :: a -> a -> a
    (|-) :: a -> b -> a
    (-|) :: a -> b -> a
    neg :: a -> a

instance Coordinate XY Int where
    (x, y) |+| (a, b) = (x + a, y + b)
    (x, y) |+ a = (x + a, y)
    (x, y) +| a = (x, y + a)
    (x, y) |-| (a, b) = (x - a, y - b)
    (x, y) |- a = (x - a, y)
    (x, y) -| a = (x, y - a)
    neg (x, y) = (-x, -y)


class Space c d | c -> d, d -> c where
    (~~>) :: c -> d -> c

instance Space XY Direction2 where
    (x, y) ~~> D'Up = (x, y-1)
    (x, y) ~~> D'Down = (x, y+1)
    (x, y) ~~> D'Left = (x - 1, y)
    (x, y) ~~> D'Right = (x+1, y)



