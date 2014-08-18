module Antiqua.Graphics.Window(
    Window,
    WindowSettings(..),
    createWindow,
    useWindow,
    getKey,
    getScroll,
    resetScroll
) where

import qualified Graphics.UI.GLFW as GLFW
import Data.IORef
import System.IO.Unsafe
import Control.DeepSeq
import Antiqua.Common

import Graphics.Rendering.OpenGL.Raw
import Data.Bits ( (.|.) )
import System.Exit ( exitWith, ExitCode(..) )

initGL :: GLFW.Window -> IO ()
initGL win = do
    glEnable gl_TEXTURE_2D
    glShadeModel gl_SMOOTH
    glClearColor 0 0 0 0
    glClearDepth 1
    glEnable gl_DEPTH_TEST
    glDepthFunc gl_LEQUAL
    glHint gl_PERSPECTIVE_CORRECTION_HINT gl_NICEST
    (w,h) <- GLFW.getFramebufferSize win
    glEnable gl_BLEND
    glBlendFunc gl_SRC_ALPHA gl_ONE_MINUS_SRC_ALPHA
    resizeScene win w h



resizeScene :: GLFW.WindowSizeCallback
resizeScene win w 0 = resizeScene win w 1
resizeScene _ w h = do
    glViewport 0 0 (fromIntegral w) (fromIntegral h)
    glMatrixMode gl_PROJECTION
    glLoadIdentity
    glOrtho 0 (fromIntegral w) (fromIntegral h) 0 0.1 100
    glMatrixMode gl_MODELVIEW
    glLoadIdentity
    glFlush

drawScene :: GLuint -> IO () -> IO ()
drawScene tex render = do
    glClear $ fromIntegral  $  gl_COLOR_BUFFER_BIT
                           .|. gl_DEPTH_BUFFER_BIT
    glLoadIdentity
    glTranslatef 0 0 (-5)
    glBindTexture gl_TEXTURE_2D tex

    render

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

{-# NOINLINE scrollRef #-}
scrollRef :: IORef Int
scrollRef = unsafePerformIO $ newIORef 0

resetScroll :: IO ()
resetScroll = do
    atomicModifyIORef scrollRef (\_ -> (0,()))

getScroll :: IO Int
getScroll = do
    state <- readIORef scrollRef
    return state

scroll :: GLFW.ScrollCallback
scroll _ _ dy = do
    let y = (floor . signum) dy
    a <- atomicModifyIORef scrollRef (\_ -> (y,()))
    a `deepseq` return ()

windowClosed :: GLFW.WindowCloseCallback
windowClosed win = shutdown win

class WindowSettings where
    width :: Int
    height :: Int
    title :: String

createWindow :: WindowSettings => IO Window
createWindow = do
    True <- GLFW.init
    GLFW.defaultWindowHints
    Just win <- GLFW.createWindow width height title Nothing Nothing
    GLFW.makeContextCurrent (Just win)
    GLFW.setScrollCallback win (Just scroll)
    initGL win
    GLFW.setWindowCloseCallback win (Just windowClosed)
    GLFW.setFramebufferSizeCallback win (Just resizeScene)
    GLFW.setKeyCallback win (Just keyPressed)
    return $ Window win

data Window = Window GLFW.Window

getKey :: Window -> GLFW.Key -> IO GLFW.KeyState
getKey (Window win) key = GLFW.getKey win key

useWindow :: Window -> Texture -> IO () -> IO ()
useWindow (Window win) text action = do
    GLFW.pollEvents
    drawScene text action
    GLFW.swapBuffers win
