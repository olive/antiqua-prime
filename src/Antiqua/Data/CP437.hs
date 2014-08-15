module Antiqua.Data.CP437 where

import Antiqua.Common

data CP437 = C'0
           | C'1
           | C'2
           | C'3
           | C'4
           | C'5
           | C'6
           | C'7
           | C'8
           | C'9
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
           | C'_
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
           | C'ƒ
           | C'á
           | C'í
           | C'ó
           | C'ú
           | C'ñ
           | C'Ñ
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
           | C'φ
           | C'ϵ


instance Code CP437 where
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

    getIndex C'_ = 95

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

    getIndex C'ƒ = 159
    getIndex C'á = 160
    getIndex C'í = 161
    getIndex C'ó = 162
    getIndex C'ú = 163
    getIndex C'ñ = 164
    getIndex C'Ñ = 165

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
    --getIndex C'∞
    getIndex C'φ = 237
    getIndex C'ϵ = 238
