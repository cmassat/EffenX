.section code
handleMiniBoss
    jsr moveMiniBoss
    jsr showMiniBoss
    jsr handleMiniBossCollision
    jsr handleMiniBossHitFlash
    rts

setMiniBossX
    lda #constMiniBossStrength
    sta mMiniBossStrength
    sta mMiniBossX
    sta mMiniBossX1 + 2
    stx mMiniBossX + 1
    stx mMiniBossX1 + 1

    lda mMiniBossX
    sta mMiniBossX1
    lda mMiniBossX + 1
    sta mMiniBossX1 + 1
    #addMacro  mMiniBossX1, 24
    rts

setMiniBossY
    sta mMiniBossY
    stx mMiniBossY + 1
    rts

setMiniDirection
    sta mMiniBossDirection
    rts

setMinitBossStatus
    sta mMiniBossStatus
    rts

moveMiniBoss
    lda mMiniBossStatus
    cmp #objectActive
    beq _move
    rts
_move
    lda mMiniBossDirection
    cmp #directionLeft
    beq _goLeft
    cmp #directionRight
    beq _goRight
    rts
_goLeft
    lda mMiniBossX
    ldx mMiniBossX + 1
    jsr isOutOfBoundsX
    bcs _okToMoveLeft
    lda #directionRight
    sta mMiniBossDirection
    lda #<0
    sta  mMiniBossX
    lda #>0
    sta  mMiniBossX + 1
    rts
_okToMoveLeft
    #subtractMacro mMiniBossX,3
    lda mMiniBossX
    sta mMiniBossX1
    lda mMiniBossX + 1
    sta mMiniBossX1 + 1
    #addMacro  mMiniBossX1, 24
    rts
_goRight
    lda mMiniBossX
    ldx mMiniBossX + 1
    jsr isOutOfBoundsX
    bcs _okToMoveRight
    lda #directionLeft
    sta mMiniBossDirection
    lda #<320
    sta  mMiniBossX
    lda  #>320
    sta  mMiniBossX + 1
    rts
_okToMoveRight
    #addMacro mMiniBossX,3
    lda mMiniBossX
    sta mMiniBossX1
    lda mMiniBossX + 1
    sta mMiniBossX1 + 1
    #addMacro  mMiniBossX1, 24
    rts

showMiniBoss
    jsr _show0
    jsr _show1
    rts
_show0
        #showSpriteMacroA spMiniBossNumber0, mMiniBossAddr1, mMiniBossX1 ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    rts
_show1
        #showSpriteMacroA spMiniBossNumber1, mMiniBossAddr0, mMiniBossX ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    rts

handleMiniBossCollision
    lda mMiniBossStatus
    cmp #objectCollided
    beq _checkShield
    rts
_checkShield
    lda mMiniBossStrength
    cmp #0
    bne _lowerShield
    rts
_lowerShield
    dec mMiniBossStrength
    lda #objectActive
    sta mMiniBossStatus
    lda #constMiniBossFlashTimer
    sta mMiniBossFlashTimer
    rts

handleMiniBossHitFlash
    lda mMiniBossFlashTimer
    cmp #0
    bne _showFlash
    lda #spHitFlashNumber
    jsr setSpriteNumber
    jsr hideSprite
    rts
_showFlash
    #showSpriteMacro spHitFlashNumber, spExplosionfr1, mMiniBossX, mMiniBossY, SPRITE24L1C2, objectActive
    ;#showSpriteMacroA spHitFlashNumber, mFlashAddr, mMiniBossX ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    dec mMiniBossFlashTimer
    rts
.endsection

.section variables
constMiniBossStrength = 10
constMiniBossFlashTimer = 3

mMiniBossStatus
    .byte $00
mMiniBossDirection
    .byte $00
mMiniBossX
    .byte $00, $00

mMiniBossX1
    .byte $00, $00

mMiniBossY
    .byte $00, $00
mMiniBossStrength
    .byte $00
mMiniBossAddr0
    .byte <spMiniBossAddr0, >spMiniBossAddr0, `spMiniBossAddr0
mMiniBossAddr1
    .byte <spMiniBossAddr1, >spMiniBossAddr1, `spMiniBossAddr1
mFlashAddr
    .byte <spExplosionfr0, >spExplosionfr0, `spExplosionfr0
mMiniBossFlashTimer
    .byte $00
.endsection

