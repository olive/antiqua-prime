module Antiqua.Graphics.Renderer(
    Renderer(..),
    Tileset(..),
    render
) where

import Control.Applicative
import Graphics.Rendering.OpenGL hiding (Color)
import Graphics.Rendering.OpenGL.Raw
import Antiqua.Graphics.Tile
import Antiqua.Graphics.Color
import Antiqua.Common
import Data.Array.Storable
import Data.Foldable
import Data.Bits

data Tileset = Tileset Int Int Int Int
data Renderer = Renderer Texture Tileset
type Four a = (a, a, a, a)
--drawBg :: Code c => Four (GLfloat, GLfloat) -> Tile c -> IO ()
--drawBg (v1, v2, v3, v4) tile = do
--    let bg = getBg tile
--    color4 bg
--    v2f v1
--    color4 bg
--    v2f v2
--    color4 bg
--    v2f v3
--    color4 bg
--    v2f v4


--color4 :: Color -> IO ()
--color4 (r, g, b, a) = do
--    glColor4ub (fromIntegral r)
--               (fromIntegral g)
--               (fromIntegral b)
--               (fromIntegral a)
--t2f = uncurry glTexCoord2f
--v2f = uncurry glVertex2f
--drawFg :: Code c => Four (GLfloat, GLfloat) -> Four (GLfloat, GLfloat) -> Tile c -> --IO ()
--drawFg (v1, v2, v3, v4) (t1, t2, t3, t4) tile = do
--    let fg = getFg tile
--    color4 fg
--    t2f t1
--    v2f v1
--    color4 fg
--    t2f t2
--    v2f v2
--    color4 fg
--    t2f t3
--    v2f v3
--    color4 fg
--    t2f t4
--    v2f v4

--cacheTex :: ??? -> (Int -> (GLfloat, GLfloat))

--toTexCoord :: Tileset -> Int -> Four (GLfloat, GLfloat)
--toTexCoord (Tileset tcols trows tWidth tHeight) code =
--    let totalWidth = fromIntegral (tWidth * tcols) :: GLfloat in
--    let totalHeight = fromIntegral (tHeight * trows) :: GLfloat in
--    let (tx, ty) = (code `mod` tcols, code `div` tcols) in
--    let (tx', ty') = (fromIntegral (tx*tWidth) / totalWidth,
--                      fromIntegral (ty*tHeight) / totalHeight) in
--    let (tw', th') = (fromIntegral tWidth / totalWidth,
--                      fromIntegral tHeight / totalHeight) in
--    ( (    tx',ty'+th')
--    , (tx'+tw',ty'+th')
--    , (tx'+tw',    ty')
--    , (    tx',    ty')
--    )

--toVertex :: Tileset -> (Int,Int) -> Four (GLfloat, GLfloat)
--toVertex (Tileset _ _ tWidth tHeight) (x, y) =
--    let (x', y') = (fromIntegral (x*tWidth), fromIntegral (y*tHeight)) in
--    let (xw', yh') = (fromIntegral tWidth, fromIntegral tHeight) in
--    ( (    x', y'+yh')
--    , (x'+xw', y'+yh')
--    , (x'+xw',     y')
--    , (    x',     y')
--    )

writeCoord (Tileset tcols trows tWidth tHeight) code i arr = do
    let totalWidth = fromIntegral (tWidth * tcols) :: GLfloat
    let totalHeight = fromIntegral (tHeight * trows) :: GLfloat
    let (tx, ty) = (code `mod` tcols, code `div` tcols)
    let (tx', ty') = (fromIntegral (tx*tWidth) / totalWidth,
                      fromIntegral (ty*tHeight) / totalHeight)
    let (tw', th') = (fromIntegral tWidth / totalWidth,
                      fromIntegral tHeight / totalHeight)
    writeArray arr (i+0) (    tx')
    writeArray arr (i+1) (ty'+th')
    writeArray arr (i+2) (tx'+tw')
    writeArray arr (i+3) (ty'+th')
    writeArray arr (i+4) (tx'+tw')
    writeArray arr (i+5) (    ty')
    writeArray arr (i+6) (    tx')
    writeArray arr (i+7) (    ty')
    return arr


--writeVertex :: Tileset -> (Int,Int) -> x -> x
writeVertex (Tileset _ _ tWidth tHeight) (x, y) i arr = do
    let (x', y') = (fromIntegral (x*tWidth), fromIntegral (y*tHeight))
    let (xw', yh') = (fromIntegral tWidth, fromIntegral tHeight)
    writeArray arr (i+0) (    x')
    writeArray arr (i+1) (y'+yh')
    writeArray arr (i+2) (x'+xw')
    writeArray arr (i+3) (y'+yh')
    writeArray arr (i+4) (x'+xw')
    writeArray arr (i+5) (    y')
    writeArray arr (i+6) (    x')
    writeArray arr (i+7) (    y')
    return arr

writeColor (r, g, b, _) i arr = do
    let r' = fromIntegral r / fromIntegral 256 :: GLfloat
    let g' = fromIntegral g / fromIntegral 256 :: GLfloat
    let b' = fromIntegral b / fromIntegral 256 :: GLfloat


    writeArray arr (i+0) r'
    writeArray arr (i+1) g'
    writeArray arr (i+2) b'
    writeArray arr (i+3) r'
    writeArray arr (i+4) g'
    writeArray arr (i+5) b'
    writeArray arr (i+6) r'
    writeArray arr (i+7) g'
    writeArray arr (i+8) b'
    writeArray arr (i+9) r'
    writeArray arr (i+10) g'
    writeArray arr (i+11) b'
    return arr

mapFst :: (a -> c) -> [(a, b)] -> [c]
mapFst f xs = f.fst <$> xs

mapSnd :: (b -> c) -> [(a, b)] -> [c]
mapSnd f xs = f.snd <$> xs

uncurry3 :: (a -> b -> c -> d) -> ((a, b, c) -> d)
uncurry3 f ~(x, y, z) = f x y z

len = 48*48

vertArrayp = do
    let mp = [ ((i, j), undefined) | i <- [0..48-1], j <- [0..48-1]]
    vert <- newArray_ (0,len*8) :: IO (StorableArray Int GLfloat)
    foldlM (\arr ((pos, t), i) -> writeVertex (Tileset 16 16 16 16) pos (i*8) arr) vert (zip mp [0..len-1])
texArrayp = newArray_ (0,len*8) :: IO (StorableArray Int GLfloat)
colorBGp = newArray_ (0,len*12) :: IO (StorableArray Int GLfloat)
colorFGp = newArray_ (0,len*12) :: IO (StorableArray Int GLfloat)

render :: Code c => Renderer -> [((Int,Int), Tile c)] -> IO ()
render (Renderer txt ts) mp = do
    let len = length mp
    vertArray <- vertArrayp
    texArray <- texArrayp
    colorBG <- colorBGp
    colorFG <- colorFGp
    foldlM (\arr ((pos, t), i) -> writeCoord ts (getIndex . getCode $ t) (i*8) arr) texArray (zip mp [0..len-1])
    foldlM (\arr ((pos, t), i) -> writeColor (getFg t) (i*12) arr) colorFG (zip mp [0..3*(len `div` 2) - 1])
    foldlM (\arr ((pos, t), i) -> writeColor (getBg t) (i*12) arr) colorBG (zip mp [0..3*(len `div` 2) - 1])
    --let !verts = mapFst (toVertex ts) mp
    --let !texs = mapSnd (toTexCoord ts . getIndex . getCode) mp
    --let !tiles = snd <$> mp
    withStorableArray vertArray $ \vert -> do
      withStorableArray texArray  $ \tex -> do
        withStorableArray colorFG $ \fg -> do
          withStorableArray colorBG $ \bg -> do
            glDisable gl_TEXTURE_2D
            glEnableClientState gl_VERTEX_ARRAY
            glEnableClientState gl_COLOR_ARRAY
            glDisableClientState gl_TEXTURE_COORD_ARRAY
            glVertexPointer 2 gl_FLOAT 0 vert
            glColorPointer 3 gl_FLOAT 0 bg
            glDrawArrays gl_QUADS 0 (fromIntegral (len*4))
            glEnable gl_TEXTURE_2D
            glBindTexture gl_TEXTURE_2D txt
            glEnableClientState gl_TEXTURE_COORD_ARRAY
            glVertexPointer 2 gl_FLOAT 0 vert
            glTexCoordPointer 2 gl_FLOAT 0 tex
            glColorPointer 3 gl_FLOAT 0 fg
            glDrawArrays gl_QUADS 0 (fromIntegral (len*4))
            glDisableClientState gl_VERTEX_ARRAY
            glDisableClientState gl_COLOR_ARRAY
            glDisableClientState gl_TEXTURE_COORD_ARRAY
            glFlush

