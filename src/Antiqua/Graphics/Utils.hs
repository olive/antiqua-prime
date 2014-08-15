module Antiqua.Graphics.Utils where

import Codec.Picture
import GHC.Word

pngLoad :: String -> IO (Image Word8)
pngLoad file = do
    image <- readPng file
    case image of
        Right (ImageRGBA8 (Image width height dat)) ->
            return (Image width height dat)
        Right _ -> do
            error "unsupported bitmap"
        Left r -> do
            print r
            error "failed to load"
