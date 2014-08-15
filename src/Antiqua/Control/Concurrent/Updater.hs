module Antiqua.Control.Concurrent.Updater where

import Control.Exception hiding (handle)
import Control.Concurrent.Async

import Antiqua.Game

class Updater a b where
    get :: a -> b -> IO a

data AsyncUpdater a = AsyncUpdater a (Async a)

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




