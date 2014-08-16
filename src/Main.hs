module Main where

import qualified Graphics.Rendering.OpenGL.GL.StateVar as SV
import qualified Sound.OpenAL as AL
import qualified Sound.ALUT.Loaders as AL
import qualified Sound.ALUT.Initialization as AL
import qualified Data.Map as Map
import Control.Monad
import Control.Applicative ((<$>))
import Data.Maybe


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

class Audio k a where
    setGlobalVolume :: a -> Double -> IO a
    getGlobalVolume :: a -> Double
    setVolume :: a -> k -> Double -> IO a
    getVolume :: a -> k -> IO Double
    load :: a -> k -> FilePath -> IO a
    play :: a -> k -> IO a
    pause :: a -> k -> IO a
    stop :: a -> k -> IO a
    setPos :: a -> k -> Double -> IO a
    isPlaying :: a -> k -> IO Bool

data AudioManager k t = AudioManager (Map.Map k t) Double
mkAudioManager :: AudioManager AudioKey AudioFile
mkAudioManager = AudioManager Map.empty 1
data AudioFile = AudioFile AudioKey AL.Source Bool
data AudioKey = A'Thing deriving (Ord, Eq)

getSource :: AudioFile -> AL.Source
getSource (AudioFile _ s _) = s

getAudio :: Ord k => AudioManager k t -> k -> Maybe t
getAudio (AudioManager mp _) k = Map.lookup k mp

putAudio :: Ord k => AudioManager k t -> k -> t -> AudioManager k t
putAudio (AudioManager mp v) k a = AudioManager (Map.insert k a mp) v

getSrc :: AudioFile -> AL.Source
getSrc (AudioFile _ src _) = src

getIsPlaying :: AudioFile -> Bool
getIsPlaying (AudioFile _ _ b) = b

setIsPlaying :: AudioFile -> Bool -> AudioFile
setIsPlaying (AudioFile kk src _) b = AudioFile kk src b

instance Audio AudioKey (AudioManager AudioKey AudioFile) where
    getGlobalVolume (AudioManager _ v) = v
    setGlobalVolume (AudioManager mp _) v2 = do
        AL.listenerGain AL.$= (realToFrac v2)
        return $ AudioManager mp v2
    setVolume am k v = do
        let vv = realToFrac v :: AL.ALfloat
        let _ = (setVol vv . getSrc) <$> getAudio am k
        return am
        where setVol vv src = do
                  let a = AL.sourceGain src
                  a AL.$= vv

    getVolume am k = do
        fromMaybe (return 0.0) $ getVol <$> getAudio am k
        where getVol af = do
                  r <- SV.get $ AL.sourceGain $ getSrc af
                  return $ realToFrac r
    load am k file = do
        buffer <- AL.createBuffer $ AL.File file
        [source] <- AL.genObjectNames 1
        AL.queueBuffers source [buffer]
        let audio = AudioFile k source False
        return $ putAudio am k audio
    play am k = do
        let maf = getAudio am k
        let a = play' <$> maf
        fromMaybe (return am) a
        where play' af = do
                  if getIsPlaying af
                  then return ()
                  else AL.play [getSrc af]
                  return $ putAudio am k $ setIsPlaying af True
    pause am k = do
        let maf = getAudio am k
        fromMaybe (return am) $ pause' <$> maf
        where pause' af = do
                  AL.pause [getSrc af]
                  let na = setIsPlaying af False
                  return $ putAudio am k na
    stop am k = do
        let maf = getAudio am k
        fromMaybe (return am) $ stop' <$> maf
        where stop' af = do
                  AL.stop [getSrc af]
                  let na = setIsPlaying af False
                  return $ putAudio am k na
    setPos am k pos = do
        let maf = getAudio am k
        fromMaybe (return am) $ setPos' <$> maf
        where setPos' af = do
                  let off = AL.secOffset $ getSrc af
                  off AL.$= (realToFrac pos)
                  return am


    isPlaying am k = do
        let maf = getAudio am k
        let isp = getIsPlaying <$> maf
        return $ fromMaybe False isp

mainLoop :: IO ()
mainLoop = do
    win <- createWindow 256 256 "Antiqua Prime"
    let controls = Controls [] :: Controls TriggerAggregate
    tex <- loadTexture "../16x16.png"
    let assets = undefined :: Assets
    let state = GameState
    gs <- Up.mkUpdater state (controls, assets, win)
    loop controls win gs tex

main :: IO ()
main = do
    AL.withProgNameAndArgs AL.runALUTUsingCurrentContext  $ \_ _ ->
     do
        (Just device) <- AL.openDevice Nothing
        (Just context) <- AL.createContext device []
        AL.currentContext AL.$= Just context
        let am = mkAudioManager
        am' <- load am A'Thing "C:/Users/M/Desktop/freealut-bin/file1.wav"
        play am' A'Thing
        mainLoop
        AL.closeDevice device
        return ()



