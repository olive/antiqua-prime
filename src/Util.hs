module Util ( pngLoad, Image(..) ) where

import Codec.Picture
import GHC.Word

pngLoad :: IO (Image Word8)
pngLoad = do
    image <- readPng "C:/Users/M/Desktop/16x16.png"
    case image of
        Right d -> case d of
                   ImageRGBA8 (Image width height dat) -> return (Image width height dat)

        Left r -> do
            print r
            print "flop"
            undefined
