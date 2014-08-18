module Antiqua.Game where

import Control.Exception hiding (handle)
import Control.Concurrent.Async
import Antiqua.Common
import Antiqua.Input.Controls
import Antiqua.Graphics.Window
import Antiqua.Graphics.Assets

class Updater a b rng where
    get :: a -> b -> rng -> IO (a, rng)

data AsyncUpdater a = AsyncUpdater a (Async a)


class Drawable a where
    draw :: a -> (Texture{-Assets-} -> IO ())

class Game g a rng where
    runFrame :: g -> a -> rng -> (g, rng)

mkUpdater :: Game a b rng => a -> b -> rng -> IO (AsyncUpdater (a, rng))
mkUpdater w b rng = do
    next <- async $ return $ runFrame w b rng
    return $ AsyncUpdater (w,rng) next


instance Game a b rng => Updater (AsyncUpdater (a, rng)) b rng where
    get as@(AsyncUpdater _ f) args _ = do
        let handle :: (a ~ c)
                   => Async (c, rng)
                   -> Maybe (Either SomeException (c, rng))
                   -> IO (AsyncUpdater (c, rng))
            handle _ Nothing = return as
            handle _ (Just (Right (w, g'))) = do
                nf <- async $ return $ runFrame w args g'
                return $ AsyncUpdater (w, g') nf
            handle _ (Just (Left e)) = error ("Error in async update: " ++ show e)
        p <- poll f
        a@(AsyncUpdater (_, g') _) <- handle f p
        return (a, g')

instance Drawable a => Drawable (AsyncUpdater (a, rng)) where
    draw (AsyncUpdater (w, _) _) tex = draw w tex



loop :: (Controls a, Drawable g, Game g (a, Assets, Window) rng)
     => a
     -> Window
     -> AsyncUpdater (g, rng)
     -> Texture
     -> rng
     -> IO ()
loop controls win state tex g = do
    newControls <- updateControls controls win
    let assets = undefined :: Assets
    let ren = draw state tex
    (newState, newRng) <- get state (newControls, assets, win) g
    resetScroll
    useWindow win tex ren
    loop newControls win newState tex newRng
