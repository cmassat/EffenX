.section code
playerLaserSetup .macro laserX, laserY, status, xOffSet
    lda mPlayerPosX
    clc
    adc #\xOffSet
    sta \laserX
    lda mPlayerPosX + 1
    adc #0
    sta \laserX + 1

    lda mPlayerPosY
    sec
    sbc #8
    sta \laserY

    stz \laserY+1

    lda #objectActive
    sta \status
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
    lda mLaserActive00
    cmp #objectInactive
    beq _playerFire0
    lda mLaserActive03
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
    lda mPlayerLaserPower
    cmp #0
    beq _low
    cmp #1
    beq _med

    rts
_low
    #playerLaserSetup mLaser00PosX, mLaser00PosY, mLaserActive00, 9
    rts
_med
    #playerLaserSetup mLaser00PosX, mLaser00PosY, mLaserActive00, 9
    #playerLaserSetup mLaser01PosX, mLaser01PosY, mLaserActive01, 12
    #playerLaserSetup mLaser02PosX, mLaser02PosY, mLaserActive02, 6
    rts

playerFire1
    lda mPlayerLaserPower
    cmp #2
    beq _hi
    rts
_hi
    #playerLaserSetup mLaser03PosX, mLaser03PosY, mLaserActive03, 9
    #playerLaserSetup mLaser04PosX, mLaser04PosY, mLaserActive04, 12
    #playerLaserSetup mLaser05PosX, mLaser05PosY, mLaserActive05, 6
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
;     lda mPlayerLaserPower
;     cmp #0
;     beq _low
;     cmp #1
;     beq _med
;     cmp #2
;     beq _hi
;     rts
; _low
;     jsr playerLaser0
   
;     rts
; _med
;     jsr playerLaser0
;     jsr playerLaser1
;     jsr playerLaser2
;     rts
; _hi
    jsr playerLaser0
    jsr playerLaser1
    jsr playerLaser2

    jsr playerLaser3
    jsr playerLaser4
    jsr playerLaser5
    rts

playerLaser0
    lda mLaserActive00
    cmp #objectActive
    beq _checkMoveOk
    lda #spPlayer1Laser0
    jsr setSpriteNumber
    jsr hideSprite
    rts
_checkMoveOk
    lda mLaser00Posy
    cmp #3
    bcs _moveOK
    lda #objectInactive
    sta mLaserActive00
    rts
_moveOK
    dec mLaser00Posy
    dec mLaser00Posy
    dec mLaser00Posy
    #macroShowSprite spPlayer1Laser0, spLaser00 ,mLaser00PosX, mLaser00PosX+1, mLaser00PosY, SPRITE24L0C2 
    rts

playerLaser1
    lda mLaserActive01
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
    lda mLaserActive02
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
    stz mLaserActive02
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
    lda mLaserActive03
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
    stz mLaserActive03
    rts
_moveOK
    dec mLaser03Posy
    dec mLaser03Posy
    dec mLaser03Posy
    #macroShowSprite spPlayer1Laser3, spLaser01 ,mLaser03PosX, mLaser03PosX+1, mLaser03PosY, SPRITE24L0C2 
    rts

playerLaser4
    lda mLaserActive04
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
    stz mLaserActive04
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
    #macroShowSprite spPlayer1Laser4, spLaser01 ,mLaser04PosX, mLaser04PosX+1, mLaser04PosY, SPRITE24L0C2 
    rts
 
playerLaser5
    lda mLaserActive05
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
    stz mLaserActive05
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
    #macroShowSprite spPlayer1Laser5, spLaser01 ,mLaser05PosX, mLaser05PosX+1, mLaser05PosY, SPRITE24L0C2 
    rts

deactivateAllLasers
    lda #objectInactive
    sta mLaserActive00
    sta mLaserActive01
    sta mLaserActive02
    sta mLaserActive03
    sta mLaserActive04
    sta mLaserActive05 
    rts

disableAllLasers
    lda #objectInactive
    sta mLaserActive00
    sta mLaserActive01
    sta mLaserActive02
    sta mLaserActive03
    sta mLaserActive04
    sta mLaserActive05

    lda #0
    sta mLaser00Posy
    sta mLaser01Posy
    sta mLaser02Posy
    sta mLaser03Posy
    sta mLaser04Posy
    sta mLaser05Posy

    lda spPlayer1Laser0
    jsr setSpriteNumber
    jsr hideSprite

    lda spPlayer1Laser1
    jsr setSpriteNumber
    jsr hideSprite

    lda spPlayer1Laser2
    jsr setSpriteNumber
    jsr hideSprite

    lda spPlayer1Laser3
    jsr setSpriteNumber
    jsr hideSprite

    lda spPlayer1Laser4
    jsr setSpriteNumber
    jsr hideSprite

    lda spPlayer1Laser5
    jsr setSpriteNumber
    jsr hideSprite
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
mLaserActive00
    .byte $00
mLaserActive01
    .byte $00
mLaserActive02
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
mLaserActive03
    .byte $00
mLaserActive04
    .byte $00
mLaserActive05
    .byte $00