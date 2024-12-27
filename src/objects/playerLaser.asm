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
    beq _move
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
    
    rts
_playerFire0
    jsr playerFire0
    jsr sound_play_fire
    rts

playerFire0
    #playerLaserSetup mLaser00PosX, mLaser00PosX + 1, mLaser00PosY, mLaser00Active, 9
    #playerLaserSetup mLaser01PosX, mLaser01PosX + 1, mLaser01PosY, mLaser01Active, 12
    #playerLaserSetup mLaser02PosX, mLaser02PosX + 1, mLaser02PosY, mLaser02Active, 6
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
.endsection


LaserDelay = 20
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
mLaserDelay
    .byte 0
