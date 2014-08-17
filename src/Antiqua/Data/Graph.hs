module Antiqua.Data.Graph where

class Graph a c | a -> c where
    neighbors :: a -> c -> [(c, Float)]

