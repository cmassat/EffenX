handlePowerUp
    jsr isPowerUp
    bcc _initPowerUp
    jsr movePowerUp
    jsr powerupCollide
    jsr checkPowerUpCollision
    
    jsr debug
    rts
_initPowerUp
    lda mPowerUpStatus
    cmp #objectActive
    bne  _init
    rts
_init
    lda #objectActive
    sta mPowerUpStatus
    lda #0
    sta mPowerUpY
    sta mPowerUpY + 1

    lda #<320/2
    sta mPowerUpX
    lda #>320/2
    sta mPowerUpX + 1
    jsr clearFireBoost
    rts

checkPowerUpCollision
    lda mPowerUpStatus
    cmp #objectCollided
    beq _youGotPower
    rts
_youGotPower
    inc mPlayerLaserPower
    lda #spPowerUpNumber
    jsr setSpriteNumber
    jsr hideSprite
    lda #objectDisabled
    sta mPowerUpStatus
    rts

movePowerUp
    lda mPowerUpStatus
    cmp #objectActive
    beq _show
    rts
_show
    #add16Macro mPowerUpY
    #showSpriteMacro spPowerUpNumber, spPowerAddr, mPowerUpX ,mPowerUpY, SPRITE24L0C2
   
    rts

isPowerUp
    lda mFireBoostGroup0
    cmp #0
    bne _checkGroup1
    sec
    rts
_checkGroup1
    lda mFireBoostGroup1
    cmp #0
    bne _checkGroup2
    sec
    rts
_checkGroup2
    lda mFireBoostGroup2
    cmp #0
    bne _checkGroup3
    sec
    rts
_checkGroup3
    lda mFireBoostGroup3
    cmp #0
    bne _checkGroup4
    sec
    rts
_checkGroup4
    lda mFireBoostGroup4
    cmp #0
    bne _powerUp
    sec
    rts
_powerUp
    clc
    rts

clearFireBoost
    stz mFireBoostGroup0
    stz mFireBoostGroup1
    stz mFireBoostGroup2
    stz mFireBoostGroup3
    stz mFireBoostGroup4
    rts
.section variables
mPowerUpStatus
    .byte $00
mPowerUpX
    .word $00
mPowerUpY
    .word $00
.endsection