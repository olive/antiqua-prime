module Antiqua.Graphics.Assets where

import Codec.Picture
import Data.Vector.Storable hiding ((++), empty)
import Foreign ( withForeignPtr, plusPtr, peek, alloca )
import Graphics.Rendering.OpenGL.Raw


import Antiqua.Common
import Antiqua.Graphics.Utils

loadTexture :: String -> IO Texture
loadTexture s = do
    Image w h pd <- pngLoad s
    tex <- alloca $ \p -> do
        glGenTextures 1 p
        peek p
    let (ptr, off, _) = unsafeToForeignPtr  pd
    withForeignPtr ptr $ \p -> do
        let p' = p `plusPtr` off
        glBindTexture gl_TEXTURE_2D tex
        glTexImage2D gl_TEXTURE_2D 0 (fromIntegral gl_RGBA)
            (fromIntegral w) (fromIntegral h) 0 gl_RGBA gl_UNSIGNED_BYTE
            p'
        let glLinear = fromIntegral gl_LINEAR

        glTexParameteri gl_TEXTURE_2D gl_TEXTURE_MIN_FILTER glLinear
        glTexParameteri gl_TEXTURE_2D gl_TEXTURE_MAG_FILTER glLinear
    return tex

data Assets
