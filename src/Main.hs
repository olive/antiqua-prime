module Main where

import Antiqua.Sound.Audio
import Antiqua.Graphics.Window
import Antiqua.Common()
import Antiqua.Graphics.Assets
import Antiqua.Input.Controls
import Antiqua.Game
import Antiqua.Graphics.Renderer
import Antiqua.Graphics.TileRenderer
import Antiqua.Graphics.Tile
import Antiqua.Data.CP437
import Antiqua.Common

import Control.Monad.Random

data GameState = GameState

instance Drawable GameState where
    draw GameState tex = do
        let ts = Tileset 16 16 16 16
        let ren = Renderer tex ts
        let tr :: TR XY (Tile CP437)
            tr = empty <+ ((0,0), Tile C'A black red)
                       <+ ((0,1), Tile C'B red white)
        render ren tr

instance RandomGen rng => Game GameState (Controls a, Assets, Window) rng where
    runFrame g _ rng =
        runRand (thing g) rng
        where thing :: (rng' ~ rng) => GameState -> Rand rng' GameState
              thing gs = do
                  _ :: Int <- getRandomR (0, 10)
                  return gs


mainLoop :: IO ()
mainLoop = do
    win <- createWindow 256 256 "Antiqua Prime"
    let controls = Controls [] :: Controls TriggerAggregate
    tex <- loadTexture "../16x16.png"
    let assets = undefined :: Assets
    let state = GameState
    rng <- getStdGen
    gs <- mkUpdater state (controls, assets, win) rng
    loop controls win gs tex rng

main :: IO ()
main = do
    runAudio $  mainLoop




