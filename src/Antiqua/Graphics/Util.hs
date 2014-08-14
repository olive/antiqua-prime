module Antiqua.Graphics.Util ( pngLoad, Image(..) ) where

import Codec.Picture
import GHC.Word

pngLoad :: IO (Image Word8)
pngLoad = do
    image <- readPng "C:/Users/M/Desktop/16x16.png"
    case image of
        Right (ImageRGBA8 (Image width height dat)) ->
            return (Image width height dat)
        Right _ -> do
            error "unsupported bitmap"
        Left r -> do
            print r
            error "failed to load"
