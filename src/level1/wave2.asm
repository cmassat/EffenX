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
_checkNextStage  
    jsr areEnemiesClear
    bcc _nextLevel 
    rts
_nextLevel
    inc mWave
    stz mNewWave
    rts
.endsection