module Antiqua.Data.CP437 where

import Antiqua.Common

data CP437 = (:☺)
           | (:☻)
           | (:♥)
           | (:♦)
           | (:♣)
           | (:♠)
           | (:●)
           | (:◘)
           | (:◦)
           | (:◙)
           | (:♂)
           | (:♀)
           | (:♪)
           | (:♫)
           | (:☼)
           | (:►)
           | (:◄)
           | (:↕)
           | (:‼)
           | (:¶)
           | (:§)
           | (:‗)
           | (:↨)
           | (:↑)
           | (:↓)
           | (:→)
           | (:←)
           | (:∟)
           | (:↔)
           | (:▲)
           | (:▼)
           | C'Space
           | (:!)
           | C'DoubleQuote
           | (:#)
           | (:$)
           | (:%)
           | (:&)
           | C'SingleQuote
           | C'OpenParen
           | C'CloseParen
           | (:*)
           | (:+)
           | C'Comma
           | (:-)
           | (:.)
           | (:/)
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
           | (:<)
           | (:=)
           | (:>)
           | (:?)
           | (:@)
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
           | (:\)
           | C'CloseSquare-- | ]
           | (:^)
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
           | (:|)-- | |
           | C'CloseCurly-- | }
           | (:~)-- | ~
           | (:⌂)-- | ⌂
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
           | (:¢)
           | (:£)
           | (:¥)
           | (:₧)
           | C'ƒ
           | C'á
           | C'í
           | C'ó
           | C'ú
           | C'ñ
           | C'Ñ
           | C'Feminine
           | C'Masculine
           | (:¿)
           | (:⌐)
           | (:¬)
           | C'Half
           | C'Fourth
           | (:¡)
           | C'LeftAngle2
           | C'RightAngle2
           | (:░)
           | (:▒)
           | (:▓)
           | (:│)
           | (:┤)
           | (:╡)
           | (:╢)
           | (:╖)
           | (:╕)
           | (:╣)
           | (:║)
           | (:╗)
           | (:╝)
           | (:╜)
           | (:╛)
           | (:┐)
           | (:└)
           | (:┴)
           | (:┬)
           | (:├)
           | (:─)
           | (:┼)
           | (:╞)
           | (:╟)
           | (:╚)
           | (:╔)
           | (:╩)
           | (:╦)
           | (:╠)
           | (:═)
           | (:╬)
           | (:╧)
           | (:╨)
           | (:╤)
           | (:╥)
           | (:╙)
           | (:╘)
           | (:╒)
           | (:╓)
           | (:╫)
           | (:╪)
           | (:┘)
           | (:┌)
           | (:█)
           | (:▄)
           | (:▌)
           | (:▐)
           | (:▀)
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
           | (:∞)
           | C'φ
           | C'ϵ
           | (:∩)
           | (:≡)
           | (:±)
           | (:≥)
           | (:≤)
           | (:⌠)
           | (:⌡)
           | (:÷)
           | (:≈)
           | (:°)
           | (:▪)
           | (:·)
           | (:√)
           | C'Nth
           | C'Squared
           | (:■)

instance Code CP437 where
    getIndex (:☺)          = 1
    getIndex (:☻)          = 2
    getIndex (:♥)          = 3
    getIndex (:♦)          = 4
    getIndex (:♣)          = 5
    getIndex (:♠)          = 6
    getIndex (:●)          = 7
    getIndex (:◘)          = 8
    getIndex (:◦)          = 9
    getIndex (:◙)          = 10
    getIndex (:♂)          = 11
    getIndex (:♀)          = 12
    getIndex (:♪)          = 13
    getIndex (:♫)          = 14
    getIndex (:☼)          = 15
    getIndex (:►)          = 16
    getIndex (:◄)          = 17
    getIndex (:↕)          = 18
    getIndex (:‼)          = 19
    getIndex (:¶)          = 20
    getIndex (:§)          = 21
    getIndex (:‗)          = 22
    getIndex (:↨)          = 23
    getIndex (:↑)          = 24
    getIndex (:↓)          = 25
    getIndex (:→)          = 26
    getIndex (:←)          = 27
    getIndex (:∟)          = 28
    getIndex (:↔)          = 29
    getIndex (:▲)          = 30
    getIndex (:▼)          = 31
    getIndex C'Space      =  32
    getIndex (:!)         =  33
    getIndex C'DoubleQuote=  34
    getIndex (:#)         =  35
    getIndex (:$)         =  36
    getIndex (:%)         =  37
    getIndex (:&)         =  38
    getIndex C'SingleQuote=  39
    getIndex C'OpenParen  =  40
    getIndex C'CloseParen =  41
    getIndex (:*)         =  42
    getIndex (:+)         =  43
    getIndex C'Comma      =  44
    getIndex (:-)         =  45
    getIndex (:.)         =  46
    getIndex (:/)         =  47
    getIndex C'0          =  48
    getIndex C'1          =  49
    getIndex C'2          =  50
    getIndex C'3          =  51
    getIndex C'4          =  52
    getIndex C'5          =  53
    getIndex C'6          =  54
    getIndex C'7          =  55
    getIndex C'8          =  56
    getIndex C'9          =  57
    getIndex C'Colon      =  58
    getIndex C'Semi       =  59
    getIndex (:<)         =  60
    getIndex (:=)         =  61
    getIndex (:>)         =  62
    getIndex (:?)         =  63
    getIndex (:@)         =  64
    getIndex C'A          =  65
    getIndex C'B          =  66
    getIndex C'C          =  67
    getIndex C'D          =  68
    getIndex C'E          =  69
    getIndex C'F          =  70
    getIndex C'G          =  71
    getIndex C'H          =  72
    getIndex C'I          =  73
    getIndex C'J          =  74
    getIndex C'K          =  75
    getIndex C'L          =  76
    getIndex C'M          =  77
    getIndex C'N          =  78
    getIndex C'O          =  79
    getIndex C'P          =  80
    getIndex C'Q          =  81
    getIndex C'R          =  82
    getIndex C'S          =  83
    getIndex C'T          =  84
    getIndex C'U          =  85
    getIndex C'V          =  86
    getIndex C'W          =  87
    getIndex C'X          =  88
    getIndex C'Y          =  89
    getIndex C'Z          =  90
    getIndex C'OpenSquare =  91
    getIndex (:\)         =  92
    getIndex C'CloseSquare=  93
    getIndex (:^)         =  94
    getIndex C'_          =  95
    getIndex C'Backquote  =  96
    getIndex C'a          =  97
    getIndex C'b          =  98
    getIndex C'c          =  99
    getIndex C'd          =  100
    getIndex C'e          =  101
    getIndex C'f          =  102
    getIndex C'g          =  103
    getIndex C'h          =  104
    getIndex C'i          =  105
    getIndex C'j          =  106
    getIndex C'k          =  107
    getIndex C'l          =  108
    getIndex C'm          =  109
    getIndex C'n          =  110
    getIndex C'o          =  111
    getIndex C'p          =  112
    getIndex C'q          =  113
    getIndex C'r          =  114
    getIndex C's          =  115
    getIndex C't          =  116
    getIndex C'u          =  117
    getIndex C'v          =  118
    getIndex C'w          =  119
    getIndex C'x          =  120
    getIndex C'y          =  121
    getIndex C'z          =  122
    getIndex C'OpenCurly  =  123
    getIndex (:|)         =  124
    getIndex C'CloseCurly =  125
    getIndex (:~)         =  126
    getIndex (:⌂)         =  127
    getIndex C'Ç          =  128
    getIndex C'ü          =  129
    getIndex C'é          =  130
    getIndex C'â          =  131
    getIndex C'ä          =  132
    getIndex C'à          =  133
    getIndex C'å          =  134
    getIndex C'ç          =  135
    getIndex C'ê          =  136
    getIndex C'ë          =  137
    getIndex C'è          =  138
    getIndex C'ï          =  139
    getIndex C'î          =  140
    getIndex C'ì          =  141
    getIndex C'Ä          =  142
    getIndex C'Å          =  143
    getIndex C'É          =  144
    getIndex C'æ          =  145
    getIndex C'Æ          =  146
    getIndex C'ô          =  147
    getIndex C'ö          =  148
    getIndex C'ò          =  149
    getIndex C'û          =  150
    getIndex C'ù          =  151
    getIndex C'ÿ          =  152
    getIndex C'Ö          =  153
    getIndex C'Ü          =  154
    getIndex (:¢)         =  155
    getIndex (:£)         =  156
    getIndex (:¥)         =  157
    getIndex (:₧)         =  158
    getIndex C'ƒ          =  159
    getIndex C'á          =  160
    getIndex C'í          =  161
    getIndex C'ó          =  162
    getIndex C'ú          =  163
    getIndex C'ñ          =  164
    getIndex C'Ñ          =  165
    getIndex C'Feminine   =  166
    getIndex C'Masculine  =  167
    getIndex (:¿)         =  168
    getIndex (:⌐)         =  169
    getIndex (:¬)         =  170
    getIndex C'Half       =  171
    getIndex C'Fourth     =  172
    getIndex (:¡)         =  173
    getIndex C'LeftAngle2 =  174
    getIndex C'RightAngle2=  175
    getIndex (:░)         =  176
    getIndex (:▒)         =  177
    getIndex (:▓)         =  178
    getIndex (:│)         =  179
    getIndex (:┤)         =  180
    getIndex (:╡)         =  181
    getIndex (:╢)         =  182
    getIndex (:╖)         =  183
    getIndex (:╕)         =  184
    getIndex (:╣)         =  185
    getIndex (:║)         =  186
    getIndex (:╗)         =  187
    getIndex (:╝)         =  188
    getIndex (:╜)         =  189
    getIndex (:╛)         =  190
    getIndex (:┐)         =  191
    getIndex (:└)         =  192
    getIndex (:┴)         =  193
    getIndex (:┬)         =  194
    getIndex (:├)         =  195
    getIndex (:─)         =  196
    getIndex (:┼)         =  197
    getIndex (:╞)         =  198
    getIndex (:╟)         =  199
    getIndex (:╚)         =  200
    getIndex (:╔)         =  201
    getIndex (:╩)         =  202
    getIndex (:╦)         =  203
    getIndex (:╠)         =  204
    getIndex (:═)         =  205
    getIndex (:╬)         =  206
    getIndex (:╧)         =  207
    getIndex (:╨)         =  208
    getIndex (:╤)         =  209
    getIndex (:╥)         =  210
    getIndex (:╙)         =  211
    getIndex (:╘)         =  212
    getIndex (:╒)         =  213
    getIndex (:╓)         =  214
    getIndex (:╫)         =  215
    getIndex (:╪)         =  216
    getIndex (:┘)         =  217
    getIndex (:┌)         =  218
    getIndex (:█)         =  219
    getIndex (:▄)         =  220
    getIndex (:▌)         =  221
    getIndex (:▐)         =  222
    getIndex (:▀)         =  223
    getIndex C'α          =  224
    getIndex C'β          =  225
    getIndex C'Γ          =  226
    getIndex C'π          =  227
    getIndex C'Σ          =  228
    getIndex C'σ          =  229
    getIndex C'μ          =  230
    getIndex C'τ          =  231
    getIndex C'Φ          =  232
    getIndex C'Θ          =  233
    getIndex C'Ω          =  234
    getIndex C'δ          =  235
    getIndex (:∞)         =  236
    getIndex C'φ          =  237
    getIndex C'ϵ          =  238
    getIndex (:∩)         =  239
    getIndex (:≡)         =  240
    getIndex (:±)         =  241
    getIndex (:≥)         =  242
    getIndex (:≤)         =  243
    getIndex (:⌠)         =  244
    getIndex (:⌡)         =  245
    getIndex (:÷)         =  246
    getIndex (:≈)         =  247
    getIndex (:°)         =  248
    getIndex (:▪)         =  249
    getIndex (:·)         =  250
    getIndex (:√)         =  251
    getIndex C'Nth        =  252
    getIndex C'Squared    =  253
    getIndex (:■)         =  254

    fromChar '☺' = (:☺)
    fromChar '☻' = (:☻)
    fromChar '♥' = (:♥)
    fromChar '♦' = (:♦)
    fromChar '♣' = (:♣)
    fromChar '♠' = (:♠)
    fromChar '●' = (:●)
    fromChar '◘' = (:◘)
    fromChar '◦' = (:◦)
    fromChar '◙' = (:◙)
    fromChar '♂' = (:♂)
    fromChar '♀' = (:♀)
    fromChar '♪' = (:♪)
    fromChar '♫' = (:♫)
    fromChar '☼' = (:☼)
    fromChar '►' = (:►)
    fromChar '◄' = (:◄)
    fromChar '↕' = (:↕)
    fromChar '‼' = (:‼)
    fromChar '¶' = (:¶)
    fromChar '§' = (:§)
    fromChar '‗' = (:‗)
    fromChar '↨' = (:↨)
    fromChar '↑' = (:↑)
    fromChar '↓' = (:↓)
    fromChar '→' = (:→)
    fromChar '←' = (:←)
    fromChar '∟' = (:∟)
    fromChar '↔' = (:↔)
    fromChar '▲' = (:▲)
    fromChar '▼' = (:▼)
    fromChar ' ' = C'Space
    fromChar '!' = (:!)
    fromChar '"' = C'DoubleQuote
    fromChar '#' = (:#)
    fromChar '$' = (:$)
    fromChar '%' = (:%)
    fromChar '&' = (:&)
    fromChar '\''= C'SingleQuote
    fromChar '(' = C'OpenParen
    fromChar ')' = C'CloseParen
    fromChar '*' = (:*)
    fromChar '+' = (:+)
    fromChar ',' = C'Comma
    fromChar '-' = (:-)
    fromChar '.' = (:.)
    fromChar '/' = (:/)
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
    fromChar '<' = (:<)
    fromChar '=' = (:=)
    fromChar '>' = (:>)
    fromChar '?' = (:?)
    fromChar '@' = (:@)
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
    fromChar '\\'= (:\)
    fromChar ']' = C'CloseSquare
    fromChar '^' = (:^)
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
    fromChar '|' = (:|)
    fromChar '}' = C'CloseCurly
    fromChar '~' = (:~)
    fromChar '⌂' = (:⌂)
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
    fromChar '¢' = (:¢)
    fromChar '£' = (:£)
    fromChar '¥' = (:¥)
    fromChar '₧' = (:₧)
    fromChar 'ƒ' = C'ƒ
    fromChar 'á' = C'á
    fromChar 'í' = C'í
    fromChar 'ó' = C'ó
    fromChar 'ú' = C'ú
    fromChar 'ñ' = C'ñ
    fromChar 'Ñ' = C'Ñ
    fromChar 'ª' = C'Feminine
    fromChar 'º' = C'Masculine
    fromChar '¿' = (:¿)
    fromChar '⌐' = (:⌐)
    fromChar '¬' = (:¬)
    fromChar '½' = C'Half
    fromChar '¼' = C'Fourth
    fromChar '¡' = (:¡)
    fromChar '«' = C'LeftAngle2
    fromChar '»' = C'RightAngle2
    fromChar '░' = (:░)
    fromChar '▒' = (:▒)
    fromChar '▓' = (:▓)
    fromChar '│' = (:│)
    fromChar '┤' = (:┤)
    fromChar '╡' = (:╡)
    fromChar '╢' = (:╢)
    fromChar '╖' = (:╖)
    fromChar '╕' = (:╕)
    fromChar '╣' = (:╣)
    fromChar '║' = (:║)
    fromChar '╗' = (:╗)
    fromChar '╝' = (:╝)
    fromChar '╜' = (:╜)
    fromChar '╛' = (:╛)
    fromChar '┐' = (:┐)
    fromChar '└' = (:└)
    fromChar '┴' = (:┴)
    fromChar '┬' = (:┬)
    fromChar '├' = (:├)
    fromChar '─' = (:─)
    fromChar '┼' = (:┼)
    fromChar '╞' = (:╞)
    fromChar '╟' = (:╟)
    fromChar '╚' = (:╚)
    fromChar '╔' = (:╔)
    fromChar '╩' = (:╩)
    fromChar '╦' = (:╦)
    fromChar '╠' = (:╠)
    fromChar '═' = (:═)
    fromChar '╬' = (:╬)
    fromChar '╧' = (:╧)
    fromChar '╨' = (:╨)
    fromChar '╤' = (:╤)
    fromChar '╥' = (:╥)
    fromChar '╙' = (:╙)
    fromChar '╘' = (:╘)
    fromChar '╒' = (:╒)
    fromChar '╓' = (:╓)
    fromChar '╫' = (:╫)
    fromChar '╪' = (:╪)
    fromChar '┘' = (:┘)
    fromChar '┌' = (:┌)
    fromChar '█' = (:█)
    fromChar '▄' = (:▄)
    fromChar '▌' = (:▌)
    fromChar '▐' = (:▐)
    fromChar '▀' = (:▀)
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
    fromChar '∞' = (:∞)
    fromChar 'φ' = C'φ
    fromChar 'ϵ' = C'ϵ
    fromChar '∩' = (:∩)
    fromChar '≡' = (:≡)
    fromChar '±' = (:±)
    fromChar '≥' = (:≥)
    fromChar '≤' = (:≤)
    fromChar '⌠' = (:⌠)
    fromChar '⌡' = (:⌡)
    fromChar '÷' = (:÷)
    fromChar '≈' = (:≈)
    fromChar '°' = (:°)
    fromChar '▪' = (:▪)
    fromChar '·' = (:·)
    fromChar '√' = (:√)
    fromChar 'ⁿ' = C'Nth
    fromChar '²' = C'Squared
    fromChar '■' = (:■)
