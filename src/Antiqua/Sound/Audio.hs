module Antiqua.Sound.Audio where

import Control.Applicative((<$>))
import qualified Graphics.Rendering.OpenGL.GL.StateVar as SV
import qualified Sound.OpenAL as AL
import qualified Sound.ALUT.Loaders as AL
import qualified Sound.ALUT.Initialization as AL
import qualified Data.Map as Map
import Data.Maybe

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


runAudio :: IO () -> IO ()
runAudio action =
    AL.withProgNameAndArgs AL.runALUTUsingCurrentContext  $ \_ _ ->
     do
        (Just device) <- AL.openDevice Nothing
        (Just context) <- AL.createContext device []
        AL.currentContext AL.$= Just context
        let am = mkAudioManager
        am' <- load am A'Thing "C:/Users/M/Desktop/freealut-bin/file1.wav"
        play am' A'Thing
        action
        AL.closeDevice device
        return ()
