module Antiqua.Data.Flood(
    flood,
    floodFind,
    floodAll
) where

import Control.Applicative
import Antiqua.Data.Graph
import qualified Data.Set as Set
import qualified Data.Sequence as Seq

data Flood a = Flood (Set.Set a) -- currently filled region
                     (Seq.Seq a) -- queue of nodes to branch from

mkFlood :: Ord a => a -> Flood a
mkFlood x = Flood (Set.singleton x) (Seq.singleton x)

flood :: (Graph a c, Ord c)
      => a         -- ^ the graph to be flooded
      -> c         -- ^ the seed coordinate
      -> Set.Set c -- ^ the resulting flooded region
flood gr c =
   (snd . floodHelper c gr) (mkFlood c)

floodFind :: (Graph a c, Ord c)
          => a -- ^ the graph to be flooded
          -> c -- ^ the seed coordinate
          -> c -- ^ the last point to be flooded
floodFind gr c =
    (fst . floodHelper c gr) (mkFlood c)

floodHelper :: (Graph a c, Ord c)
            => c
            -> a
            -> Flood c
            -> (c, Set.Set c)
floodHelper s _ (Flood filled (Seq.viewl -> Seq.EmptyL)) = (s, filled)
floodHelper _ gr (Flood filled (Seq.viewl -> x Seq.:< rest)) =
    floodHelper x gr (Flood full q)
    where q = rest Seq.>< (Seq.fromList ns)
          ns = filter seen (fst <$> neighbors gr x)
          full = Set.union filled (Set.fromList ns)
          seen y = Set.notMember y filled

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
