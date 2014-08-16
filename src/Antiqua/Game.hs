module Antiqua.Game where

import Control.Exception hiding (handle)
import Control.Concurrent.Async
import Control.Monad.Random
import Antiqua.Common
import Antiqua.Input.Controls
import Antiqua.Graphics.Window
import Antiqua.Graphics.Assets


class Updater a b where
    get :: a -> b -> IO a

data AsyncUpdater a = AsyncUpdater a (Async a)


class Drawable a where
    draw :: a -> (Texture{-Assets-} -> IO ())

class RandomGen rng => Game g a rng where
    runFrame :: g -> a -> Rand rng g

mkUpdater :: Game a b => a -> b -> IO (AsyncUpdater a)
mkUpdater w b = do
    next <- async $ return $ runFrame w b
    return $ AsyncUpdater w next

instance Game a b => Updater (AsyncUpdater a) b where
    get as@(AsyncUpdater s f) args = do
        let handle :: (a ~ c)
                   => c
                   -> Async c
                   -> Maybe (Either SomeException c)
                   -> IO (AsyncUpdater c)
            handle _ _ Nothing = return as
            handle _ _ (Just (Right w)) = do
                nf <- async $ return $ runFrame w args
                return $ AsyncUpdater w nf
            handle _ _ _ = error "not implemented"
        p <- poll f
        nau <- handle s f p
        return nau

instance Drawable a => Drawable (AsyncUpdater a) where
    draw (AsyncUpdater w _) tex = draw w tex

getInput :: Controls a -> Window -> IO (Controls a)
getInput (Controls xs) win = do
    updated <- mapM ((flip update) win) xs
    return (Controls updated)

loop :: (Drawable g, Game g (Controls a, Assets, Window))
     => Controls a
     -> Window
     -> AsyncUpdater g
     -> Texture
     -> IO ()
loop controls win state tex = do
    newControls <- getInput controls win
    let assets = undefined :: Assets
    let ren = draw state tex
    newState <- get state (newControls, assets, win)
    useWindow win tex ren
    loop newControls win newState tex
