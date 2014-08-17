module Antiqua.Common where

import Control.Applicative

import Graphics.Rendering.OpenGL.Raw

type XY = (Int, Int)
type Texture = GLuint
type NonEmpty t = (t, [t])

class Code c where
    getIndex :: c -> Int
    fromChar :: Char -> c
    fromString :: String -> [c]
    fromString = (<$>) fromChar


