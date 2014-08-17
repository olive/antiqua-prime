module Antiqua.Graphics.Renderer(
    Renderer(..),
    Tileset(..),
    render
) where

import Control.Applicative
import Graphics.Rendering.OpenGL hiding (Color)
import Graphics.Rendering.OpenGL.Raw
import qualified Data.Map as Map

import Antiqua.Graphics.TileRenderer
import Antiqua.Graphics.Tile
import Antiqua.Graphics.Color
import Antiqua.Common

data Tileset = Tileset Int Int Int Int
data Renderer = Renderer Texture Tileset

drawBg :: Code c => Tileset -> XY -> Tile c -> IO ()
drawBg (Tileset _ _ tWidth tHeight) (x, y) tile = do
    let (x', y') = (fromIntegral (x*tWidth),
                    fromIntegral (y*tHeight))
    let (xw', yh') = (fromIntegral tWidth, fromIntegral tHeight)
    let bg = getBg tile
    color4 bg
    glVertex2f             x'    (y' + yh')
    color4 bg
    glVertex2f     (x' + xw')    (y' + yh')
    color4 bg
    glVertex2f     (x' + xw')            y'
    color4 bg
    glVertex2f             x'            y'

color4 :: Color -> IO ()
color4 (r, g, b, a) = do
    glColor4ub (fromIntegral r)
               (fromIntegral g)
               (fromIntegral b)
               (fromIntegral a)

drawFg :: Code c => Tileset -> XY -> Tile c -> IO ()
drawFg (Tileset tcols trows tWidth tHeight) (x, y) tile = do
    let totalWidth = fromIntegral (tWidth * tcols) :: GLfloat
    let totalHeight = fromIntegral (tHeight * trows) :: GLfloat
    let code = getIndex $ getCode tile
    let (tx, ty) = (code `mod` tcols, code `div` tcols)
    let (tx', ty') = (fromIntegral (tx*tWidth) / totalWidth,
                      fromIntegral (ty*tHeight) / totalHeight)
    let (x', y') = (fromIntegral (x*tWidth), fromIntegral (y*tHeight))
    let (tw', th') = (fromIntegral tWidth / totalWidth,
                      fromIntegral tHeight / totalHeight)
    let (xw', yh') = (fromIntegral tWidth, fromIntegral tHeight)
    let fg = getFg tile
    color4 fg
    glTexCoord2f           tx'    (ty' + th')
    glVertex2f              x'    ( y' + yh')
    color4 fg
    glTexCoord2f   (tx' + tw')    (ty' + th')
    glVertex2f     ( x' + xw')    ( y' + yh')
    color4 fg
    glTexCoord2f   (tx' + tw')            ty'
    glVertex2f     ( x' + xw')            y'
    color4 fg
    glTexCoord2f            tx'           ty'
    glVertex2f               x'            y'


render :: Code c => Renderer -> TR XY (Tile c) -> IO ()
render (Renderer txt ts) (TR _ mp) = do
    glBindTexture gl_TEXTURE_2D txt
    glDisable gl_TEXTURE_2D
    glBegin gl_QUADS
    sequence_ $ (uncurry (drawBg ts)) <$> Map.assocs mp
    glEnd
    glEnable gl_TEXTURE_2D
    glBegin gl_QUADS
    sequence_ $ (uncurry (drawFg ts)) <$> Map.assocs mp
    glEnd
    glFlush
