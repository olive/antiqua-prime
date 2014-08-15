module Antiqua.Graphics.Animation (
    Animation,
    mkAnimation,
    update,
    getFrame

) where

import Antiqua.Graphics.Tile

data Animation a = Animation [(Int, Tile a)] Int Int

mkAnimation :: [(Int, Tile a)] -> Animation a
mkAnimation frames = Animation frames 0 0

update :: Animation a -> Animation a
update (Animation frames ptr t)
    | t > fst (frames !! ptr) =
        let newPtr = (ptr + 1 + length frames) `mod` (length frames) in
        Animation frames newPtr 0
    | otherwise = (Animation frames ptr (t+1))

getFrame :: Animation a -> Tile a
getFrame (Animation frames ptr _) = snd $ frames !! ptr
