.section code
handleLevelOneWaves
    jsr levelOneWaves
    jsr levelOneWave1
    jsr levelOneWave2
    jsr levelOneWave3
   ; jsr levelOneThirdWave
   ;jsr levelOneFourthWave
    jsr checkFireBoost
    rts
    rts

levelOneWaves
    lda mLayerZeroTile
    cmp #levelOneZeroMapStart - 5
    beq _firstWave
    cmp #levelOneZeroMapStart - 20
    beq _secondWave
    rts
_firstWave
    lda #1
    sta mWave
    rts
_secondWave
    ; lda #2
    ; sta mWave
    ; stz mEnemeyDelay
    ; stz mEnemeyDelay + 1
_thirdWave
    ;lda #2
    ;sta mWave
   ; stz mEnemeyDelay
  ;  stz mEnemeyDelay + 1
    rts
   



; levelOneSecondWave
;     lda mWave
;     cmp #2
;     beq _continue
;     rts
; _continue
;      #add16Macro mEnemeyDelay
;     lda mEnemeyDelay
;     cmp #10
;     beq _launchShip0
;     cmp #25
;     beq _launchShip1
;     cmp #40
;     beq _launchShip2
;     cmp #55
;     beq _launchShip3
;     cmp #70
;     beq _launchShip4
;     cmp #80
;     bcs _nextStage
;     #add16Macro mEnemeyDelay
;     rts 
; _nextStage
;     jsr _chackNextStage
;     rts
; _launchShip0
;     jsr clearFireBoost
;     jsr _ship0
;     rts
; _launchShip1
;     jsr _ship1
;     rts
; _launchShip2
;     jsr _ship2
;     rts
; _launchShip3
;    jsr _ship3
;     rts
; _launchShip4
;     jsr _ship4
;     rts
; _ship0
;     lda #objectInactive
;     sta mEnemyStatus05
;     #initObjectMacro mEnemyStatus05, mEnemyX05, mEnemyY05, mEnemyPath05, constPathDown, 176, 000, spEnemyAddr04, mEnemySpriteAddr05
;     rts
; _ship1
;     lda #objectInactive
;     sta mEnemyStatus06
;     #initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 176, 000, spEnemyAddr05, mEnemySpriteAddr06
;     rts
; _ship2
;     lda #objectInactive
;     sta mEnemyStatus07
;     #initObjectMacro mEnemyStatus07, mEnemyX07, mEnemyY07, mEnemyPath07, constPathDown, 176, 000, spEnemyAddr06, mEnemySpriteAddr07
;     rts
; _ship3
;      lda #objectInactive
;     sta mEnemyStatus08
;     #initObjectMacro mEnemyStatus08, mEnemyX08, mEnemyY08, mEnemyPath08, constPathDown, 176, 000, spEnemyAddr07, mEnemySpriteAddr08
;     rts
; _ship4
;     lda #objectInactive
;     sta mEnemyStatus09
;     #initObjectMacro mEnemyStatus09, mEnemyX09, mEnemyY09, mEnemyPath09, constPathDown, 176, 000, spEnemyAddr04, mEnemySpriteAddr09
;     rts
; _chackNextStage
;     lda mEnemyStatus05
;     cmp #objectActive
;     bne _checkSecondObject
;     rts
; _checkSecondObject
;     lda mEnemyStatus06
;     cmp #objectActive
;     bne _checkThirdObject
;     rts
; _checkThirdObject
;     lda mEnemyStatus07
;     cmp #objectActive
;     bne _checkFourthObject
;     rts
; _checkFourthObject
;     lda mEnemyStatus08
;     cmp #objectActive
;     bne _checkFifthObject
;     rts
; _checkFifthObject
;     lda mEnemyStatus09
;     cmp #objectActive
;     bne _nextLevel
;     rts
; _nextLevel
;     inc mWave
;     stz mEnemeyDelay
;     stz mEnemeyDelay + 1
;     rts

; levelOneThirdWave
;     lda mWave
;     cmp #3
;     beq _continue
;     rts
; _continue
;     lda mEnemeyDelay
;     cmp #10
;     beq _launchShip0
;     cmp #25
;     beq _launchShip1
;     cmp #40
;     beq _launchShip2
;     cmp #55
;     beq _launchShip3
;     cmp #70
;     beq _launchShip4
;     cmp #80
;     bcs _nextStage
;     #add16Macro mEnemeyDelay
;     rts 
; _nextStage
;     jsr _chackNextStage
;     rts
; _launchShip0
;     #add16Macro mEnemeyDelay
;     jsr clearFireBoost
;     jsr _ship0
;     rts
; _launchShip1
;     #add16Macro mEnemeyDelay
;     jsr _ship1
;     rts
; _launchShip2
;     #add16Macro mEnemeyDelay
;     jsr _ship2
;     rts
; _launchShip3
;     #add16Macro mEnemeyDelay
;    jsr _ship3
;     rts
; _launchShip4
;     #add16Macro mEnemeyDelay
;     jsr _ship4
;     rts
; _ship0
;     lda #objectInactive
;     sta mEnemyStatus00
;     #initObjectMacro mEnemyStatus00, mEnemyX00, mEnemyY00, mEnemyPath00, constPathDown, 252, 000, spEnemyAddr08, mEnemySpriteAddr00
;     rts
; _ship1
;     lda #objectInactive
;     sta mEnemyStatus01
;     #initObjectMacro mEnemyStatus01, mEnemyX01, mEnemyY01, mEnemyPath01, constPathDown, 252, 000, spEnemyAddr09, mEnemySpriteAddr01
;     rts
; _ship2
;     lda #objectInactive
;     sta mEnemyStatus02
;     #initObjectMacro mEnemyStatus02, mEnemyX02, mEnemyY02, mEnemyPath02, constPathDown, 252, 000, spEnemyAddr10, mEnemySpriteAddr02
;     rts
; _ship3
;      lda #objectInactive
;     sta mEnemyStatus03
;     #initObjectMacro mEnemyStatus03, mEnemyX03, mEnemyY03, mEnemyPath03, constPathDown, 252, 000, spEnemyAddr11, mEnemySpriteAddr03
;     rts
; _ship4
;     lda #objectInactive
;     sta mEnemyStatus04
;     #initObjectMacro mEnemyStatus04, mEnemyX04, mEnemyY04, mEnemyPath04, constPathDown, 252, 000, spEnemyAddr08, mEnemySpriteAddr04
;     rts

; _chackNextStage
;     lda mEnemyStatus00
;     cmp #objectDisabled
;     beq _checkSecondObject
;     rts
; _checkSecondObject
;     lda mEnemyStatus01
;     cmp #objectDisabled
;     beq _checkThirdObject
;     rts
; _checkThirdObject
;     lda mEnemyStatus02
;     cmp #objectDisabled
;     beq _checkFourthObject
;     rts
; _checkFourthObject
;     lda mEnemyStatus03
;     cmp #objectDisabled
;     beq _checkFifthObject
;     rts
; _checkFifthObject
;     lda mEnemyStatus04
;     cmp #objectDisabled
;     beq _nextLevel
;     rts
; _nextLevel
;     inc mWave
;     stz mEnemeyDelay
;     stz mEnemeyDelay + 1
;     rts

levelOneFourthWave
    lda mWave
    cmp #2
    beq _continue
    rts
_continue
    lda mEnemeyDelay
    cmp #00
    beq _launchShip0
    cmp #50
    beq _launchShip1
    cmp #60
    bcs _nextStage
    #add16Macro mEnemeyDelay
    rts 
_nextStage
    jsr _chackNextStage
    rts
_launchShip0
    #add16Macro mEnemeyDelay
    jsr clearFireBoost
    jsr _ship0
    jsr _ship1
    jsr _ship2
    jsr _ship3
    jsr _ship4
    jsr _ship5
    jsr _ship6
    jsr _ship7
    jsr _ship8
    jsr _ship9
    rts
_launchShip1
    #add16Macro mEnemeyDelay
    jsr _ship5
    rts
_ship0
    lda #objectInactive
    sta mEnemyStatus05
    #initObjectMacro mEnemyStatus05, mEnemyX05, mEnemyY05, mEnemyPath05, constPathDown, 100, 000, spEnemyAddr04, mEnemySpriteAddr05
    rts
_ship1
    lda #objectInactive
    sta mEnemyStatus06
    #initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 150, 000, spEnemyAddr05, mEnemySpriteAddr06
    rts
_ship2
    lda #objectInactive
    sta mEnemyStatus07
    #initObjectMacro mEnemyStatus07, mEnemyX07, mEnemyY07, mEnemyPath07, constPathDown, 200, 000, spEnemyAddr06, mEnemySpriteAddr07
    rts
_ship3
     lda #objectInactive
    sta mEnemyStatus08
    #initObjectMacro mEnemyStatus08, mEnemyX08, mEnemyY08, mEnemyPath08, constPathDown, 250, 000, spEnemyAddr07, mEnemySpriteAddr08
    rts
_ship4
    lda #objectInactive
    sta mEnemyStatus09
    #initObjectMacro mEnemyStatus09, mEnemyX09, mEnemyY09, mEnemyPath09, constPathDown, 300, 000, spEnemyAddr04, mEnemySpriteAddr09
    rts
_ship5
    lda #objectInactive
    sta mEnemyStatus15
    #initObjectMacro mEnemyStatus15, mEnemyX15, mEnemyY15, mEnemyPath15, constPathDown, 50, 000, spEnemyAddr05, mEnemySpriteAddr15
    rts
_ship6
    lda #objectInactive
    sta mEnemyStatus11
    #initObjectMacro objectInactive, mEnemyX11, mEnemyY11, mEnemyPath11, constPathDown, 125, 000, spEnemyAddr09, mEnemySpriteAddr11
    rts
_ship7
    lda #objectInactive
    sta mEnemyStatus12
    #initObjectMacro mEnemyStatus12, mEnemyX12, mEnemyY12, mEnemyPath12, constPathDown, 175, 000, spEnemyAddr10, mEnemySpriteAddr12
    rts
_ship8
    lda #objectInactive
    sta mEnemyStatus13
    #initObjectMacro mEnemyStatus13, mEnemyX13, mEnemyY13, mEnemyPath13, constPathDown, 225, 000, spEnemyAddr11, mEnemySpriteAddr13
    rts
_ship9
    lda #objectInactive
    sta mEnemyStatus14
    #initObjectMacro mEnemyStatus14, mEnemyX14, mEnemyY14, mEnemyPath14, constPathDown, 275, 000, spEnemyAddr09, mEnemySpriteAddr14
    rts
_chackNextStage
    lda mEnemyStatus05
    cmp #objectActive
    bne _checkSecondObject
    rts
_checkSecondObject
    lda mEnemyStatus06
    cmp #objectActive
    bne _checkThirdObject
    rts
_checkThirdObject
    lda mEnemyStatus07
    cmp #objectActive
    bne _checkFourthObject
    rts
_checkFourthObject
    lda mEnemyStatus08
    cmp #objectActive
    bne _checkFifthObject
    rts
_checkFifthObject
    lda mEnemyStatus09
    cmp #objectActive
    bne _nextLevel
    rts
_checkSixthhObject
    lda mEnemyStatus01
    cmp #objectActive
    bne _nextLevel
    rts
_nextLevel
    inc mWave
    stz mEnemeyDelay
    stz mEnemeyDelay + 1
    rts
.endsection

.section variables
mWave
    .byte $00
mNewWave
    .byte $00

.endsection