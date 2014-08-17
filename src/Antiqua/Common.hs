module Antiqua.Common where

import Control.Applicative

import Graphics.Rendering.OpenGL.Raw

type XY = (Int, Int)
type Texture = GLuint
type NonEmpty t = (t, [t])

headOf :: NonEmpty a -> a
headOf (x, _) = x

mapHead :: (a -> a) -> NonEmpty a -> NonEmpty a
mapHead f (x, rest) = (f x, rest)

class Code c where
    getIndex :: c -> Int
    fromChar :: Char -> c
    fromString :: String -> [c]
    fromString = (<$>) fromChar


