module Main where

import Antiqua.Sound.Audio
import Antiqua.Graphics.Window
import Antiqua.Common()
import Antiqua.Graphics.Color()
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
import qualified Graphics.UI.GLFW as GLFW
import Antiqua.Geometry.Line()
data GameState = GameState (Animation CP437) (Animation CP437) Bool

instance Drawable GameState where
    draw (GameState anim1 anim2 which) tex = do
        let ts = Tileset 16 16 16 16
        let ren = Renderer tex ts
        let a = if which then anim1 else anim2
        let tr :: TR XY (Tile CP437)
            tr = empty <+ ((0,0), Tile (:☺) black red)
                       <+ ((0,1), Tile C'B red white)
                       <# ((10,10), a)
        render ren tr

instance (C.Control a, RandomGen rng) => Game GameState (C.Controls a, Assets, Window) rng where
    runFrame g@(GameState a b _) (ctrl, _, _) rng = do
        runRand (thing g) rng
        where thing :: (rng' ~ rng) => GameState -> Rand rng' GameState
              thing _ = do
                  let isPressed = C.isPressed $ C.firstGet ctrl
                  _ :: Int <- getRandomR (0, 10)
                  return $ (GameState (update a) (update b) isPressed)


mainLoop :: IO ()
mainLoop = do
    win <- createWindow 512 512 "Antiqua Prime"
    let controls = C.Controls [C.mkTriggerAggregate [C.KeyTrigger GLFW.Key'Space]] :: C.Controls C.TriggerAggregate
    tex <- loadTexture "../16x16.png"
    let assets = undefined :: Assets
    let anim1 = (mkAnimation [(5, Tile (:☺) black white), (5, Tile (:☺) white black)])
    let anim2 = (mkAnimation [(5, Tile (:☺) black red), (5, Tile (:☺) red black)])
    let state = GameState anim1 anim2 False
    rng <- getStdGen
    gs <- mkUpdater state (controls, assets, win) rng
    loop controls win gs tex rng

main :: IO ()
main = do
    runAudio mainLoop




