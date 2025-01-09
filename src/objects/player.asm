.section code
handlePlayer
    lda #spPlayer1ThrustNumber
    jsr setSpriteNumber
    jsr hideSprite
    lda mplayerStatus
    cmp #objectCollided
    beq _playerHit
    
    cmp #objectGodMode
    beq _godMode
_controlPlayer
    jsr playerFireDelayTimer
    jsr playerLaserMove
    jsr playerControl
    jsr playerControl
    rts
_playerHit
    jsr playerHit
    rts
_godMode
    lda mPlayerGodModeTime
    cmp #0
    beq _resetGodMode
    dec mPlayerGodModeTime
    bra _controlPlayer
    rts
_resetGodMode
    lda #objectActive
    sta mPlayerStatus
    rts

isPlayerHit
    lda mplayerStatus
    cmp #objectCollided
    beq _checkShield
    sec
    rts
_checkShield
    lda mPlayerShield
    cmp #0
    beq _yes
    sec
    rts
_yes
    clc
    rts

playerControl
    #macroShowSprite spPlayer1ShipNumber, spPlayer01,mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    jsr moveN
    jsr moveS
    jsr moveL
    jsr moveR
    jsr playerFire
    ;#macroShowSprite spPlayer1ShipNumber, spPlayer02,mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
   ; #macroShowSprite spPlayer1ThrustNumber, spThrust00, mPlayerThrustPosX, mPlayerThrustPosX + 1, mPlayerThrustPosY, SPRITE24L0C2
    rts 

moveN
    lda mPlayerPosY
    cmp #32
    bcs _checkMove
    rts
_checkMove
    lda mKeyW
    cmp #1
    beq _move
    jsr is_joy_a_up_pressed
    bcc _move
    rts
_move
    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    dec mPlayerPosY
    lda mPlayerPosY

    jsr playerCalcThrust
    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    lda <#spPlayer01
    ldx >#spPlayer01
    ldy `#spPlayer01
    jsr setSpriteAddress

    lda mPlayerPosX
    ldx mPlayerPosX  + 1
    jsr setSpriteX

    lda mPlayerPosY
    ldx mPlayerPosY + 1
    jsr setSpriteY

    ;lda #SPRITE24L0C2
    ;jsr showSprite
    ;#macroShowSprite spPlayer1ShipNumber, spPlayer02,mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    #macroShowSprite spPlayer1ShipNumber, spPlayer01,mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    #macroShowSprite spPlayer1ThrustNumber, spThrust00, mPlayerThrustPosX, mPlayerThrustPosX + 1, mPlayerThrustPosY, SPRITE24L0C2
    jsr sound_play_thrust
    rts

moveS
    lda mPlayerPosY
    cmp #230
    bcc _checkMove
    rts
_checkMove
    lda mKeyS
    cmp #1
    beq _move
    jsr is_joy_a_down_pressed
    bcc _move
    rts
_move
    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    inc mPlayerPosY
    lda mPlayerPosY
    jsr setSpriteY
    ldx #0
    #macroShowSprite spPlayer1ShipNumber, spPlayer01,mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    rts

moveR
    lda mPlayerPosX+1
    cmp #0
    beq _checkMove
    lda mPlayerPosX
    cmp #65
    bcc _checkMove
    rts
_checkMove
    lda mKeyD
    cmp #1
    beq _move
    jsr is_joy_a_right_pressed
    bcc _move
    rts
_move
    lda mPlayerPosX
    clc 
    adc #1
    sta mPlayerPosX

    lda mPlayerPosX + 1
    adc #0
    sta mPlayerPosX + 1

    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    
    lda mPlayerPosX
    ldx mPlayerPosX + 1
    jsr setSpriteX

    lda #<spPlayer02
    ldx #>spPlayer02
    ldy #`spPlayer02
    jsr setSpriteAddress
    #macroShowSprite spPlayer1ShipNumber, spPlayer02, mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    rts

moveL
    lda mPlayerPosX+1
    cmp #1
    beq _checkMove
    lda mPlayerPosX
    cmp #42
    bcs _checkMove
    rts
_checkMove
    lda mKeyA
    cmp #1
    beq _move
    jsr is_joy_a_left_pressed
    bcc _move
    rts
_move
    lda mPlayerPosX
    sec 
    sbc #1
    sta mPlayerPosX

    lda mPlayerPosX + 1
    sbc #0
    sta mPlayerPosX + 1

    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    
    lda mPlayerPosX
    ldx mPlayerPosX + 1
    jsr setSpriteX

    lda #<spPlayer00
    ldx #>spPlayer00
    ldy #`spPlayer00
    jsr setSpriteAddress
    #macroShowSprite spPlayer1ShipNumber, spPlayer00, mPlayerPosX, mPlayerPosX+1, mPlayerPosY, SPRITE24L0C2
    rts

playerCalcThrust
    lda mPlayerPosX
    sta mPlayerThrustPosX
    lda mPlayerPosX + 1
    sta mPlayerThrustPosX + 1

    lda mPlayerPosY
    clc
    adc #24
    sta mPlayerThrustPosY
    rts

hidePlayer1
    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    jsr hideSprite

    lda #spPlayer1ThrustNumber
    jsr setSpriteNumber
    jsr hideSprite
    rts
.endsection

initPlayer1
    lda #player1Shield
    sta mPlayerShield
    stz mPlayerLaserPower
    rts

setupSprite
    lda #spPlayer1ShipNumber

    rts
.section variables
player1Shield = 2

mPlayerStatus
    .byte $00
mPlayerPosX
    .word   $00; 320/2 + 32, 240
mPlayerPosY
    .byte  $00, $00
mPlayerThrustPosX
    .word   $00; 320/2 + 32, 240
mPlayerThrustPosY
    .byte  $00;$00

mPlayerGodModeTime
    .byte  $00;$00
mPlayerShield
    .byte $00
mPlayerLaserPower
    .byte $00
.endsection