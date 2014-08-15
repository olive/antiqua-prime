module Main where

import Antiqua.Graphics.Window
import qualified Graphics.UI.GLFW as GLFW

class Control a t where
    update :: a -> GLFW.Window -> IO a
    isPressed :: a -> t
    justPressed :: a -> t
    justReleased :: a -> t
    zips :: a -> Int -> Int -> t

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

instance Control (TriggerAggregate) Bool where
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
-- make controls an HList indexed by a
data Controls where
    Controls :: Control a k => [a] -> k -> Controls


getInput :: IO Controls
getInput = undefined

main :: IO ()
main = do
    win <- initWindow 256 256 "Antiqua Prime"
    useWindow win (return ())

