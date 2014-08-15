module Antiqua.Graphics.Window where

import qualified Graphics.UI.GLFW as GLFW
import Antiqua.Graphics.TileRenderer
import Antiqua.Graphics.Util
import Antiqua.Graphics.Renderer
import Antiqua.Common

import Graphics.Rendering.OpenGL.Raw
import Data.Bits ( (.|.) )
import System.Exit ( exitWith, ExitCode(..) )
import Control.Monad ( forever )
import Data.Vector.Storable hiding ((++), empty)
import Foreign ( withForeignPtr, plusPtr, peek, alloca )

initGL :: GLFW.Window -> IO ()
initGL win = do
    glEnable gl_TEXTURE_2D
    glShadeModel gl_SMOOTH
    glClearColor 1 1 0 0
    glClearDepth 1
    glEnable gl_DEPTH_TEST
    glDepthFunc gl_LEQUAL
    glHint gl_PERSPECTIVE_CORRECTION_HINT gl_NICEST
    (w,h) <- GLFW.getFramebufferSize win
    glEnable gl_BLEND
    glBlendFunc gl_SRC_ALPHA gl_ONE_MINUS_SRC_ALPHA
    resizeScene win w h

loadGLTextures :: IO GLuint
loadGLTextures = do

    Image w h pd <- pngLoad
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

resizeScene :: GLFW.WindowSizeCallback
resizeScene win w 0 = resizeScene win w 1
resizeScene _ width height = do
    glViewport 0 0 (fromIntegral width) (fromIntegral height)
    glMatrixMode gl_PROJECTION
    glLoadIdentity
    glOrtho 0 (fromIntegral width) (fromIntegral height) 0 0.1 100
    glMatrixMode gl_MODELVIEW
    glLoadIdentity
    glFlush

drawScene :: GLuint -> GLFW.Window -> IO ()
drawScene tex _ = do
    glClear $ fromIntegral  $  gl_COLOR_BUFFER_BIT
                           .|. gl_DEPTH_BUFFER_BIT
    glLoadIdentity
    glTranslatef 0 0 (-5)
    glBindTexture gl_TEXTURE_2D tex

    let ts = Tileset 16 16 16 16
    let ren = Renderer tex ts
    let tr :: TR XY (Tile Int)
        tr = empty <+ ((0,0), Tile 11 black red) <+ ((0,1), Tile 12 red white)
    render ren tr

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

initWindow :: Int -> Int -> String -> IO GLFW.Window
initWindow width height title = do
    True <- GLFW.init
    GLFW.defaultWindowHints
    Just win <- GLFW.createWindow width height title Nothing Nothing
    GLFW.makeContextCurrent (Just win)
    initGL win
    --GLFW.setWindowRefreshCallback win (Just (drawScene tex))
    GLFW.setFramebufferSizeCallback win (Just resizeScene)
    GLFW.setKeyCallback win (Just keyPressed)
    return win

useWindow :: GLFW.Window -> IO () -> IO ()
useWindow win action = do
    tex <- loadGLTextures
    forever $ do
        GLFW.pollEvents
        drawScene tex win
        action
        GLFW.swapBuffers win
