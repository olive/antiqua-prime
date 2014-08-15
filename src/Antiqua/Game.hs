module Antiqua.Game where
import Antiqua.Common

class Drawable a where
    draw :: a -> (Texture -> IO ())

class Game g a where
    runFrame :: g -> a -> g
