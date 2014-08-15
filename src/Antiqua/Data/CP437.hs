module Antiqua.Data.CP437 where

import Antiqua.Common

data CP437 = C'InvSmile-- | ☺
           | C'Smile-- | ☻
           | C'Heart-- | ♥
           | C'Diamond-- | ♦
           | C'Club-- | ♣
           | C'Spade-- | ♠
           | C'Disc-- | ●
           | C'InvDisc-- | ◘
           | C'Circle-- | ◦
           | C'InvCircle-- | ◙
           | C'Mars-- | ♂
           | C'Venus-- | ♀
           | C'Note-- | ♪
           | C'DoubleNote-- | ♫
           | C'Sun-- | ☼
           | C'TriRight-- | ►
           | C'TriLeft-- | ◄
           | C'Vertical-- | ↕
           | C'DoubleExc-- | ‼
           | C'Pilcrow-- | ¶
           | C'Section-- | §
           | C'LowLine-- | ‗
           | C'Vertical2-- | ↨
           | C'Up-- | ↑
           | C'Down-- | ↓
           | C'Right-- | →
           | C'Left-- | ←
           | C'RightAngle-- | ∟
           | C'Horizontal-- | ↔
           | C'TriUp-- | ▲
           | C'TriDown-- | ▼
           | C'Space-- |
           | C'Exclamation-- | !
           | C'DoubleQuote-- | "
           | C'Hashtag-- | #
           | C'Dollar-- | $
           | C'Percent-- | %
           | C'And-- | &
           | C'Quote-- | '
           | C'OpenParen-- | (
           | C'CloseParen-- | )
           | C'Asterisk-- | *
           | C'Plus-- | +
           | C'Comma-- | ,
           | C'Minus-- | -
           | C'Period-- | .
           | C'Slash-- | /
           | C'0
           | C'1
           | C'2
           | C'3
           | C'4
           | C'5
           | C'6
           | C'7
           | C'8
           | C'9
           | C'Colon-- | :
           | C'Semi-- | ;
           | C'Less-- | <
           | C'Eq-- | =
           | C'Greater-- | >
           | C'Question-- | ?
           | C'At-- | @
           | C'A
           | C'B
           | C'C
           | C'D
           | C'E
           | C'F
           | C'G
           | C'H
           | C'I
           | C'J
           | C'K
           | C'L
           | C'M
           | C'N
           | C'O
           | C'P
           | C'Q
           | C'R
           | C'S
           | C'T
           | C'U
           | C'V
           | C'W
           | C'X
           | C'Y
           | C'Z
           | C'OpenSquare-- | [
           | C'Backslash-- | \
           | C'CloseSquare-- | ]
           | C'Caret-- | ^
           | C'_
           | C'Backquote -- | `
           | C'a
           | C'b
           | C'c
           | C'd
           | C'e
           | C'f
           | C'g
           | C'h
           | C'i
           | C'j
           | C'k
           | C'l
           | C'm
           | C'n
           | C'o
           | C'p
           | C'q
           | C'r
           | C's
           | C't
           | C'u
           | C'v
           | C'w
           | C'x
           | C'y
           | C'z
           | C'OpenCurly-- | {
           | C'Pipe-- | |
           | C'CloseCurly-- | }
           | C'Tilde-- | ~
           | C'House-- | ⌂
           | C'Ç
           | C'ü
           | C'é
           | C'â
           | C'ä
           | C'à
           | C'å
           | C'ç
           | C'ê
           | C'ë
           | C'è
           | C'ï
           | C'î
           | C'ì
           | C'Ä
           | C'Å
           | C'É
           | C'æ
           | C'Æ
           | C'ô
           | C'ö
           | C'ò
           | C'û
           | C'ù
           | C'ÿ
           | C'Ö
           | C'Ü
           | C'Cent-- | ¢
           | C'Pound-- | £
           | C'Yen-- | ¥
           | C'Peseta-- | ₧
           | C'ƒ
           | C'á
           | C'í
           | C'ó
           | C'ú
           | C'ñ
           | C'Ñ
           | C'Feminine-- | ª
           | C'Masculine-- | º
           | C'InvQuestion-- | ¿
           | C'InvNot-- | ⌐
           | C'Not-- | ¬
           | C'Half-- | ½
           | C'Fourth-- | ¼
           | C'InvExc-- | ¡
           | C'LeftAngle2-- | «
           | C'RightAngle2-- | »
        -- | ░
        -- | ▒
        -- | ▓
        -- | │
        -- | ┤
        -- | ╡
        -- | ╢
        -- | ╖
        -- | ╕
        -- | ╣
        -- | ║
        -- | ╗
        -- | ╝
        -- | ╜
        -- | ╛
        -- | ┐
        -- | └
        -- | ┴
        -- | ┬
        -- | ├
        -- | ─
        -- | ┼
        -- | ╞
        -- | ╟
        -- | ╚
        -- | ╔
        -- | ╩
        -- | ╦
        -- | ╠
        -- | ═
        -- | ╬
        -- | ╧
        -- | ╨
        -- | ╤
        -- | ╥
        -- | ╙
        -- | ╘
        -- | ╒
        -- | ╓
        -- | ╫
        -- | ╪
        -- | ┘
        -- | ┌
        -- | █
        -- | ▄
        -- | ▌
        -- | ▐
        -- | ▀
           | C'α
           | C'β
           | C'Γ
           | C'π
           | C'Σ
           | C'σ
           | C'μ
           | C'τ
           | C'Φ
           | C'Θ
           | C'Ω
           | C'δ
           | C'Inf-- | ∞
           | C'φ
           | C'ϵ
           | C'Intersect-- | ∩
           | C'TripleBar-- | ≡
           | C'PlusMinus-- | ±
           | C'GreaterEq-- | ≥
           | C'LessEq-- | ≤
           | C'IntegralTop-- | ⌠
           | C'IntegralBottom-- | ⌡
           | C'Obelus-- | ÷
           | C'ApproxEq-- | ≈
           | C'Degree-- | °
           | C'SmallSquare-- | ▪
           | C'Dot-- | ·
           | C'Check-- | √
           | C'Nth-- | ⁿ
           | C'Squared-- | ²
           | C'LargeSquare-- | ■

instance Code CP437 where
    getIndex C'InvSmile = 1
    getIndex C'Smile = 2
    getIndex C'Heart = 3
    getIndex C'Diamond = 4
    getIndex C'Club = 5
    getIndex C'Spade = 6
    getIndex C'Disc = 7
    getIndex C'InvDisc = 8
    getIndex C'Circle = 9
    getIndex C'InvCircle = 10
    getIndex C'Mars = 11
    getIndex C'Venus = 12
    getIndex C'Note = 13
    getIndex C'DoubleNote = 14
    getIndex C'Sun = 15
    getIndex C'TriRight = 16
    getIndex C'TriLeft = 17
    getIndex C'Vertical = 18
    getIndex C'DoubleExc = 19
    getIndex C'Pilcrow = 20
    getIndex C'Section = 21
    getIndex C'LowLine = 22
    getIndex C'Vertical2 = 23
    getIndex C'Up = 24
    getIndex C'Down = 25
    getIndex C'Right = 26
    getIndex C'Left = 27
    getIndex C'RightAngle = 28
    getIndex C'Horizontal = 29
    getIndex C'TriUp = 30
    getIndex C'TriDown = 31
    getIndex C'Space = 32
    getIndex C'Exclamation = 33
    getIndex C'DoubleQuote = 34
    getIndex C'Hashtag = 35
    getIndex C'Dollar = 36
    getIndex C'Percent = 37
    getIndex C'And = 38
    getIndex C'Quote = 39
    getIndex C'OpenParen = 40
    getIndex C'CloseParen = 41
    getIndex C'Asterisk = 42
    getIndex C'Plus = 43
    getIndex C'Comma = 44
    getIndex C'Minus = 45
    getIndex C'Period = 46
    getIndex C'Slash = 47
    getIndex C'0 = 48
    getIndex C'1 = 49
    getIndex C'2 = 50
    getIndex C'3 = 51
    getIndex C'4 = 52
    getIndex C'5 = 53
    getIndex C'6 = 54
    getIndex C'7 = 55
    getIndex C'8 = 56
    getIndex C'9 = 57
    getIndex C'Colon = 58
    getIndex C'Semi = 59
    getIndex C'Less = 60
    getIndex C'Eq = 61
    getIndex C'Greater = 62
    getIndex C'Question = 63
    getIndex C'At = 64
    getIndex C'A = 65
    getIndex C'B = 66
    getIndex C'C = 67
    getIndex C'D = 68
    getIndex C'E = 69
    getIndex C'F = 70
    getIndex C'G = 71
    getIndex C'H = 72
    getIndex C'I = 73
    getIndex C'J = 74
    getIndex C'K = 75
    getIndex C'L = 76
    getIndex C'M = 77
    getIndex C'N = 78
    getIndex C'O = 79
    getIndex C'P = 80
    getIndex C'Q = 81
    getIndex C'R = 82
    getIndex C'S = 83
    getIndex C'T = 84
    getIndex C'U = 85
    getIndex C'V = 86
    getIndex C'W = 87
    getIndex C'X = 88
    getIndex C'Y = 89
    getIndex C'Z = 90
    getIndex C'OpenSquare = 91
    getIndex C'Backslash = 92
    getIndex C'CloseSquare = 93
    getIndex C'Caret = 94
    getIndex C'_ = 95
    getIndex C'Backquote = 96
    getIndex C'a = 97
    getIndex C'b = 98
    getIndex C'c = 99
    getIndex C'd = 100
    getIndex C'e = 101
    getIndex C'f = 102
    getIndex C'g = 103
    getIndex C'h = 104
    getIndex C'i = 105
    getIndex C'j = 106
    getIndex C'k = 107
    getIndex C'l = 108
    getIndex C'm = 109
    getIndex C'n = 110
    getIndex C'o = 111
    getIndex C'p = 112
    getIndex C'q = 113
    getIndex C'r = 114
    getIndex C's = 115
    getIndex C't = 116
    getIndex C'u = 117
    getIndex C'v = 118
    getIndex C'w = 119
    getIndex C'x = 120
    getIndex C'y = 121
    getIndex C'z = 122
    getIndex C'OpenCurly = 123
    getIndex C'Pipe = 124
    getIndex C'CloseCurly = 125
    getIndex C'Tilde = 126
    getIndex C'House = 127
    getIndex C'Ç = 128
    getIndex C'ü = 129
    getIndex C'é = 130
    getIndex C'â = 131
    getIndex C'ä = 132
    getIndex C'à = 133
    getIndex C'å = 134
    getIndex C'ç = 135
    getIndex C'ê = 136
    getIndex C'ë = 137
    getIndex C'è = 138
    getIndex C'ï = 139
    getIndex C'î = 140
    getIndex C'ì = 141
    getIndex C'Ä = 142
    getIndex C'Å = 143
    getIndex C'É = 144
    getIndex C'æ = 145
    getIndex C'Æ = 146
    getIndex C'ô = 147
    getIndex C'ö = 148
    getIndex C'ò = 149
    getIndex C'û = 150
    getIndex C'ù = 151
    getIndex C'ÿ = 152
    getIndex C'Ö = 153
    getIndex C'Ü = 154
    getIndex C'Cent = 155
    getIndex C'Pound = 156
    getIndex C'Yen = 157
    getIndex C'Peseta = 158
    getIndex C'ƒ = 159
    getIndex C'á = 160
    getIndex C'í = 161
    getIndex C'ó = 162
    getIndex C'ú = 163
    getIndex C'ñ = 164
    getIndex C'Ñ = 165
    getIndex C'Feminine = 166
    getIndex C'Masculine = 167
    getIndex C'InvQuestion = 168
    getIndex C'InvNot = 169
    getIndex C'Not = 170
    getIndex C'Half = 171
    getIndex C'Fourth = 172
    getIndex C'InvExc = 173
    getIndex C'LeftAngle2 = 174
    getIndex C'RightAngle2 = 175
    getIndex C'α = 224
    getIndex C'β = 225
    getIndex C'Γ = 226
    getIndex C'π = 227
    getIndex C'Σ = 228
    getIndex C'σ = 229
    getIndex C'μ = 230
    getIndex C'τ = 231
    getIndex C'Φ = 232
    getIndex C'Θ = 233
    getIndex C'Ω = 234
    getIndex C'δ = 235
    getIndex C'Inf = 236
    getIndex C'φ = 237
    getIndex C'ϵ = 238
    getIndex C'Intersect = 239
    getIndex C'TripleBar = 240
    getIndex C'PlusMinus = 241
    getIndex C'GreaterEq = 242
    getIndex C'LessEq = 243
    getIndex C'IntegralTop = 244
    getIndex C'IntegralBottom = 245
    getIndex C'Obelus = 246
    getIndex C'ApproxEq = 247
    getIndex C'Degree = 248
    getIndex C'SmallSquare = 249
    getIndex C'Dot = 250
    getIndex C'Check = 251
    getIndex C'Nth = 252
    getIndex C'Squared = 253
    getIndex C'LargeSquare = 254
