.section code
handleMiniBoss
    jsr moveMiniBoss
    jsr showMiniBoss
    jsr handleMiniBossCollision
    jsr handleMiniBossHitFlash
    jsr miniBossActivateLaser
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

setMiniBossStatus
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
    lda #objectCollided
    sta mMiniBossStatus
    jsr miniBossExplosion
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
    
    dec mMiniBossFlashTimer
    lda mMiniBossX 
    clc
    adc #12
    sta mMiniBossHitX
    lda mMiniBossHitX + 1
    adc #0
    sta mMiniBossHitX + 1

    lda mMiniBossY
    clc
    adc #6
    sta mMiniBossHitY
    lda mMiniBossY + 1
    adc #0
    sta mMiniBossHitY + 1
    #showSpriteMacroA spHitFlashNumber, mFlashAddr, mMiniBossHitX ,mMiniBossHitY, SPRITE24L0C2, mMiniBossStatus
    rts

miniBossExplosion
    lda mMiniBossStatus
    cmp #objectCollided
    beq _checkTimer
    rts
_checkTimer
    lda mMiniBossTimer
    cmp #0
    bne _showExplosion
    lda #30
    sta mMiniBossTimer  
_showExplosion
    dec mMiniBossTimer
    lda mMiniBossTimer
    cmp #20
    bcs _frame0
    cmp #10
    bcs _frame1
    cmp #1
    bcs _frame2
    jsr _disableMiniBoss
    rts
_frame0
    #showSpriteMacroA spMiniBossNumber0, mExplosionAddress0, mMiniBossX1 ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    rts
_frame1
    #showSpriteMacroA spMiniBossNumber0, mExplosionAddress1, mMiniBossX1 ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    rts
_frame2
    #showSpriteMacroA spMiniBossNumber0, mExplosionAddress2, mMiniBossX1 ,mMiniBossY, SPRITE24L0C2, mMiniBossStatus
    rts
_disableMiniBoss
    lda #objectDisabled
    sta mMiniBossStatus
    lda spMiniBossNumber0
    jsr setSpriteNumber
    jsr hideSprite

    lda spMiniBossNumber1
    jsr setSpriteNumber
    jsr hideSprite
    rts

miniBossActivateLaser
    lda mMiniBossStatus
    cmp #objectActive
    beq _checkLaser
    rts
_checkLaser
    lda #0
    jsr setHomingMissleNumber
    jsr getHomingStatus
    cmp #objectActive
    bne _activateLaser
    rts
_activateLaser
    lda #objectActive
    jsr setHomingStatus

    lda mMiniBossX
    clc 
    adc #24
    pha
    lda mMiniBossX + 1
    adc #0
    tax
    pla
    jsr setHomingOriginX

    lda mMiniBossY
    clc
    adc #12
    pha

    lda mMiniBossY + 1
    adc #0
    sta mMiniBosslaserY + 1
    tax
    pla
    jsr setHomingOriginY

    lda mPlayerPosX
    ldx mPlayerPosX + 1
    jsr setHomingDestX
    
    lda mPlayerPosY
    ldx mPlayerPosY + 1
    jsr setHomingDestY

    jsr initHomingMissle
    rts

nextMiniBossLaserCoordinated
    lda mMiniBosslaserX
    ldx mMiniBosslaserX + 1
    jsr setHomingOriginX

    lda mMiniBosslaserY
    ldx mMiniBosslaserY + 1
    jsr setY1

    lda mMiniBossXDest
    ldx mMiniBossXDest + 1
    jsr setX2

    lda mMiniBossYDest
    ldx mMiniBossYDest + 1
    jsr setY2

    lda mMiniBossLinePath
    cmp #constDownRight
    bne _drawDownLeft
    jsr drawDownRight
    rts
_drawDownLeft
    jsr drawDownLeft
    rts
getMinitBossLaserCoordinates
    jsr getLineX
    sta mMiniBosslaserX
    stx mMiniBosslaserX + 1
    jsr getLineY
    sta mMiniBosslaserY
    stx mMiniBosslaserY + 1
    rts
.endsection

.section variables
constMiniBossStrength = 10
constMiniBossFlashTimer = 10
mMiniBossTimer
    .byte $00
mMiniBossFrame
    .byte $00
mMiniBossLinePath
    .byte $00
; mMiniBosslaserStatus
;     .byte $00
mMiniBosslaserX
    .byte $00, $00
mMiniBosslaserY
    .byte $00, $00
mMiniBossXDest
    .byte $00, $00
mMiniBossYDest
    .byte $00, $00
mMiniBossStatus
    .byte $00
mMiniBossDirection
    .byte $00
mMiniBossX
    .byte $00, $00

mMiniBossX1
    .byte $00, $00
mMiniBossHitX
    .byte $00, $00
mMiniBossHitY
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
mlaserAddr
    .byte <spEnemyLaserOrange, >spEnemyLaserOrange, `spEnemyLaserOrange
mMiniBossFlashTimer
    .byte $00
mExplosionAddress0
    .byte <spExplosionfr0, >spExplosionfr0, `spExplosionfr0
mExplosionAddress1
    .byte <spExplosionfr1, >spExplosionfr1, `spExplosionfr1
mExplosionAddress2
    .byte <spExplosionfr2, >spExplosionfr2, `spExplosionfr2
.endsection

