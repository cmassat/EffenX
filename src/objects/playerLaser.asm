.section code
playerLaserSetup .macro
    lda mPlayerPosX
    clc
    adc #\5
    sta \1
    lda mPlayerPosX + 1
    adc #0
    sta \2

    lda mPlayerPosY
    sec
    sbc #8
    sta \3

    stz \3+1

    lda #1
    sta \4
    lda #LaserDelay
    sta mLaserDelay

.endmacro

playerFireDelayTimer
    lda mLaserDelay
    cmp #0
    beq _end
    dec mLaserDelay
    rts 
_end
    rts

playerFire
    lda mKeyl
    cmp #1
    beq _move
    jsr is_joy_a_btn_0_pressed
    bcc _move
    rts
_move
    lda mLaserDelay
    cmp #0
    beq _fireAway
    rts

_fireAway
    lda #LaserDelay
    sta mLaserDelay
    lda mLaser00Active
    cmp #0
    beq _playerFire0
    lda mLaser03Active
    cmp #0
    beq _playerFire1
    rts
_playerFire0
    jsr playerFire0
    jsr sound_play_fire
    rts
_playerFire1
    jsr playerFire1
    jsr sound_play_fire
    rts
playerFire0
    #playerLaserSetup mLaser00PosX, mLaser00PosX + 1, mLaser00PosY, mLaser00Active, 9
    #playerLaserSetup mLaser01PosX, mLaser01PosX + 1, mLaser01PosY, mLaser01Active, 12
    #playerLaserSetup mLaser02PosX, mLaser02PosX + 1, mLaser02PosY, mLaser02Active, 6
    rts

playerFire1
    #playerLaserSetup mLaser03PosX, mLaser03PosX + 1, mLaser03PosY, mLaser03Active, 9
    #playerLaserSetup mLaser04PosX, mLaser04PosX + 1, mLaser04PosY, mLaser04Active, 12
    #playerLaserSetup mLaser05PosX, mLaser05PosX + 1, mLaser05PosY, mLaser05Active, 6
    rts

playerLaserMac .macro
    lda \1
    cmp #0
    bne _checkMoveOk
    rts
_checkMoveOk
    lda \2
    cmp #3
    bcs _moveOK
    stz \1
    rts
_moveOK
    dec \2
    dec \2
    dec \2
.endmacro

playerLaserMove
    jsr playerLaser0
    jsr playerLaser1
    jsr playerLaser2

    jsr playerLaser3
    jsr playerLaser4
    jsr playerLaser5
    rts

playerLaser0
    lda mLaser00Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser0
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser00Posy
    cmp #3
    bcs _moveOK
    stz mLaser00Active
    rts
_moveOK
    dec mLaser00Posy
    dec mLaser00Posy
    dec mLaser00Posy
    #macroShowSprite spPlayer1Laser0, spLaser00 ,mLaser00PosX, mLaser00PosX+1, mLaser00PosY, SPRITE24L0C2 
    rts

playerLaser1
    lda mLaser01Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser1
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser01Posy
    cmp #3
    bcs _moveOK
    stz mLaser00Active
    rts
_moveOK
    dec mLaser01Posy
    dec mLaser01Posy
    dec mLaser01Posy
    lda mLaser01PosX
    clc
    adc #1
    sta mLaser01PosX
    lda mLaser01PosX + 1
    adc #0
    sta mLaser01PosX + 1
    #macroShowSprite spPlayer1Laser1, spLaser00 ,mLaser01PosX, mLaser01PosX+1, mLaser01PosY, SPRITE24L0C2 
    rts

playerLaser2
    lda mLaser02Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser2
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser02Posy
    cmp #3
    bcs _moveOK
    stz mLaser02Active
    rts
_moveOK
    dec mLaser02Posy
    dec mLaser02Posy
    dec mLaser02Posy

    lda mLaser02PosX
    sec
    sbc #1
    sta mLaser02PosX
    lda mLaser02PosX + 1
    sbc #0
    sta  mLaser02PosX + 1
    #macroShowSprite spPlayer1Laser2, spLaser00 ,mLaser02PosX, mLaser02PosX+1, mLaser02PosY, SPRITE24L0C2 
    rts

playerLaser3
    lda mLaser03Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser3
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser03Posy
    cmp #3
    bcs _moveOK
    stz mLaser03Active
    rts
_moveOK
    dec mLaser03Posy
    dec mLaser03Posy
    dec mLaser03Posy
    #macroShowSprite spPlayer1Laser3, spLaser00 ,mLaser03PosX, mLaser03PosX+1, mLaser03PosY, SPRITE24L0C2 
    rts

playerLaser4
    lda mLaser04Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser4
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser04Posy
    cmp #3
    bcs _moveOK
    stz mLaser04Active
    rts
_moveOK
    dec mLaser04Posy
    dec mLaser04Posy
    dec mLaser04Posy

    lda mLaser04PosX
    sec
    sbc #1
    sta mLaser04PosX
    lda mLaser04PosX + 1
    sbc #0
    sta  mLaser04PosX + 1
    #macroShowSprite spPlayer1Laser4, spLaser00 ,mLaser04PosX, mLaser04PosX+1, mLaser04PosY, SPRITE24L0C2 
    rts
 
playerLaser5
    lda mLaser05Active
    cmp #0
    bne _checkMoveOk
    lda #spPlayer1Laser5
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser05Posy
    cmp #3
    bcs _moveOK
    stz mLaser05Active
    rts
_moveOK
    dec mLaser05Posy
    dec mLaser05Posy
    dec mLaser05Posy

    lda mLaser05PosX
    clc
    adc #1
    sta mLaser05PosX
    lda mLaser05PosX + 1
    adc #0
    sta  mLaser05PosX + 1
    #macroShowSprite spPlayer1Laser5, spLaser00 ,mLaser05PosX, mLaser05PosX+1, mLaser05PosY, SPRITE24L0C2 
    rts
.endsection

LaserDelay = 20
mLaserDelay
    .byte 0
mLaser00PosX
    .byte $00, $00
mLaser00Posy
    .byte $00, $00
mLaser01PosX
    .byte $00, $00
mLaser01Posy
    .byte $00, $00
mLaser02PosX
    .byte $00, $00
mLaser02Posy
    .byte $00, $00
mLaser00Active
    .byte $00
mLaser01Active
    .byte $00
mLaser02Active
    .byte $00

mLaser03PosX
    .byte $00, $00
mLaser03Posy
    .byte $00, $00
mLaser04PosX
    .byte $00, $00
mLaser04Posy
    .byte $00, $00
mLaser05PosX
    .byte $00, $00
mLaser05Posy
    .byte $00, $00
mLaser03Active
    .byte $00
mLaser04Active
    .byte $00
mLaser05Active
    .byte $00