.section code
handleLevelOneWaves
    jsr levelOneWaves
    jsr levelOneWave1
    jsr levelOneWave2
    jsr levelOneWave3
    jsr checkFireBoost
    rts
    rts

levelOneWaves
    lda mLayerZeroTile
    cmp #levelOneZeroMapStart - 5
    beq _firstWave
    rts
_firstWave
    lda #1
    sta mWave
    rts
.endsection

.section variables
mWave
    .byte $00
mNewWave
    .byte $00

.endsection