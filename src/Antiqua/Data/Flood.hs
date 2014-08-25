module Antiqua.Data.Flood(
    flood,
    floodAll
) where

import Control.Applicative
import Antiqua.Data.Graph
import qualified Data.Set as Set

data Flood a = Flood (Set.Set a) -- currently filled region
                     [a]         -- stack of nodes to branch from

mkFlood :: Ord a => a -> Flood a
mkFlood x = Flood (Set.singleton x) [x]

flood :: (Graph a c, Ord c)
      => a         -- ^ the graph to be flooded
      -> c         -- ^ the seed coordinate
      -> Set.Set c -- ^ the resulting flooded region
flood gr c = floodHelper gr (mkFlood c)

floodHelper :: (Graph a c, Ord c)
            => a
            -> Flood c
            -> Set.Set c
floodHelper gr (Flood filled []) = filled
floodHelper gr (Flood filled (x:rest)) =
    floodHelper gr (Flood full q)
    where q = ns ++ rest
          ns = filter seen (fst <$> neighbors gr x)
          full = Set.union filled (Set.fromList ns)
          seen x = Set.notMember x filled

floodAll :: (Graph a c, Ord c)
         => a           -- ^ the graph to be flooded
         -> Set.Set c   -- ^ the set of all "open" nodes
         -> [Set.Set c] -- ^ a list of flooded regions
floodAll gr open = floodAllHelper gr open []

floodAllHelper :: (Graph a c, Ord c)
               => a
               -> Set.Set c
               -> [Set.Set c]
               -> [Set.Set c]
floodAllHelper gr open sofar =
    case Set.minView open of
        Just (x, _) -> let filled = flood gr x in
                       let newOpen = Set.difference open filled in
                       floodAllHelper gr newOpen (filled:sofar)
        Nothing -> sofar
