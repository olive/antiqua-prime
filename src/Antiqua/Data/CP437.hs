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
           | (►)
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
           | C'Rogue-- | @
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
           | C'FadeLeast-- | ░
           | C'FadeLittle-- | ▒
           | C'Fade-- | ▓
           | C'Box1010-- | │
           | C'Box1011-- | ┤
           | C'Box1012-- | ╡
           | C'Box2021-- | ╢
           | C'Box0021-- | ╖
           | C'Box0012-- | ╕
           | C'Box2022-- | ╣
           | C'Box2020-- | ║
           | C'Box0022-- | ╗
           | C'Box2002-- | ╝
           | C'Box2001-- | ╜
           | C'Box1002-- | ╛
           | C'Box0011-- | ┐
           | C'Box1100-- | └
           | C'Box1101-- | ┴
           | C'Box0111-- | ┬
           | C'Box1110-- | ├
           | C'Box0101-- | ─
           | C'Box1111-- | ┼
           | C'Box1210-- | ╞
           | C'Box2120-- | ╟
           | C'Box2200-- | ╚
           | C'Box0220-- | ╔
           | C'Box2202-- | ╩
           | C'Box0222-- | ╦
           | C'Box2220-- | ╠
           | C'Box0202-- | ═
           | C'Box2222-- | ╬
           | C'Box1202-- | ╧
           | C'Box2101-- | ╨
           | C'Box0212-- | ╤
           | C'Box0121-- | ╥
           | C'Box2100-- | ╙
           | C'Box1200-- | ╘
           | C'Box0210-- | ╒
           | C'Box0120-- | ╓
           | C'Box2121-- | ╫
           | C'Box1212-- | ╪
           | C'Box1001-- | ┘
           | C'Box0110-- | ┌
           | C'Full-- | █
           | C'SolidDown-- | ▄
           | C'SolidRight-- | ▌
           | C'SolidLeft-- | ▐
           | C'SolidTop-- | ▀
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
    getIndex C'InvSmile       = 1
    getIndex C'Smile          = 2
    getIndex C'Heart          = 3
    getIndex C'Diamond        = 4
    getIndex C'Club           = 5
    getIndex C'Spade          = 6
    getIndex C'Disc           = 7
    getIndex C'InvDisc        = 8
    getIndex C'Circle         = 9
    getIndex C'InvCircle      = 10
    getIndex C'Mars           = 11
    getIndex C'Venus          = 12
    getIndex C'Note           = 13
    getIndex C'DoubleNote     = 14
    getIndex C'Sun            = 15
    getIndex C'TriRight       = 16
    getIndex C'TriLeft        = 17
    getIndex C'Vertical       = 18
    getIndex C'DoubleExc      = 19
    getIndex C'Pilcrow        = 20
    getIndex C'Section        = 21
    getIndex C'LowLine        = 22
    getIndex C'Vertical2      = 23
    getIndex C'Up             = 24
    getIndex C'Down           = 25
    getIndex C'Right          = 26
    getIndex C'Left           = 27
    getIndex C'RightAngle     = 28
    getIndex C'Horizontal     = 29
    getIndex C'TriUp          = 30
    getIndex C'TriDown        = 31
    getIndex C'Space          = 32
    getIndex C'Exclamation    = 33
    getIndex C'DoubleQuote    = 34
    getIndex C'Hashtag        = 35
    getIndex C'Dollar         = 36
    getIndex C'Percent        = 37
    getIndex C'And            = 38
    getIndex C'Quote          = 39
    getIndex C'OpenParen      = 40
    getIndex C'CloseParen     = 41
    getIndex C'Asterisk       = 42
    getIndex C'Plus           = 43
    getIndex C'Comma          = 44
    getIndex C'Minus          = 45
    getIndex C'Period         = 46
    getIndex C'Slash          = 47
    getIndex C'0              = 48
    getIndex C'1              = 49
    getIndex C'2              = 50
    getIndex C'3              = 51
    getIndex C'4              = 52
    getIndex C'5              = 53
    getIndex C'6              = 54
    getIndex C'7              = 55
    getIndex C'8              = 56
    getIndex C'9              = 57
    getIndex C'Colon          = 58
    getIndex C'Semi           = 59
    getIndex C'Less           = 60
    getIndex C'Eq             = 61
    getIndex C'Greater        = 62
    getIndex C'Question       = 63
    getIndex C'Rogue          = 64
    getIndex C'A              = 65
    getIndex C'B              = 66
    getIndex C'C              = 67
    getIndex C'D              = 68
    getIndex C'E              = 69
    getIndex C'F              = 70
    getIndex C'G              = 71
    getIndex C'H              = 72
    getIndex C'I              = 73
    getIndex C'J              = 74
    getIndex C'K              = 75
    getIndex C'L              = 76
    getIndex C'M              = 77
    getIndex C'N              = 78
    getIndex C'O              = 79
    getIndex C'P              = 80
    getIndex C'Q              = 81
    getIndex C'R              = 82
    getIndex C'S              = 83
    getIndex C'T              = 84
    getIndex C'U              = 85
    getIndex C'V              = 86
    getIndex C'W              = 87
    getIndex C'X              = 88
    getIndex C'Y              = 89
    getIndex C'Z              = 90
    getIndex C'OpenSquare     = 91
    getIndex C'Backslash      = 92
    getIndex C'CloseSquare    = 93
    getIndex C'Caret          = 94
    getIndex C'_              = 95
    getIndex C'Backquote      = 96
    getIndex C'a              = 97
    getIndex C'b              = 98
    getIndex C'c              = 99
    getIndex C'd              = 100
    getIndex C'e              = 101
    getIndex C'f              = 102
    getIndex C'g              = 103
    getIndex C'h              = 104
    getIndex C'i              = 105
    getIndex C'j              = 106
    getIndex C'k              = 107
    getIndex C'l              = 108
    getIndex C'm              = 109
    getIndex C'n              = 110
    getIndex C'o              = 111
    getIndex C'p              = 112
    getIndex C'q              = 113
    getIndex C'r              = 114
    getIndex C's              = 115
    getIndex C't              = 116
    getIndex C'u              = 117
    getIndex C'v              = 118
    getIndex C'w              = 119
    getIndex C'x              = 120
    getIndex C'y              = 121
    getIndex C'z              = 122
    getIndex C'OpenCurly      = 123
    getIndex C'Pipe           = 124
    getIndex C'CloseCurly     = 125
    getIndex C'Tilde          = 126
    getIndex C'House          = 127
    getIndex C'Ç              = 128
    getIndex C'ü              = 129
    getIndex C'é              = 130
    getIndex C'â              = 131
    getIndex C'ä              = 132
    getIndex C'à              = 133
    getIndex C'å              = 134
    getIndex C'ç              = 135
    getIndex C'ê              = 136
    getIndex C'ë              = 137
    getIndex C'è              = 138
    getIndex C'ï              = 139
    getIndex C'î              = 140
    getIndex C'ì              = 141
    getIndex C'Ä              = 142
    getIndex C'Å              = 143
    getIndex C'É              = 144
    getIndex C'æ              = 145
    getIndex C'Æ              = 146
    getIndex C'ô              = 147
    getIndex C'ö              = 148
    getIndex C'ò              = 149
    getIndex C'û              = 150
    getIndex C'ù              = 151
    getIndex C'ÿ              = 152
    getIndex C'Ö              = 153
    getIndex C'Ü              = 154
    getIndex C'Cent           = 155
    getIndex C'Pound          = 156
    getIndex C'Yen            = 157
    getIndex C'Peseta         = 158
    getIndex C'ƒ              = 159
    getIndex C'á              = 160
    getIndex C'í              = 161
    getIndex C'ó              = 162
    getIndex C'ú              = 163
    getIndex C'ñ              = 164
    getIndex C'Ñ              = 165
    getIndex C'Feminine       = 166
    getIndex C'Masculine      = 167
    getIndex C'InvQuestion    = 168
    getIndex C'InvNot         = 169
    getIndex C'Not            = 170
    getIndex C'Half           = 171
    getIndex C'Fourth         = 172
    getIndex C'InvExc         = 173
    getIndex C'LeftAngle2     = 174
    getIndex C'RightAngle2    = 175
    getIndex C'FadeLeast      = 176
    getIndex C'FadeLittle     = 177
    getIndex C'Fade           = 178
    getIndex C'Box1010        = 179
    getIndex C'Box1011        = 180
    getIndex C'Box1012        = 181
    getIndex C'Box2021        = 182
    getIndex C'Box0021        = 183
    getIndex C'Box0012        = 184
    getIndex C'Box2022        = 185
    getIndex C'Box2020        = 186
    getIndex C'Box0022        = 187
    getIndex C'Box2002        = 188
    getIndex C'Box2001        = 189
    getIndex C'Box1002        = 190
    getIndex C'Box0011        = 191
    getIndex C'Box1100        = 192
    getIndex C'Box1101        = 193
    getIndex C'Box0111        = 194
    getIndex C'Box1110        = 195
    getIndex C'Box0101        = 196
    getIndex C'Box1111        = 197
    getIndex C'Box1210        = 198
    getIndex C'Box2120        = 199
    getIndex C'Box2200        = 200
    getIndex C'Box0220        = 201
    getIndex C'Box2202        = 202
    getIndex C'Box0222        = 203
    getIndex C'Box2220        = 204
    getIndex C'Box0202        = 205
    getIndex C'Box2222        = 206
    getIndex C'Box1202        = 207
    getIndex C'Box2101        = 208
    getIndex C'Box0212        = 209
    getIndex C'Box0121        = 210
    getIndex C'Box2100        = 211
    getIndex C'Box1200        = 212
    getIndex C'Box0210        = 213
    getIndex C'Box0120        = 214
    getIndex C'Box2121        = 215
    getIndex C'Box1212        = 216
    getIndex C'Box1001        = 217
    getIndex C'Box0110        = 218
    getIndex C'Full           = 219
    getIndex C'SolidDown      = 220
    getIndex C'SolidRight     = 221
    getIndex C'SolidLeft      = 222
    getIndex C'SolidTop       = 223
    getIndex C'α              = 224
    getIndex C'β              = 225
    getIndex C'Γ              = 226
    getIndex C'π              = 227
    getIndex C'Σ              = 228
    getIndex C'σ              = 229
    getIndex C'μ              = 230
    getIndex C'τ              = 231
    getIndex C'Φ              = 232
    getIndex C'Θ              = 233
    getIndex C'Ω              = 234
    getIndex C'δ              = 235
    getIndex C'Inf            = 236
    getIndex C'φ              = 237
    getIndex C'ϵ              = 238
    getIndex C'Intersect      = 239
    getIndex C'TripleBar      = 240
    getIndex C'PlusMinus      = 241
    getIndex C'GreaterEq      = 242
    getIndex C'LessEq         = 243
    getIndex C'IntegralTop    = 244
    getIndex C'IntegralBottom = 245
    getIndex C'Obelus         = 246
    getIndex C'ApproxEq       = 247
    getIndex C'Degree         = 248
    getIndex C'SmallSquare    = 249
    getIndex C'Dot            = 250
    getIndex C'Check          = 251
    getIndex C'Nth            = 252
    getIndex C'Squared        = 253
    getIndex C'LargeSquare    = 254

    fromChar '☺' = C'InvSmile
    fromChar '☻' = C'Smile
    fromChar '♥' = C'Heart
    fromChar '♦' = C'Diamond
    fromChar '♣' = C'Club
    fromChar '♠' = C'Spade
    fromChar '●' = C'Disc
    fromChar '◘' = C'InvDisc
    fromChar '◦' = C'Circle
    fromChar '◙' = C'InvCircle
    fromChar '♂' = C'Mars
    fromChar '♀' = C'Venus
    fromChar '♪' = C'Note
    fromChar '♫' = C'DoubleNote
    fromChar '☼' = C'Sun
    fromChar '►' = C'TriRight
    fromChar '◄' = C'TriLeft
    fromChar '↕' = C'Vertical
    fromChar '‼' = C'DoubleExc
    fromChar '¶' = C'Pilcrow
    fromChar '§' = C'Section
    fromChar '‗' = C'LowLine
    fromChar '↨' = C'Vertical2
    fromChar '↑' = C'Up
    fromChar '↓' = C'Down
    fromChar '→' = C'Right
    fromChar '←' = C'Left
    fromChar '∟' = C'RightAngle
    fromChar '↔' = C'Horizontal
    fromChar '▲' = C'TriUp
    fromChar '▼' = C'TriDown
    fromChar ' ' = C'Space
    fromChar '!' = C'Exclamation
    fromChar '"' = C'DoubleQuote
    fromChar '#' = C'Hashtag
    fromChar '$' = C'Dollar
    fromChar '%' = C'Percent
    fromChar '&' = C'And
    fromChar '\''= C'Quote
    fromChar '(' = C'OpenParen
    fromChar ')' = C'CloseParen
    fromChar '*' = C'Asterisk
    fromChar '+' = C'Plus
    fromChar ',' = C'Comma
    fromChar '-' = C'Minus
    fromChar '.' = C'Period
    fromChar '/' = C'Slash
    fromChar '0' = C'0
    fromChar '1' = C'1
    fromChar '2' = C'2
    fromChar '3' = C'3
    fromChar '4' = C'4
    fromChar '5' = C'5
    fromChar '6' = C'6
    fromChar '7' = C'7
    fromChar '8' = C'8
    fromChar '9' = C'9
    fromChar ':' = C'Colon
    fromChar ';' = C'Semi
    fromChar '<' = C'Less
    fromChar '=' = C'Eq
    fromChar '>' = C'Greater
    fromChar '?' = C'Question
    fromChar '@' = C'Rogue
    fromChar 'A' = C'A
    fromChar 'B' = C'B
    fromChar 'C' = C'C
    fromChar 'D' = C'D
    fromChar 'E' = C'E
    fromChar 'F' = C'F
    fromChar 'G' = C'G
    fromChar 'H' = C'H
    fromChar 'I' = C'I
    fromChar 'J' = C'J
    fromChar 'K' = C'K
    fromChar 'L' = C'L
    fromChar 'M' = C'M
    fromChar 'N' = C'N
    fromChar 'O' = C'O
    fromChar 'P' = C'P
    fromChar 'Q' = C'Q
    fromChar 'R' = C'R
    fromChar 'S' = C'S
    fromChar 'T' = C'T
    fromChar 'U' = C'U
    fromChar 'V' = C'V
    fromChar 'W' = C'W
    fromChar 'X' = C'X
    fromChar 'Y' = C'Y
    fromChar 'Z' = C'Z
    fromChar '[' = C'OpenSquare
    fromChar '\\'= C'Backslash
    fromChar ']' = C'CloseSquare
    fromChar '^' = C'Caret
    fromChar '_' = C'_
    fromChar '`' = C'Backquote
    fromChar 'a' = C'a
    fromChar 'b' = C'b
    fromChar 'c' = C'c
    fromChar 'd' = C'd
    fromChar 'e' = C'e
    fromChar 'f' = C'f
    fromChar 'g' = C'g
    fromChar 'h' = C'h
    fromChar 'i' = C'i
    fromChar 'j' = C'j
    fromChar 'k' = C'k
    fromChar 'l' = C'l
    fromChar 'm' = C'm
    fromChar 'n' = C'n
    fromChar 'o' = C'o
    fromChar 'p' = C'p
    fromChar 'q' = C'q
    fromChar 'r' = C'r
    fromChar 's' = C's
    fromChar 't' = C't
    fromChar 'u' = C'u
    fromChar 'v' = C'v
    fromChar 'w' = C'w
    fromChar 'x' = C'x
    fromChar 'y' = C'y
    fromChar 'z' = C'z
    fromChar '{' = C'OpenCurly
    fromChar '|' = C'Pipe
    fromChar '}' = C'CloseCurly
    fromChar '~' = C'Tilde
    fromChar '⌂' = C'House
    fromChar 'Ç' = C'Ç
    fromChar 'ü' = C'ü
    fromChar 'é' = C'é
    fromChar 'â' = C'â
    fromChar 'ä' = C'ä
    fromChar 'à' = C'à
    fromChar 'å' = C'å
    fromChar 'ç' = C'ç
    fromChar 'ê' = C'ê
    fromChar 'ë' = C'ë
    fromChar 'è' = C'è
    fromChar 'ï' = C'ï
    fromChar 'î' = C'î
    fromChar 'ì' = C'ì
    fromChar 'Ä' = C'Ä
    fromChar 'Å' = C'Å
    fromChar 'É' = C'É
    fromChar 'æ' = C'æ
    fromChar 'Æ' = C'Æ
    fromChar 'ô' = C'ô
    fromChar 'ö' = C'ö
    fromChar 'ò' = C'ò
    fromChar 'û' = C'û
    fromChar 'ù' = C'ù
    fromChar 'ÿ' = C'ÿ
    fromChar 'Ö' = C'Ö
    fromChar 'Ü' = C'Ü
    fromChar '¢' = C'Cent
    fromChar '£' = C'Pound
    fromChar '¥' = C'Yen
    fromChar '₧' = C'Peseta
    fromChar 'ƒ' = C'ƒ
    fromChar 'á' = C'á
    fromChar 'í' = C'í
    fromChar 'ó' = C'ó
    fromChar 'ú' = C'ú
    fromChar 'ñ' = C'ñ
    fromChar 'Ñ' = C'Ñ
    fromChar 'ª' = C'Feminine
    fromChar 'º' = C'Masculine
    fromChar '¿' = C'InvQuestion
    fromChar '⌐' = C'InvNot
    fromChar '¬' = C'Not
    fromChar '½' = C'Half
    fromChar '¼' = C'Fourth
    fromChar '¡' = C'InvExc
    fromChar '«' = C'LeftAngle2
    fromChar '»' = C'RightAngle2
    fromChar '░' = C'FadeLeast
    fromChar '▒' = C'FadeLittle
    fromChar '▓' = C'Fade
    fromChar '│' = C'Box1010
    fromChar '┤' = C'Box1011
    fromChar '╡' = C'Box1012
    fromChar '╢' = C'Box2021
    fromChar '╖' = C'Box0021
    fromChar '╕' = C'Box0012
    fromChar '╣' = C'Box2022
    fromChar '║' = C'Box2020
    fromChar '╗' = C'Box0022
    fromChar '╝' = C'Box2002
    fromChar '╜' = C'Box2001
    fromChar '╛' = C'Box1002
    fromChar '┐' = C'Box0011
    fromChar '└' = C'Box1100
    fromChar '┴' = C'Box1101
    fromChar '┬' = C'Box0111
    fromChar '├' = C'Box1110
    fromChar '─' = C'Box0101
    fromChar '┼' = C'Box1111
    fromChar '╞' = C'Box1210
    fromChar '╟' = C'Box2120
    fromChar '╚' = C'Box2200
    fromChar '╔' = C'Box0220
    fromChar '╩' = C'Box2202
    fromChar '╦' = C'Box0222
    fromChar '╠' = C'Box2220
    fromChar '═' = C'Box0202
    fromChar '╬' = C'Box2222
    fromChar '╧' = C'Box1202
    fromChar '╨' = C'Box2101
    fromChar '╤' = C'Box0212
    fromChar '╥' = C'Box0121
    fromChar '╙' = C'Box2100
    fromChar '╘' = C'Box1200
    fromChar '╒' = C'Box0210
    fromChar '╓' = C'Box0120
    fromChar '╫' = C'Box2121
    fromChar '╪' = C'Box1212
    fromChar '┘' = C'Box1001
    fromChar '┌' = C'Box0110
    fromChar '█' = C'Full
    fromChar '▄' = C'SolidDown
    fromChar '▌' = C'SolidRight
    fromChar '▐' = C'SolidLeft
    fromChar '▀' = C'SolidTop
    fromChar 'α' = C'α
    fromChar 'β' = C'β
    fromChar 'Γ' = C'Γ
    fromChar 'π' = C'π
    fromChar 'Σ' = C'Σ
    fromChar 'σ' = C'σ
    fromChar 'μ' = C'μ
    fromChar 'τ' = C'τ
    fromChar 'Φ' = C'Φ
    fromChar 'Θ' = C'Θ
    fromChar 'Ω' = C'Ω
    fromChar 'δ' = C'δ
    fromChar '∞' = C'Inf
    fromChar 'φ' = C'φ
    fromChar 'ϵ' = C'ϵ
    fromChar '∩' = C'Intersect
    fromChar '≡' = C'TripleBar
    fromChar '±' = C'PlusMinus
    fromChar '≥' = C'GreaterEq
    fromChar '≤' = C'LessEq
    fromChar '⌠' = C'IntegralTop
    fromChar '⌡' = C'IntegralBottom
    fromChar '÷' = C'Obelus
    fromChar '≈' = C'ApproxEq
    fromChar '°' = C'Degree
    fromChar '▪' = C'SmallSquare
    fromChar '·' = C'Dot
    fromChar '√' = C'Check
    fromChar 'ⁿ' = C'Nth
    fromChar '²' = C'Squared
    fromChar '■' = C'LargeSquare
