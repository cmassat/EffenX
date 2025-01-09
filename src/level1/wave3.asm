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
    ; cmp #25
    ; beq _launchShip1
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
    jsr _chackNextStage
    rts
_launchShip0
    ;jsr clearFireBoost
    jsr _ship0
    rts
; _launchShip2
;     jsr _ship2
;     rts
; _launchShip3
;    jsr _ship3
;     rts
; _launchShip4
;     jsr _ship4
;     rts
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