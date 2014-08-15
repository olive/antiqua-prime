module Main where

import Antiqua.Graphics.Window
import Antiqua.Graphics.Renderer
import Antiqua.Graphics.TileRenderer
import Antiqua.Common
import qualified Antiqua.Control.Concurrent.Updater as Up
import Antiqua.Graphics.Assets
import Antiqua.Graphics.Tile
import Antiqua.Input.Controls
import Antiqua.Game
import Antiqua.Data.CP437

getInput :: Controls a -> Window -> IO (Controls a)
getInput (Controls xs) win = do
    updated <- mapM ((flip update) win) xs
    return (Controls updated)



loop :: (Drawable g, Game g (Controls a, Assets, Window))
     => Controls a
     -> Window
     -> Up.AsyncUpdater g
     -> Texture
     -> IO ()
loop controls win state tex = do
    newControls <- getInput controls win
    let assets = undefined :: Assets
    let ren = draw state tex
    newState <- Up.get state (newControls, assets, win)
    useWindow win tex ren
    loop newControls win newState tex


data GameState = GameState

instance Drawable GameState where
    draw GameState tex = do
        let ts = Tileset 16 16 16 16
        let ren = Renderer tex ts
        let tr :: TR XY (Tile CP437)
            tr = empty <+ ((0,0), Tile C'A black red)
                       <+ ((0,1), Tile C'B red white)
        render ren tr

instance Game GameState b where
    runFrame g _ = g

main :: IO ()
main = do
    win <- createWindow 256 256 "Antiqua Prime"
    let controls = Controls [] :: Controls TriggerAggregate
    tex <- loadTexture "C:/Users/M/Desktop/16x16.png"
    let assets = undefined :: Assets
    let state = GameState
    gs <- Up.mkUpdater state (controls, assets, win)
    loop controls win gs tex
