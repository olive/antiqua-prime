module Antiqua.Input.Controls where

import qualified Graphics.UI.GLFW as GLFW

import Antiqua.Graphics.Window

class Control a where
    update :: a -> Window -> IO a
    isPressed :: a -> Bool
    justPressed :: a -> Bool
    justReleased :: a -> Bool
    zips :: a -> Int -> Int -> Bool

class Trigger t where
    tisPressed :: t ->  Window ->IO Bool

data AnyTrigger = KeyTrigger GLFW.Key
               -- | JoyTrigger
instance Trigger AnyTrigger where
    tisPressed (KeyTrigger a) win = do
        state <- getKey win a
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

