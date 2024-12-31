.section code
handleLevelOneBossBattle
    ;jsr debug
    lda mLevelOneBossState
    cmp #levelOneBossStateinit
    beq _initLevelOneBoss

    cmp #levelOneBossStateIntro
    beq _levelOneIntro
    jsr handlePlayer
    jsr playerLaserMove
    jsr playerFireDelayTimer
    rts
_initLevelOneBoss
    jsr initLevelOneBoss
    inc mLevelOneBossState
    rts

_levelOneIntro
    jsr levelOneBossIntro
    rts

resetLevelOneBossState
    lda #levelOneBossStateinit
    sta mLevelOneBossState
    rts

initLevelOneBoss
    lda #100
    sta mLevelOneBossTimer

    lda #levelOneBossXStart
    sta mLevelOneBossX0
    sta mLevelOneBossX3
    lda #levelOneBossXStart + 24
    sta mLevelOneBossX1
    sta mLevelOneBossX4
    lda #levelOneBossXStart + 24 + 24
    sta mLevelOneBossX2
    sta mLevelOneBossX5


    lda #levelOneBossYStart
    sta mLevelOneBossY0
    sta mLevelOneBossY1
    sta mLevelOneBossY2

    lda #levelOneBossYStart + 24
    sta mLevelOneBossY3
    sta mLevelOneBossY4
    sta mLevelOneBossY5

    jsr levelOneShowBoss 
    rts

levelOneBossIntro
    lda mLevelOneBossTimer 
    cmp #0
    beq _endIntro
    dec mLevelOneBossTimer
    inc mLevelOneBossY0
    inc mLevelOneBossY1
    inc mLevelOneBossY2
    inc mLevelOneBossY3
    inc mLevelOneBossY4
    inc mLevelOneBossY5
    jsr levelOneShowBoss
    rts
_endIntro
    inc mLevelOneBossState
    rts


levelOneShowBoss
    ;#macroShowSprite spEnemyNumber00, spBoss1part0, mLevelOneBossX0, mLevelOneBossX0 + 1, mLevelOneBossY0, SPRITE24L0C2
    ;#macroShowSprite spEnemyNumber01, spBoss1part1, mLevelOneBossX1, mLevelOneBossX1 + 1, mLevelOneBossY1, SPRITE24L0C2
    ;#macroShowSprite spEnemyNumber02, spBoss1part2, mLevelOneBossX2, mLevelOneBossX2 + 1, mLevelOneBossY2, SPRITE24L0C2
    ;#macroShowSprite spEnemyNumber03, spBoss1part3, mLevelOneBossX3, mLevelOneBossX3 + 1, mLevelOneBossY3, SPRITE24L0C2
    ;#macroShowSprite spEnemyNumber04, spBoss1part4, mLevelOneBossX4, mLevelOneBossX4 + 1, mLevelOneBossY4, SPRITE24L0C2
    ;#macroShowSprite spEnemyNumber05, spBoss1part5, mLevelOneBossX5, mLevelOneBossX5 + 1, mLevelOneBossY5, SPRITE24L0C2
    jsr levelOneShowBoss0
    jsr levelOneShowBoss1
    jsr levelOneShowBoss2
    jsr levelOneShowBoss3
    jsr levelOneShowBoss4
    jsr levelOneShowBoss5
    rts

levelOneShowBoss0
    lda mLevelOneBossY0
    cmp #190
    bcc _show
    rts
_show
     #macroShowSprite spEnemyNumber00, spBoss1part0, mLevelOneBossX0, mLevelOneBossX0 + 1, mLevelOneBossY0, SPRITE24L0C2
    rts
levelOneShowBoss1
    lda mLevelOneBossY1
    cmp #190
    bcc _show
    rts
_show
    #macroShowSprite spEnemyNumber01, spBoss1part1, mLevelOneBossX1, mLevelOneBossX1 + 1, mLevelOneBossY1, SPRITE24L0C2
    rts
levelOneShowBoss2
    lda mLevelOneBossY2
    cmp #190
    bcc _show
    rts
_show
    #macroShowSprite spEnemyNumber02, spBoss1part2, mLevelOneBossX2, mLevelOneBossX2 + 1, mLevelOneBossY2, SPRITE24L0C2
    rts
levelOneShowBoss3
    lda mLevelOneBossY3
    cmp #190
    bcc _show
    rts
_show
    #macroShowSprite spEnemyNumber03, spBoss1part3, mLevelOneBossX3, mLevelOneBossX3 + 1, mLevelOneBossY3, SPRITE24L0C2
    rts
levelOneShowBoss4
    lda mLevelOneBossY4
    cmp #190
    bcc _show
    rts
_show
    #macroShowSprite spEnemyNumber04, spBoss1part4, mLevelOneBossX4, mLevelOneBossX4 + 1, mLevelOneBossY4, SPRITE24L0C2
    rts
levelOneShowBoss5
    lda mLevelOneBossY5
    cmp #190
    bcc _show
    rts
_show
    #macroShowSprite spEnemyNumber05, spBoss1part5, mLevelOneBossX5, mLevelOneBossX5 + 1, mLevelOneBossY5, SPRITE24L0C2
    rts  


.endsection

.section variables
levelOneBossStateinit = 0
levelOneBossStateIntro = 1

levelOneBossXStart = 150
levelOneBossYStart = $ff - 40

mLevelOneBossState
    .byte $0
mLevelOneBossTimer
    .byte $0
mLevelOneBossX0
    .byte $00,$00
mLevelOneBossX1
    .byte $00,$00
mLevelOneBossX2
    .byte $00,$00
mLevelOneBossX3
    .byte $00,$00
mLevelOneBossX4
    .byte $00,$00
mLevelOneBossX5
    .byte $00,$00
mLevelOneBossY0
    .byte $00,$00
mLevelOneBossY1
    .byte $00,200
mLevelOneBossY2
    .byte $00,$00
mLevelOneBossY3
    .byte $00,$00
mLevelOneBossY4
    .byte $00,$00
mLevelOneBossY5
    .byte $00,$00
.endsection


.section data
mBoss1BulletPath
.byte 71,32
.byte 71,32
.byte 71,33
.byte 71,33
.byte 71,34
.byte 71,34
.byte 71,35
.byte 71,35
.byte 71,36
.byte 71,36
.byte 71,37
.byte 71,37
.byte 71,38
.byte 71,38
.byte 71,39
.byte 71,39
.byte 70,40
.byte 70,40
.byte 70,41
.byte 70,41
.byte 69,42
.byte 70,42
.byte 69,43
.byte 69,43
.byte 69,44
.byte 69,44
.byte 69,45
.byte 69,45
.byte 69,45
.byte 69,46
.byte 69,46
.byte 69,47
.byte 69,47
.byte 70,48
.byte 70,48
.byte 70,49
.byte 70,49
.byte 71,50
.byte 71,50
.byte 72,51
.byte 72,51
.byte 73,52
.byte 72,52
.byte 74,53
.byte 73,53
.byte 74,54
.byte 74,54
.byte 75,55
.byte 75,55
.byte 75,56
.byte 75,56
.byte 75,57
.byte 75,57
.byte 75,57
.byte 75,58
.byte 75,58
.byte 74,59
.byte 74,59
.byte 73,60
.byte 73,60
.byte 72,61
.byte 72,61
.byte 71,62
.byte 71,62
.byte 69,63
.byte 70,63
.byte 68,64
.byte 69,64
.byte 67,65
.byte 67,65
.byte 66,66
.byte 66,66
.byte 65,67
.byte 65,67
.byte 65,68
.byte 65,68
.byte 65,69
.byte 65,69
.byte 66,70
.byte 65,70
.byte 65,70
.byte 67,71
.byte 66,71
.byte 68,72
.byte 67,72
.byte 70,73
.byte 69,73
.byte 72,74
.byte 71,74
.byte 73,75
.byte 73,75
.byte 75,76
.byte 74,76
.byte 77,77
.byte 76,77
.byte 78,78
.byte 77,78
.byte 79,79
.byte 78,79
.byte 79,80
.byte 79,80
.byte 79,81
.byte 79,81
.byte 78,82
.byte 79,82
.byte 76,83
.byte 77,83
.byte 78,83
.byte 75,84
.byte 76,84
.byte 72,85
.byte 74,85
.byte 70,86
.byte 71,86
.byte 68,87
.byte 69,87
.byte 66,88
.byte 67,88
.byte 64,89
.byte 65,89
.byte 62,90
.byte 63,90
.byte 61,91
.byte 62,91
.byte 61,92
.byte 61,92
.byte 61,93
.byte 61,93
.byte 62,94
.byte 61,94
.byte 64,95
.byte 63,95
.byte 63,95
.byte 67,96
.byte 65,96
.byte 69,97
.byte 68,97
.byte 72,98
.byte 71,98
.byte 75,99
.byte 74,99
.byte 78,100
.byte 76,100
.byte 80,101
.byte 79,101
.byte 82,102
.byte 81,102
.byte 83,103
.byte 82,103
.byte 83,104
.byte 83,104
.byte 83,105
.byte 83,105
.byte 82,106
.byte 82,106
.byte 80,107
.byte 81,107
.byte 76,108
.byte 77,108
.byte 79,108
.byte 73,109
.byte 75,109
.byte 70,110
.byte 71,110
.byte 66,111
.byte 68,111
.byte 63,112
.byte 65,112
.byte 60,113
.byte 62,113
.byte 58,114
.byte 59,114
.byte 57,115
.byte 58,115
.byte 57,116
.byte 57,116
.byte 57,117
.byte 57,117
.byte 58,118
.byte 58,118
.byte 61,119
.byte 59,119
.byte 65,120
.byte 64,120
.byte 62,120
.byte 69,121
.byte 67,121
.byte 73,122
.byte 71,122
.byte 77,123
.byte 75,123
.byte 80,124
.byte 78,124
.byte 83,125
.byte 82,125
.byte 85,126
.byte 84,126
.byte 87,127
.byte 86,127
.byte 87,128
.byte 87,128
.byte 87,129
.byte 87,129
.byte 85,130
.byte 86,130
.byte 83,131
.byte 84,131
.byte 79,132
.byte 81,132
.byte 73,133
.byte 75,133
.byte 77,133
.byte 69,134
.byte 71,134
.byte 65,135
.byte 67,135
.byte 61,136
.byte 63,136
.byte 57,137
.byte 59,137
.byte 55,138
.byte 56,138
.byte 53,139
.byte 54,139
.byte 53,140
.byte 53,140
.byte 53,141
.byte 53,141
.byte 55,142
.byte 54,142
.byte 58,143
.byte 56,143
.byte 62,144
.byte 60,144
.byte 66,145
.byte 64,145
.byte 73,146
.byte 71,146
.byte 68,146
.byte 78,147
.byte 76,147
.byte 83,148
.byte 80,148
.byte 86,149
.byte 85,149
.byte 89,150
.byte 88,150
.byte 91,151
.byte 90,151
.byte 91,152
.byte 91,152
.byte 91,153
.byte 91,153
.byte 89,154
.byte 90,154
.byte 85,155
.byte 87,155
.byte 81,156
.byte 83,156
.byte 76,157
.byte 79,157
.byte 68,158
.byte 71,158
.byte 74,158
.byte 63,159
.byte 65,159
.byte 58,160
.byte 60,160
.byte 54,161
.byte 56,161
.byte 51,162
.byte 52,162
.byte 49,163
.byte 50,163
.byte 48,164
.byte 48,164
.byte 49,165
.byte 49,165
.byte 52,166
.byte 50,166
.byte 55,167
.byte 53,167
.byte 60,168
.byte 57,168
.byte 65,169
.byte 63,169
.byte 71,170
.byte 68,170
.byte 80,171
.byte 77,171
.byte 74,171
.byte 85,172
.byte 83,172
.byte 90,173
.byte 88,173
.byte 93,174
.byte 92,174
.byte 95,175
.byte 94,175
.byte 96,176
.byte 96,176
.byte 94,177
.byte 95,177
.byte 92,178
.byte 93,178
.byte 88,179
.byte 90,179
.byte 83,180
.byte 86,180
.byte 77,181
.byte 80,181
.byte 71,182
.byte 74,182
.byte 64,183
.byte 67,183
.byte 55,184
.byte 58,184
.byte 61,184
.byte 50,185
.byte 53,185
.byte 47,186
.byte 49,186
.byte 45,187
.byte 46,187
.byte 44,188
.byte 44,188
.byte 46,189
.byte 45,189
.byte 48,190
.byte 47,190
.byte 53,191
.byte 50,191
.byte 58,192
.byte 55,192
.byte 65,193
.byte 61,193
.byte 72,194
.byte 68,194
.byte 79,195
.byte 75,195
.byte 88,196
.byte 85,196
.byte 82,196
.byte 93,197
.byte 91,197
.byte 97,198
.byte 95,198
.byte 99,199
.byte 98,199
.byte 100,200
.byte 100,200
.byte 98,201
.byte 99,201
.byte 95,202
.byte 97,202
.byte 90,203
.byte 93,203
.byte 84,204
.byte 88,204
.byte 78,205
.byte 81,205
.byte 70,206
.byte 74,206
.byte 63,207
.byte 66,207
.byte 56,208
.byte 59,208
.byte 47,209
.byte 50,209
.byte 53,209
.byte 43,210
.byte 45,210
.byte 41,211
.byte 42,211
.byte 40,212
.byte 40,212
.byte 42,213
.byte 41,213
.byte 45,214
.byte 43,214
.byte 50,215
.byte 48,215
.byte 57,216
.byte 53,216
.byte 64,217
.byte 60,217
.byte 72,218
.byte 68,218
.byte 80,219
.byte 76,219
.byte 87,220
.byte 84,220
.byte 97,221
.byte 94,221
.byte 91,221
.byte 101,222
.byte 99,222
.byte 103,223
.byte 102,223
.byte 104,224
.byte 104,224
.byte 102,225
.byte 103,225
.byte 98,226
.byte 100,226
.byte 93,227
.byte 96,227
.byte 86,228
.byte 90,228
.byte 78,229
.byte 82,229
.byte 70,230
.byte 74,230
.byte 61,231
.byte 65,231
.byte 53,232
.byte 57,232
.byte 46,233
.byte 50,233
.byte 39,234
.byte 41,234
.byte 44,234
.byte 37,235
.byte 38,235
.byte 36,236
.byte 36,236
.byte 38,237
.byte 37,237
.byte 42,238
.byte 40,238
.byte 48,239
.byte 45,239
.byte 55,240
.byte 51,240

mBossBombPath
.byte 32,32
.byte 34,36
.byte 35,40
.byte 37,44
.byte 38,48
.byte 40,51
.byte 42,55
.byte 43,58
.byte 45,62
.byte 47,65
.byte 48,68
.byte 50,72
.byte 51,75
.byte 53,78
.byte 55,81
.byte 56,83
.byte 58,86
.byte 59,89
.byte 61,92
.byte 63,94
.byte 64,96
.byte 66,99
.byte 68,101
.byte 69,103
.byte 71,105
.byte 72,108
.byte 74,109
.byte 76,111
.byte 77,113
.byte 79,115
.byte 80,116
.byte 82,118
.byte 84,120
.byte 85,121
.byte 87,122
.byte 89,123
.byte 90,125
.byte 92,126
.byte 93,127
.byte 95,128
.byte 97,128
.byte 98,129
.byte 100,130
.byte 101,130
.byte 103,131
.byte 105,131
.byte 106,132
.byte 108,132
.byte 110,132
.byte 111,132
.byte 113,132
.byte 114,132
.byte 116,132
.byte 118,132
.byte 119,131
.byte 121,131
.byte 123,130
.byte 124,130
.byte 126,129
.byte 127,128
.byte 129,128
.byte 131,127
.byte 132,126
.byte 134,125
.byte 135,123
.byte 137,122
.byte 139,121
.byte 140,120
.byte 142,118
.byte 144,116
.byte 145,115
.byte 147,113
.byte 148,111
.byte 150,109
.byte 152,108
.byte 153,105
.byte 155,103
.byte 156,101
.byte 158,99
.byte 160,96
.byte 161,94
.byte 163,92
.byte 165,89
.byte 166,86
.byte 168,83
.byte 169,81
.byte 171,78
.byte 173,75
.byte 174,72
.byte 176,68
.byte 177,65
.byte 179,62
.byte 181,58
.byte 182,55
.byte 184,51
.byte 186,48
.byte 187,44
.byte 189,40
.byte 190,36
.byte 192,32
.byte 192,32
.byte 190,36
.byte 189,40
.byte 187,44
.byte 186,48
.byte 184,51
.byte 182,55
.byte 181,58
.byte 179,62
.byte 177,65
.byte 176,68
.byte 174,72
.byte 173,75
.byte 171,78
.byte 169,81
.byte 168,83
.byte 166,86
.byte 165,89
.byte 163,92
.byte 161,94
.byte 160,96
.byte 158,99
.byte 156,101
.byte 155,103
.byte 153,105
.byte 152,108
.byte 150,109
.byte 148,111
.byte 147,113
.byte 145,115
.byte 144,116
.byte 142,118
.byte 140,120
.byte 139,121
.byte 137,122
.byte 135,123
.byte 134,125
.byte 132,126
.byte 131,127
.byte 129,128
.byte 127,128
.byte 126,129
.byte 124,130
.byte 123,130
.byte 121,131
.byte 119,131
.byte 118,132
.byte 116,132
.byte 114,132
.byte 113,132
.byte 111,132
.byte 110,132
.byte 108,132
.byte 106,132
.byte 105,131
.byte 103,131
.byte 101,130
.byte 100,130
.byte 98,129
.byte 97,128
.byte 95,128
.byte 93,127
.byte 92,126
.byte 90,125
.byte 89,123
.byte 87,122
.byte 85,121
.byte 84,120
.byte 82,118
.byte 80,116
.byte 79,115
.byte 77,113
.byte 76,111
.byte 74,109
.byte 72,108
.byte 71,105
.byte 69,103
.byte 68,101
.byte 66,99
.byte 64,96
.byte 63,94
.byte 61,92
.byte 59,89
.byte 58,86
.byte 56,83
.byte 55,81
.byte 53,78
.byte 51,75
.byte 50,72
.byte 48,68
.byte 47,65
.byte 45,62
.byte 43,58
.byte 42,55
.byte 40,51
.byte 38,48
.byte 37,44
.byte 35,40
.byte 34,36
.byte 32,32

.endsection