.section code
handleLevelOneWaves
    #add16Macro mEnemeyDelay
    jsr levelOneWave1
    jsr checkFireBoost
    rts

    ;lda mEnemeyDelay + 1
    ;cmp #0
    ;beq _checkFirstWaves
;
    ;lda mEnemeyDelay + 1
    ;cmp #1
    ;beq _waveGroup1
    rts

levelOneWave1
    lda mEnemeyDelay + 1
    cmp #0
    beq _firstWave
    rts
_firstWave
    lda mEnemeyDelay
    cmp #60
    beq _launchWave0
    cmp #90
    beq _launchWave1
    cmp #120
    beq _launchWave2
    cmp #150
    beq _launchWave3
    cmp #180
    beq _launchWave4
    
    rts
_waveGroup1
    lda mEnemeyDelay
    cmp #$60
    rts
_launchWave0
    jsr clearFireBoost
    lda #objectInactive
    sta mEnemyStatus00
    rts
_launchWave1
    lda #objectInactive
    sta mEnemyStatus01
    rts
_launchWave2
    lda #objectInactive
    sta mEnemyStatus02
    rts
_launchWave3
    lda #objectInactive
    sta mEnemyStatus03
    rts
_launchWave4
    lda #objectInactive
    sta mEnemyStatus04
    rts

checkFireBoost
    jsr _checkFireBoost0
    jsr _checkFireBoost1
    jsr _checkFireBoost2
    jsr _checkFireBoost3
    jsr _checkFireBoost4
    rts

_checkFireBoost0
    lda mEnemyStatus00
    jsr isEnemyHit
    bcc _incBoost0
    rts
_incBoost0
    lda #1
    sta mFireBoostGroup0
    rts

_checkFireBoost1
    lda mEnemyStatus01
    jsr isEnemyHit
    bcc _incBoost1
    rts
_incBoost1
    lda #1
    sta mFireBoostGroup1
    rts
_checkFireBoost2
    lda mEnemyStatus02
    jsr isEnemyHit
    bcc _incBoost2
    rts
_incBoost2
    lda #1
    sta mFireBoostGroup2
    rts
_checkFireBoost3
    lda mEnemyStatus03
    jsr isEnemyHit
    bcc _incBoost3
    rts
_incBoost3
    lda #1
    sta mFireBoostGroup3
    rts
_checkFireBoost4
    lda mEnemyStatus04
    jsr isEnemyHit
    bcc _incBoost4
    rts
_incBoost4
    lda #1
    sta mFireBoostGroup4
    rts


.endsection

.section variables
mFireBoostGroup0
    .byte $00
mFireBoostGroup1
    .byte $00
mFireBoostGroup2
    .byte $00
mFireBoostGroup3
    .byte $00
mFireBoostGroup4
    .byte $00
.endsection