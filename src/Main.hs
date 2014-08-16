module Main where

import Antiqua.Sound.Audio
import Antiqua.Graphics.Window
import Antiqua.Common()
import Antiqua.Graphics.Assets
import qualified Antiqua.Input.Controls as C
import Antiqua.Game
import Antiqua.Graphics.Renderer
import Antiqua.Graphics.TileRenderer
import Antiqua.Graphics.Tile
import Antiqua.Graphics.Animation
import Antiqua.Data.CP437
import Antiqua.Common
import Antiqua.Graphics.Rect()
import Control.Monad.Random
import Antiqua.Geometry.Line()
data GameState = GameState (Animation CP437)

instance Drawable GameState where
    draw (GameState anim) tex = do
        let ts = Tileset 16 16 16 16
        let ren = Renderer tex ts
        let tr :: TR XY (Tile CP437)
            tr = empty <+ ((0,0), Tile (:☺) black red)
                       <+ ((0,1), Tile C'B red white)
                       <# ((10,10), anim)
        render ren tr

instance RandomGen rng => Game GameState (C.Controls a, Assets, Window) rng where
    runFrame g@(GameState a) _ rng =
        runRand (thing g) rng
        where thing :: (rng' ~ rng) => GameState -> Rand rng' GameState
              thing gs = do
                  _ :: Int <- getRandomR (0, 10)
                  return $ (GameState $ update a)


mainLoop :: IO ()
mainLoop = do
    win <- createWindow 256 256 "Antiqua Prime"
    let controls = C.Controls [] :: C.Controls C.TriggerAggregate
    tex <- loadTexture "../16x16.png"
    let assets = undefined :: Assets
    let state = GameState (mkAnimation [(5, Tile (:☺) black white), (5, Tile (:☺) white black)])
    rng <- getStdGen
    gs <- mkUpdater state (controls, assets, win) rng
    loop controls win gs tex rng

main :: IO ()
main = do
    runAudio mainLoop




