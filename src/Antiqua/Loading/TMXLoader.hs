module Antiqua.Loading.TMXLoader where

import Control.Applicative
import Data.List
import Text.XML.Light
import qualified Data.Text as T

import qualified Antiqua.Data.Array2d as A2D

data TMXMap = TMXMap MapSpec [Tileset] [Layer]
data MapSpec = MapSpec String String Int Int Int Int deriving Show
data Tileset = Tileset Int String Int Int deriving Show
data Layer = Layer String Int Int (A2D.Array2d Int) deriving Show

getVal :: String -> [Attr] -> String
getVal s as =
    let (Just f) = find ((==) s . qName . attrKey) as in
    attrVal f

loadMapSpec :: Element -> MapSpec
loadMapSpec el =
    let a = elAttribs el in
    let loadInt s = (read . (getVal s)) a :: Int in
    let version = getVal "version" a
        orientation = getVal "orientation" a
        height = loadInt "height"
        width = loadInt "width"
        tileheight = loadInt "tileheight"
        tilewidth = loadInt "tilewidth"
    in
    MapSpec version orientation height width tileheight tilewidth

trim :: String -> String
trim = T.unpack . T.strip . T.pack

split :: String -> String -> [String]
split s str = T.unpack <$> (T.splitOn (T.pack s) . T.pack) str

loadTileset :: Element -> Tileset
loadTileset el =
    let a = elAttribs el in
    let loadInt s = (read . (getVal s)) a :: Int in
    let firstgid = loadInt "firstgid"
        name = getVal "name" a
        tilewidth = loadInt "tilewidth"
        tileheight = loadInt "tileheight"
    in
    Tileset firstgid name tilewidth tileheight

parseCSV :: Int -> Int -> String -> A2D.Array2d Int
parseCSV cols rows s =
    let trimmed = trim s in
    let ls = lines trimmed in
    let splitted = split "," <$> ls in
    A2D.tabulate cols rows (\(x, y) -> read $ splitted !! y !! x :: Int)

loadLayer :: Element -> Layer
loadLayer el =
    let a = elAttribs el in
    let loadInt s = (read . (getVal s)) a :: Int in
    let name = getVal "name" a
        width = loadInt "width"
        height = loadInt "height"
    in
    let (Just data') = findChild (QName "data" Nothing Nothing) el in
    let cts = elContent data' in
    let ct = concat $ (cdData) <$> onlyText  cts in
    Layer name width height (parseCSV width height ct)

loadTmx :: String -> IO TMXMap
loadTmx s = do
    contents <- readFile s
    let (Just xml) = parseXMLDoc contents
    let a = loadMapSpec xml
    let tss = findChildren (QName "tileset" Nothing Nothing) xml
    let myts = loadTileset <$> tss
    let lays = findChildren (QName "layer" Nothing Nothing) xml
    let mylays = loadLayer <$> lays
    return $ TMXMap a myts mylays
