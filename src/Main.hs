module Main where

import Antiqua.Graphics.Window
import Antiqua.Graphics.Renderer
import Antiqua.Graphics.TileRenderer
import Antiqua.Common
import qualified Graphics.UI.GLFW as GLFW
import qualified Antiqua.Control.Concurrent.Updater as Up
class Control a where
    update :: a -> GLFW.Window -> IO a
    isPressed :: a -> Bool
    justPressed :: a -> Bool
    justReleased :: a -> Bool
    zips :: a -> Int -> Int -> Bool

class Trigger t where
    tisPressed :: t ->  GLFW.Window ->IO Bool

data AnyTrigger = KeyTrigger GLFW.Key
               -- | JoyTrigger
instance Trigger AnyTrigger where
    tisPressed (KeyTrigger a) win = do
        state <- GLFW.getKey win a
        return $ state == GLFW.KeyState'Pressed


data TriggerAggregate where
    TriggerAggregate :: Int -> Int -> [AnyTrigger] -> TriggerAggregate
getFlag :: TriggerAggregate -> Int
getFlag (TriggerAggregate _ flag _) = flag

getPrev :: TriggerAggregate -> Int
getPrev (TriggerAggregate prev _ _) = prev

instance Control TriggerAggregate where
    update (TriggerAggregate _ flag ts) win = do
        let np = flag
        ps <- mapM ((flip tisPressed) win) ts
        let nf = if any id ps
                 then flag + 1
                 else 0
        return $ TriggerAggregate np nf ts
    isPressed ta = getFlag ta > 0
    justPressed ta = getFlag ta > 0 && getPrev ta == 0
    justReleased ta = getFlag ta == 0 && getPrev ta > 0
    zips ta start inc =
        let flag = getFlag ta in
        justPressed ta || (flag > start && flag `mod` inc == 0)

data Controls a where
    Controls :: Control a => [a] -> Controls a


getInput :: Controls a -> GLFW.Window -> IO (Controls a)
getInput (Controls xs) win = do
    updated <- mapM ((flip update) win) xs
    return (Controls updated)


getDraw :: Drawable d => d -> Texture -> IO ()
getDraw d tex = do
    draw d tex



loop :: (Up.Updater u, Drawable u) => Controls a -> GLFW.Window -> u -> Texture -> IO ()
loop controls win state tex = do
    newControls <- getInput controls win
    let ren = getDraw state tex
    newState <- Up.get state
    useWindow win ren
    loop newControls win newState tex


data GameState = GameState

instance Up.Updatable GameState where
    update = return . id

class Drawable a where
    draw :: a -> (Texture -> IO ())

instance Drawable a => Drawable (Up.AsyncUpdater a) where
    draw (Up.AsyncUpdater w _) tex = draw w tex

instance Drawable GameState where
    draw GameState tex = do
        let ts = Tileset 16 16 16 16
        let ren = Renderer tex ts
        let tr :: TR XY (Tile Int)
            tr = empty <+ ((0,0), Tile 11 black red)
                       <+ ((0,1), Tile 12 red white)
        render ren tr


main :: IO ()
main = do
    win <- initWindow 256 256 "Antiqua Prime"
    let controls = Controls [] :: Controls TriggerAggregate
    tex <- loadGLTextures
    gs <- Up.mkUpdater GameState
    loop controls win gs tex
