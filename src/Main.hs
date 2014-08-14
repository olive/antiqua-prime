module Main where

import qualified Graphics.UI.GLFW as GLFW
-- everything from here starts with gl or GL
import Graphics.Rendering.OpenGL.Raw
import Data.Bits ( (.|.) )
import System.Exit ( exitWith, ExitCode(..) )
import Control.Monad ( forever )
import Data.Vector.Storable hiding ((++))
import Foreign ( withForeignPtr, plusPtr, peek, alloca )
import Util ( Image(..), pngLoad )

initGL :: GLFW.Window -> IO GLuint
initGL win = do
  glEnable gl_TEXTURE_2D
  glShadeModel gl_SMOOTH
  glClearColor 0 0 0 0
  glClearDepth 1
  glEnable gl_DEPTH_TEST
  glDepthFunc gl_LEQUAL
  glHint gl_PERSPECTIVE_CORRECTION_HINT gl_NICEST
  (w,h) <- GLFW.getFramebufferSize win
  resizeScene win w h
  loadGLTextures

loadGLTextures :: IO GLuint
loadGLTextures = do

  (Image w h pd) <- pngLoad
  tex <- alloca $ \p -> do
    glGenTextures 1 p
    peek p
  let (ptr, off, _) = unsafeToForeignPtr  pd
  withForeignPtr ptr $ \p -> do
    let p' = p `plusPtr` off
    glBindTexture gl_TEXTURE_2D tex
    glTexImage2D gl_TEXTURE_2D 0 3
      (fromIntegral w) (fromIntegral h) 0 gl_RGBA gl_UNSIGNED_BYTE
      p'
    let glLinear = fromIntegral gl_LINEAR
    glTexParameteri gl_TEXTURE_2D gl_TEXTURE_MIN_FILTER glLinear
    glTexParameteri gl_TEXTURE_2D gl_TEXTURE_MAG_FILTER glLinear
  return tex

resizeScene :: GLFW.WindowSizeCallback
resizeScene win w     0      = resizeScene win w 1 -- prevent divide by zero
resizeScene _   width height = do
  glViewport 0 0 (fromIntegral width) (fromIntegral height)
  glMatrixMode gl_PROJECTION
  glLoadIdentity
  glOrtho 0 (fromIntegral width) (fromIntegral height) 0 0.1 100
  glMatrixMode gl_MODELVIEW
  glLoadIdentity
  glFlush


drawQuad :: (Int,Int) -> (Int,Int) -> Int -> (Int,Int) -> IO ()
drawQuad (x, y) (tx, ty) tSize (tw, th) = do
    let (tx', ty') = (fromIntegral tx / fromIntegral tw, fromIntegral ty / fromIntegral th)
    let (x', y') = (fromIntegral x, fromIntegral y)
    let (tw', th') = (fromIntegral tSize / fromIntegral tw, fromIntegral tSize / fromIntegral th)
    let (xw', yh') = (fromIntegral tSize, fromIntegral tSize)
    glBegin gl_QUADS
    glTexCoord2f   tx'    (ty' + th')
    glVertex2f     x'    (y' + yh')
    glTexCoord2f   (tx' + tw')    (ty' + th')
    glVertex2f     (x' + xw')    (y' + yh')
    glTexCoord2f   (tx' + tw')    ty'
    glVertex2f     (x' + xw')    y'
    glTexCoord2f   tx'    ty'
    glVertex2f     x'    y'
    glEnd

drawScene :: GLuint -> GLFW.Window -> IO ()
drawScene tex _ = do
  glClear $ fromIntegral  $  gl_COLOR_BUFFER_BIT
                         .|. gl_DEPTH_BUFFER_BIT
  glLoadIdentity
  glTranslatef 0 0 (-4)
  glBindTexture gl_TEXTURE_2D tex

  drawQuad (100,100) (16,32) 16 (256, 256)

  glFlush

shutdown :: GLFW.WindowCloseCallback
shutdown win = do
  GLFW.destroyWindow win
  GLFW.terminate
  exitWith ExitSuccess
  return ()

keyPressed :: GLFW.KeyCallback
keyPressed win GLFW.Key'Escape _ GLFW.KeyState'Pressed _ = shutdown win
keyPressed _   _               _ _                     _ = return ()

main :: IO ()
main = do
    True <- GLFW.init
    GLFW.defaultWindowHints
    Just win <- GLFW.createWindow 256 256 "antiqua-prime" Nothing Nothing
    GLFW.makeContextCurrent (Just win)
    tex <- initGL win
    GLFW.setWindowRefreshCallback win (Just (drawScene tex))
    GLFW.setFramebufferSizeCallback win (Just resizeScene)
    GLFW.setKeyCallback win (Just keyPressed)
    forever $ do
        GLFW.pollEvents
        drawScene tex win
        GLFW.swapBuffers win
