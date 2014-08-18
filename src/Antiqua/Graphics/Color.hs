module Antiqua.Graphics.Color (rgb, Color) where

import GHC.Word

type Color = (Word8, Word8, Word8, Word8)

rgb :: Word8 -> Word8 -> Word8 -> Color
rgb r g b = (r, g, b, 255)
