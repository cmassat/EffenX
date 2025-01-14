.section code
handleHomingMissle
    jsr moveHomingMissle0
    rts

moveHomingMissle0
    lda #0
    jsr setHomingMissleNumber

    ldy #offsetStatus
    lda (POINTER_SET), y
    cmp #objectActive
    beq _move
    rts
_move
    ldy #offsetOriginY
    lda (POINTER_SET), y
    cmp #240
    bcs _reset
    ldy #offsetOriginX
    iny
    lda (POINTER_SET), y
    cmp #1
    bcs _checkRightScreen
    dey
    lda (POINTER_SET), y
    cmp #5
    bcc _reset
    bra _okToMove
_checkRightScreen
    dey
    lda (POINTER_SET), y
    cmp #$60
    bcs _reset
_okToMove
    jsr showHomingSprite

    ldy #offsetOriginX
    jsr homingSet16
    jsr setX1

    ldy #offsetOriginY
    jsr homingSet16
    jsr setY1

    ldy #offsetDestX
    jsr homingSet16
    jsr setX2

    ldy #offsetDestY
    jsr homingSet16
    jsr setY2

    ldy #offsetDx
    jsr homingSet16
    jsr setDx

    ldy #offsetDy
    jsr homingSet16
    jsr setDy

    ldy #offsetDecision
    jsr homingSet16
    jsr setDecision

    jsr nextHomingMissleCoordinates
    jsr getLineX
    ldy #offsetOriginX
    sta (POINTER_SET), y
    txa
    iny
    sta (POINTER_SET), y
    jsr getLineY
    ldy #offsetOriginY
    sta (POINTER_SET), y
    txa
    iny
    sta (POINTER_SET), y
    rts
_reset
   lda #0
   jsr setHomingMissleNumber
   lda #objectDisabled
   ldy #offsetStatus
   sta (POINTER_SET),y
   ldy #offsetSpriteNumber
   lda (POINTER_SET),y
   jsr setSpriteNumber
   jsr hideSprite 
   rts

initHomingMissle  
    lda #objectActive
    ldy #offsetStatus
    sta (POINTER_SET), y

    jsr initLinePath
    ldy #offsetPath
    sta (POINTER_SET), y

    jsr getDx
    ldy #offsetDx
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    jsr getDy
    ldy #offsetDy
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    jsr getDecision
    jsr getPath
    ldy #offsetPath
    sta (POINTER_SET),y 
    rts


showHomingSprite
    ldy #offsetSpriteNumber
    lda (POINTER_SET),Y
    jsr setSpriteNumber

    ldy #offsetOriginX
    lda (POINTER_SET),Y
    pha
    iny
    lda (POINTER_SET),Y
    tax
    pla
    jsr setSpriteX

    ldy #offsetOriginY
    lda (POINTER_SET),Y
    pha
    iny
    lda (POINTER_SET),Y
    tax
    pla
    jsr setSpriteY

    lda #<spEnemyLaserOrange
    ldx #>spEnemyLaserOrange
    ldy #`spEnemyLaserOrange
    jsr setSpriteAddress

    lda #SPRITE24L0C2
    jsr showSprite
    jsr debug
    rts

homingSet16
    lda (POINTER_SET),y
    pha
    iny
    lda (POINTER_SET),y
    tax
    pla
rts

nextHomingMissleCoordinates
    ldy #offsetPath
    lda (POINTER_SET),y
    cmp #constDownRight
    beq _drawDownRight
    cmp #constDownLeftSteep
    beq _drawDownLeftSteep
   
    cmp #constDownRightSteep
    beq _downRightSteep
    cmp #constDownLeftSteep
    beq _drawDownLeftSteep
    cmp #constDownLeft
    beq _drawDownLeft
    rts
_drawDownRight
    jsr drawDownRight
    rts
_drawDownLeftSteep
    jsr drawDownLeftSteep
    rts
_drawDownLeft
    jsr drawDownLeft
    rts
_downRightSteep
    jsr drawDownRightSteep
    rts
setHomingMissleNumber
    asl a
    tax
    lda mHomingMissleData,x
    sta POINTER_SET
    inx
    lda mHomingMissleData,x
    sta POINTER_SET + 1
    rts

setHomingOriginX
    ldy #offsetOriginX
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    rts

setHomingOriginY
    ldy #offsetOriginY
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    rts
setHomingDestX
    ldy #offsetDestX
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    rts

setHomingDestY
    ldy #offsetDestY
    sta (POINTER_SET),y
    iny
    txa
    sta (POINTER_SET),y
    rts

setHomingStatus
    ldy #offsetStatus
    sta (POINTER_SET),y
    rts

getHomingStatus
    ldy #offsetStatus
    lda (POINTER_SET),y
    rts

enableHoming0
    lda #0
    jsr setHomingMissleNumber
    ldy #offsetStatus
    lda #objectInactive
    sta (POINTER_SET),y
    rts
.endsection

.section variables

mHomingMissleData
.word mHomingMissleX00
.word mHomingMissleX01
.word mHomingMissleX02
.word mHomingMissleX03
.word mHomingMissleX04

offsetOriginX       = 0
offsetOriginY       = 2
offsetDestX         = 4
offsetDestY         = 6
offsetPath          = 8
offsetStatus        = 9
offsetSpriteNumber  = 10
offsetDx            = 11
offsetDy            = 13
offsetDecision      = 15
mHomingMissleX00 ;0
    .byte $00, $00
mHomingMissleY00 ;2
    .byte $00, $00
mHomingMissleDestX00 ;4
    .byte $00, $00
mHomingMissleDestY00 ;6
    .byte $00, $00
mHomingMisslePath00; 8
    .byte $00
mHomingMissleStatus00 ; 9
    .byte $00
mHomingMissleSpriteNumber00; 10
    .byte spHomingMissleNumber00
mHomingMissleDx00 ; 11
    .byte $00, $00
mHomingMissleDy00;13
    .byte $00, $00
mHomingMissleDecission00;15
    .byte $00

mHomingMissleX01
    .byte $00, $00
mHomingMissleY01
    .byte $00, $00
mHomingMissleDestX01
    .byte $00, $00
mHomingMissleDestY01
    .byte $00, $00
mHomingMisslePath01
    .byte $00
mHomingMissleStatus01
    .byte $00
mHomingMissleSpriteNumber01
    .byte $00

mHomingMissleX02
    .byte $00, $00
mHomingMissleY02
    .byte $00, $00
mHomingMissleDestX02
    .byte $00, $00
mHomingMissleDestY02
    .byte $00, $00
mHomingMisslePath02
    .byte $00
mHomingMissleStatus02
    .byte $00
mHomingMissleSpriteNumber02
    .byte $00

mHomingMissleX03
    .byte $00, $00
mHomingMissleY03
    .byte $00, $00
mHomingMissleDestX3
    .byte $00, $00
mHomingMissleDestY03
    .byte $00, $00
mHomingMisslePath03
    .byte $00
mHomingMissleStatus03
    .byte $00
mHomingMissleSpriteNumber03
    .byte $00

mHomingMissleX04
    .byte $00, $00
mHomingMissleY04
    .byte $00, $00
mHomingMissleDestX04
    .byte $00, $00
mHomingMissleDestY04
    .byte $00, $00
mHomingMisslePath04
    .byte $00
mHomingMissleStatus04
    .byte $00
mHomingMissleSpriteNumber04
    .byte $00
.endsection