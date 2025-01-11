.section code
levelOneWave3
    lda mWave
    cmp #3
    beq _continue
    rts
_continue
    lda mNewWave
    cmp #0
    bne _beginLaunch
    stz mEnemeyDelay
    stz mEnemeyDelay + 1
    inc mNewWave
    rts
_beginLaunch
    lda mEnemeyDelay
    cmp #0
    beq _launchShip0
    cmp #10
    beq _launchShip1
    cmp #30
    bcs _nextStage
    #add16Macro mEnemeyDelay
    rts 
_nextStage
    jsr _chackNextStage
    rts
_launchShip0
    jsr _ship0
    rts
_launchShip1
    jsr _ship1
    rts
_ship0
    #add16Macro mEnemeyDelay
    lda #<324
    ldx #>324
    jsr setMiniBossX

    lda #<100
    ldx #>100
    jsr setMiniBossY

    lda #directionLeft
    jsr setMiniDirection

    lda #objectActive
    jsr setMinitBossStatus

    rts
_ship1
    #add16Macro mEnemeyDelay
    lda #objectInactive
    sta mEnemyStatus06
    sta mEnemyLaserActive06
    #initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 128, 000, spEnemyAddr05, mEnemySpriteAddr06 
    rts
_chackNextStage  
    lda mMiniBossStatus
    cmp #objectDisabled
    bcc _nextLevel 
    rts
_nextLevel
    inc mWave
    stz mNewWave
    rts
.endsection