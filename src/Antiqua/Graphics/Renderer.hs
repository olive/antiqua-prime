module Antiqua.Graphics.Renderer(
    Renderer(..),
    Tileset(..),
    render
) where

import Control.Applicative
import Graphics.Rendering.OpenGL
import Graphics.Rendering.OpenGL.Raw
import qualified Data.Map as Map

import Antiqua.Graphics.TileRenderer
import Antiqua.Common

data Tileset = Tileset Int Int Int Int
type Texture = GLuint
data Renderer = Renderer Texture Tileset

drawTile :: Code c => Tileset -> XY -> Tile c -> IO ()
drawTile (Tileset tcols trows tWidth tHeight) (x, y) tile = do
    let totalWidth = fromIntegral (tWidth * tcols)
    let totalHeight = fromIntegral (tHeight * trows)
    let code = getIndex $ getCode tile
    let (tx, ty) = (code `mod` tcols, code `div` tcols)
    let (tx', ty') = (fromIntegral (tx*tWidth) / fromIntegral 256, fromIntegral (ty*tHeight) / fromIntegral 256)
    let (x', y') = (fromIntegral (x*tWidth), fromIntegral (y*tHeight))
    let (tw', th') = (fromIntegral tWidth / totalWidth, fromIntegral tHeight / totalHeight)
    let (xw', yh') = (fromIntegral tWidth, fromIntegral tHeight)

    glTexCoord2f   tx'    (ty' + th')
    glVertex2f     x'    (y' + yh')
    glTexCoord2f   (tx' + tw')    (ty' + th')
    glVertex2f     (x' + xw')    (y' + yh')
    glTexCoord2f   (tx' + tw')    ty'
    glVertex2f     (x' + xw')    y'
    glTexCoord2f   tx'    ty'
    glVertex2f     x'    y'


render :: Code c => Renderer -> TR XY (Tile c) -> IO ()
render (Renderer txt ts) (TR _ mp) = do
    glBindTexture gl_TEXTURE_2D txt
    glBegin gl_QUADS
    sequence_ $ (uncurry (drawTile ts)) <$> Map.assocs mp
    glEnd
    glFlush
