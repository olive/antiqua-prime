module Antiqua.Common where

import GHC.Word
import Graphics.Rendering.OpenGL.Raw
type XY = (Int,Int)
type Color = (Word8, Word8, Word8, Word8)
type Texture = GLuint
class Code c where
    getIndex :: c -> Int
