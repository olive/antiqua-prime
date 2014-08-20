module Antiqua.Graphics.Color (rgb, dim, mult, mix, Color) where

import GHC.Word
import Antiqua.Utils

type Color = (Word8, Word8, Word8, Word8)

rgb :: Word8 -> Word8 -> Word8 -> Color
rgb r g b = (r, g, b, 255)

dim :: Double -> Color -> Color
dim d (r, g, b, a) =
    let dd x = clamp 0 255 $ floor $ fromIntegral x / d in
    (dd r, dd g, dd b, a) -- dont touch alpha!

mult :: Double -> Color -> Color
mult d (r, g, b, a) =
    let dd x = clamp 0 255 $ floor $ fromIntegral x * d in
    (dd r, dd g, dd b, a) -- dont touch alpha!

mix :: Color -> Double -> Color -> Color
mix (cr, cg, cb, _) d (r, g, b, a) =
    let dd x y = clamp 0 255 $ floor $ (1 - d) * fromIntegral x + d * fromIntegral y in
    (dd r cr, dd g cg, dd b cb, a) -- dont touch alpha!
