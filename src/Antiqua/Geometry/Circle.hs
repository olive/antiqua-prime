module Antiqua.Geometry.Circle where

import Data.STRef
import Control.Applicative
import Control.Monad.ST
import Antiqua.Common

bresenham :: XY -> Int -> [XY]
bresenham (x0, y0) r =  runST $ do
    x <- newSTRef r
    y <- newSTRef 0
    rError <- newSTRef (1 - r)
    list <- newSTRef []
    let (+$=) ls (i, j) = modifySTRef' ls ((i + x0, j + y0):)
    let go = do xx <- readSTRef x
                yy <- readSTRef y
                if (xx < yy)
                then return list
                else do let pts = concat [[ (i, j) | i <- [-xx..xx], j <- [-yy,yy]]
                                         ,[ (j, i) | i <- [-xx,xx], j <- [-yy..yy]]
                                         ]
                        sequence $ ((+$=) list) <$> pts
                        modifySTRef' y (+1)
                        re <- readSTRef rError
                        if (re < 0)
                        then do modifySTRef' rError ((+) (2*yy + 1))
                        else do modifySTRef' x (subtract 1)
                                modifySTRef' rError ((+) (2*(yy - xx + 1)))
                        go

    g <- go
    readSTRef g

