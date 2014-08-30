module Antiqua.Geometry.Line where

import Antiqua.Common
import Control.Applicative ((<$>), (<*>))
import Data.STRef
import Control.Monad.ST
import Control.Monad
import Data.Bits

type Line = (XY, XY)


bresenham :: XY -> XY -> [XY]
bresenham (sx, sy) (ex, ey) = runST $ do
    let get = readSTRef
    let modr = modifySTRef'
    let new = newSTRef
    let modr2 ref f oref = do
          o <- get oref
          modr ref (f o)
    let (-=) r1 r2 = modr2 r1 (-) r2
    let (+=) r1 r2 = modr2 r1 (+) r2
    let ($=) ref v = writeSTRef ref v
    startX <- new sx
    startY <- new sy
    let w = ex - sx
    let h = ey - sy
    dx1 <- new 0
    dy1 <- new 0
    dx2 <- new 0
    dy2 <- new 0
    if (w < 0)
    then do dx1 $= (-1)
            dx2 $= (-1)
    else do dx1 $= 1
            dx2 $= 1

    if (h < 0)
    then dy1 $= (-1)
    else dy1 $= 1

    longest <- new (abs w)
    shortest <- new (abs h)
    b <- do
        l <- get longest
        s <- get shortest
        return $ l < s
    if b
    then do longest  $= (abs h)
            shortest $= (abs w)
            if (h < 0)
            then dy2 $= (-1)
            else if (h > 0)
            then dy2 $= 1
            else dy2 $= 0
            dx2 $= 0
    else modr dx2 (+0)
    l <- get longest
    numerator <- new (l `shiftR` 1)
    longestv <- get longest
    forM [0..longestv-1] $ \_ -> do
        point <- (,) <$> get startX <*> get startY
        numerator += shortest
        num <- get numerator
        lon <- get longest
        if (num > lon)
        then do numerator -= longest
                startX += dx1
                startY += dy1
        else do startX += dx2
                startY += dy2
        return point

intersect :: Line -> Line -> Maybe (Double, Double)
intersect ((s1x, s1y), (s2x, s2y)) ((e1x, e1y), (e2x, e2y)) =
    let s10x = s2x - s1x in
    let s10y = s2y - s1y in
    let s32x = e2x - e1x in
    let s32y = e2y - e1y in
    let denom = s10x * s32y - s32x * s10y in
    let denomPositive = denom > 0 in
    let s02x = s1x - e1x in
    let s02y = s1y - e1y in
    let sNumer = s10x*s02y - s10y*s02x in
    let tNumer = s32x*s02y - s32y*s02x in
    let t = fromIntegral tNumer / fromIntegral denom in
    --  laziness ftw
    if denom == 0 ||
       (sNumer < 0) == denomPositive ||
       (tNumer < 0) == denomPositive ||
       ((sNumer > denom) == denomPositive) ||
       ((tNumer > denom) == denomPositive)
    then Nothing
    else Just (fromIntegral s1x + t*fromIntegral s10x,
               fromIntegral s1y + t*fromIntegral s10y)

getAdjacent :: Line -> XY -> Maybe Line
getAdjacent (p, q) pt
    | pt == p = Just (p, q)
    | pt == q = Just (q, p)
    | otherwise = Nothing
