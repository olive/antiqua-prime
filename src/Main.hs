module Main where

import Antiqua.Graphics.Window
import Antiqua.Graphics.Renderer
import Antiqua.Graphics.TileRenderer
import Antiqua.Common
import qualified Antiqua.Control.Concurrent.Updater as Up
import Antiqua.Graphics.Assets
import Antiqua.Input.Controls

getInput :: Controls a -> Window -> IO (Controls a)
getInput (Controls xs) win = do
    updated <- mapM ((flip update) win) xs
    return (Controls updated)


loop :: (Up.Updater u, Drawable u)
     => Controls a
     -> Window
     -> u
     -> Texture
     -> IO ()
loop controls win state tex = do
    newControls <- getInput controls win
    let ren = draw state tex
    newState <- Up.get state
    useWindow win tex ren
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
    win <- createWindow 256 256 "Antiqua Prime"
    let controls = Controls [] :: Controls TriggerAggregate
    tex <- loadTexture "C:/Users/M/Desktop/16x16.png"
    gs <- Up.mkUpdater GameState
    loop controls win gs tex
