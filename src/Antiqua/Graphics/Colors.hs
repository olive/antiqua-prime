module Antiqua.Graphics.Colors(
    module Antiqua.Graphics.Colors,
    Color,
    rgb,
    dim,
    mult,
    mix
) where

import Antiqua.Graphics.Color

black :: Color
black = rgb 0 0 0

white :: Color
white = rgb 255 255 255

grey :: Color
grey = rgb 128 128 128

darkGrey :: Color
darkGrey = rgb 64 64 64

brown :: Color
brown = rgb 150 75 0

red :: Color
red = rgb 255 0 0

darkRed :: Color
darkRed = rgb 128 0 0

green :: Color
green = rgb 0 255 0

darkGreen :: Color
darkGreen = rgb 0 128 0

blue :: Color
blue = rgb 0 0 255

darkBlue :: Color
darkBlue = rgb 0 0 128

yellow :: Color
yellow = rgb 255 255 0
