.section code
levelOneWave1
    lda mWave
    cmp #1
    beq _continue
    rts
_continue
    lda mNewWave
    cmp #0
    bne _beginLaunch
    inc mNewWave
    stz mEnemeyDelay
    stz mEnemeyDelay + 1
_beginLaunch
    lda mEnemeyDelay
    cmp #0
    beq _launchShip0
    cmp #30
    beq _launchShip1
    cmp #60
    beq _launchShip2
    cmp #90
    beq _launchShip3
    cmp #70
    beq _launchShip4
    cmp #85
    beq _launchShip5
    cmp #100
    beq _launchShip6
    cmp #115
    beq _launchShip7
    cmp #130
    beq _launchShip8
    cmp #140
    bcs _nextStage
    #addMacro mEnemeyDelay
    rts 
_nextStage
    jsr _checkNextStage
    rts
_launchShip0
    jsr clearFireBoost
    jsr _ship0
    rts
_launchShip1
    jsr _ship1
    rts
_launchShip2
    jsr _ship2
    rts
_launchShip3
    jsr _ship3
    rts
_launchShip4
    jsr _ship4
    jsr _ship5
    rts
_launchShip5
    jsr _ship6
    rts
_launchShip6
    jsr _ship7
    rts
_launchShip7
    jsr _ship8
    rts
_launchShip8
    jsr _ship9
  ;  jsr _ship10
    rts
_ship0
    #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus00
    #initObjectMacro mEnemyStatus00, mEnemyX00, mEnemyY00, mEnemyPath00, constPathDown, 100, 000, spEnemyAddr00, mEnemySpriteAddr00
    rts
_ship1
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus01
    #initObjectMacro mEnemyStatus01, mEnemyX01, mEnemyY01, mEnemyPath01, constPathDown, 100, 000, spEnemyAddr01, mEnemySpriteAddr01
    rts
_ship2
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus02
    #initObjectMacro mEnemyStatus02, mEnemyX02, mEnemyY02, mEnemyPath02, constPathDown, 100, 000, spEnemyAddr02, mEnemySpriteAddr02
    rts
_ship3
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus03
    #initObjectMacro mEnemyStatus03, mEnemyX03, mEnemyY03, mEnemyPath03, constPathDown, 100, 000, spEnemyAddr03, mEnemySpriteAddr03
    rts
_ship4
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus04
    #initObjectMacro mEnemyStatus04, mEnemyX04, mEnemyY04, mEnemyPath04, constPathDown, 100, 000, spEnemyAddr01, mEnemySpriteAddr04
    rts

_ship5
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus05
    #initObjectMacro mEnemyStatus05, mEnemyX05, mEnemyY05, mEnemyPath05, constPathDown, 176, 000, spEnemyAddr04, mEnemySpriteAddr05
    rts
_ship6
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus06
    #initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 176, 000, spEnemyAddr05, mEnemySpriteAddr06
    rts
_ship7
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus07
    #initObjectMacro mEnemyStatus07, mEnemyX07, mEnemyY07, mEnemyPath07, constPathDown, 176, 000, spEnemyAddr06, mEnemySpriteAddr07
    rts
_ship8
     #addMacro mEnemeyDelay
     lda #objectInactive
    sta mEnemyStatus08
    #initObjectMacro mEnemyStatus08, mEnemyX08, mEnemyY08, mEnemyPath08, constPathDown, 176, 000, spEnemyAddr07, mEnemySpriteAddr08
    rts
_ship9
     #addMacro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus09
    #initObjectMacro mEnemyStatus09, mEnemyX09, mEnemyY09, mEnemyPath09, constPathDown, 176, 000, spEnemyAddr04, mEnemySpriteAddr09
    rts

 ;;;;;;;;;;;;;;;;;;
; _ship10
;      #addMacro mEnemeyDelay
;     lda #objectInactive
;     sta mEnemyStatus10
;     #initObjectMacro mEnemyStatus10, mEnemyX10, mEnemyY10, mEnemyPath10, constPathDown, 252, 000, spEnemyAddr08, mEnemySpriteAdd10
;     rts
; _ship11
;      #addMacro mEnemeyDelay
;     lda #objectInactive
;     sta mEnemyStatus11
;     #initObjectMacro mEnemyStatus11, mEnemyX11, mEnemyY11, mEnemyPath11, constPathDown, 252, 000, spEnemyAddr09, mEnemySpriteAddr11
;     rts
; _ship12
;      #addMacro mEnemeyDelay
;     lda #objectInactive
;     sta mEnemyStatus12
;     #initObjectMacro mEnemyStatus12, mEnemyX12, mEnemyY12, mEnemyPath12, constPathDown, 252, 000, spEnemyAddr10, mEnemySpriteAddr12
;     rts
; _ship13
;      #addMacro mEnemeyDelay
;      lda #objectInactive
;     sta mEnemyStatus13
;     #initObjectMacro mEnemyStatus13, mEnemyX13, mEnemyY13, mEnemyPath13, constPathDown, 252, 000, spEnemyAddr11, mEnemySpriteAddr13
;     rts
; _ship14
;      #addMacro mEnemeyDelay
;    lda #objectInactive
;    sta mEnemyStatus14
;    #initObjectMacro mEnemyStatus14, mEnemyX14, mEnemyY14, mEnemyPath14, constPathDown, 252, 000, spEnemyAddr08, mEnemySpriteAddr14
    rts

_checkNextStage  
    jsr areEnemiesClear
    bcc _nextLevel 
    rts
_nextLevel
    inc mWave
    stz mNewWave
    rts

areEnemiesClear
  lda mEnemyStatus00
    cmp #objectActive
    bne _checkObject01
    sec
    rts
_checkObject01
    lda mEnemyStatus01
    cmp #objectActive
    bne _checkObject02
    sec
    rts
_checkObject02
    lda mEnemyStatus02
    cmp #objectActive
    bne _checkObject03
    sec
    rts
_checkObject03
    lda mEnemyStatus03
    cmp #objectActive
    bne _checkObject04
    sec
    rts
_checkObject04
    lda mEnemyStatus04
    cmp #objectActive
    bne _checkObject05
    sec
    rts
_checkObject05
    lda mEnemyStatus05
    cmp #objectActive
    bne _checkObject06
    sec
    rts
_checkObject06
    lda mEnemyStatus06
    cmp #objectActive
    bne _checkObject07
    sec
    rts
_checkObject07
    lda mEnemyStatus07
    cmp #objectActive
    bne _checkObject08
    sec
    rts
_checkObject08
    lda mEnemyStatus08
    cmp #objectActive
    bne _checkObject09
    rts
_checkObject09
    lda mEnemyStatus09
    cmp #objectActive
    bne _isClear
    sec
    rts
_isClear
    clc
    rts
.endsection