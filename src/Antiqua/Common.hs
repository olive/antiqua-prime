module Antiqua.Common where

import Control.Applicative
import GHC.Word

import Graphics.Rendering.OpenGL.Raw

type XY = (Int, Int)
type Color = (Word8, Word8, Word8, Word8)
type Texture = GLuint

class Code c where
    getIndex :: c -> Int
    fromChar :: Char -> c
    fromString :: String -> [c]
    fromString = (<$>) fromChar
