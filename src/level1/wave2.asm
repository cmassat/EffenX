.section code
levelOneWave2
    lda mWave
    cmp #2
    beq _continue
    rts
_continue
    lda mNewWave
    cmp #0
    bne _beginLaunch
    stz mEnemeyDelay
    stz mEnemeyDelay + 1
    inc mNewWave
_beginLaunch
    lda mEnemeyDelay
    cmp #0
    beq _launchShip0
   cmp #25
   beq _launchShip1
   ;cmp #40
   ;beq _launchShip2
   ;cmp #55
   ;beq _launchShip3
   ;cmp #70
   ;beq _launchShip4
    cmp #30
    bcs _nextStage
    #add16Macro mEnemeyDelay
    rts 
_nextStage
    jsr _checkNextStage
    rts
_launchShip0
    ;jsr clearFireBoost
    jsr _ship0
    jsr _ship1
    jsr _ship2
    jsr _ship3
    jsr _ship4
    rts
_launchShip1
    jsr _ship5
    jsr _ship6
    jsr _ship7
    jsr _ship8
    jsr _ship9
    rts
_launchShip2
    jsr _ship2
    rts
_launchShip3
   jsr _ship3
    rts
_launchShip4
    jsr _ship4
    rts
_ship0
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus05
    sta mEnemyLaserActive05
  ;  #initObjectMacro mEnemyStatus05, mEnemyX05, mEnemyY05, mEnemyPath05, constPathDown, 64, 000, spEnemyAddr04, mEnemySpriteAddr05
    rts
_ship1
#add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus06
    sta mEnemyLaserActive06
    #initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 128, 000, spEnemyAddr05, mEnemySpriteAddr06 
    rts
_ship2
#add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus07
    sta mEnemyLaserActive07
    #initObjectMacro mEnemyStatus07, mEnemyX07, mEnemyY07, mEnemyPath07, constPathDown, 192, 000, spEnemyAddr06, mEnemySpriteAddr07
    rts
_ship3
#add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus08
    sta mEnemyLaserActive08
    #initObjectMacro mEnemyStatus08, mEnemyX08, mEnemyY08, mEnemyPath08, constPathDown, 256, 000, spEnemyAddr07, mEnemySpriteAddr08
    rts
_ship4
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus09
    sta mEnemyLaserActive09
   #initObjectMacro mEnemyStatus09, mEnemyX09, mEnemyY09, mEnemyPath09, constPathDown, 320, 000, spEnemyAddr04, mEnemySpriteAddr09
    rts

_ship5
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus10
    #initObjectMacro mEnemyStatus10, mEnemyX10, mEnemyY10, mEnemyPath10, constPathDown, 32, 000, spEnemyAddr08, mEnemySpriteAdd10
    rts
_ship6
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus11
    #initObjectMacro mEnemyStatus11, mEnemyX11, mEnemyY11, mEnemyPath11, constPathDown, 96, 000, spEnemyAddr09, mEnemySpriteAddr11
    rts
_ship7
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus12
    #initObjectMacro mEnemyStatus12, mEnemyX12, mEnemyY12, mEnemyPath12, constPathDown, 160, 000, spEnemyAddr10, mEnemySpriteAddr12
    rts
_ship8
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus13
    #initObjectMacro mEnemyStatus13, mEnemyX13, mEnemyY13, mEnemyPath13, constPathDown, 224, 000, spEnemyAddr11, mEnemySpriteAddr13
    rts
_ship9
    #add16Macro mEnemeyDelay
   lda #objectInactive
    sta mEnemyStatus14
    #initObjectMacro mEnemyStatus14, mEnemyX14, mEnemyY14, mEnemyPath14, constPathDown, 288, 000, spEnemyAddr08, mEnemySpriteAddr14
    rts
_ship10
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus15
    #initObjectMacro mEnemyStatus15, mEnemyX15, mEnemyY15, mEnemyPath15, constPathDown, 352, 000, spEnemyAddr08, mEnemySpriteAddr15
    rts
_checkNextStage  
    jsr areEnemiesClear
    bcc _nextLevel 
    rts
_nextLevel
    inc mWave
    stz mNewWave
    rts
.endsection