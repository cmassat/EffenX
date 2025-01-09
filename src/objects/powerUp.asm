handlePowerUp
    jsr isPowerUp
    bcc _initPowerUp
    jsr movePowerUp
    jsr powerupCollide
    jsr checkPowerUpCollision
    
 
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
    lda mPlayerLaserPower
    cmp #3
    bcs _setMax
    rts
_setMax
    lda #2
    sta mPlayerLaserPower
    rts

movePowerUp
    lda mPowerUpStatus
    cmp #objectActive
    beq _show
    rts
_show
    #add16Macro mPowerUpY
    #showSpriteMacro spPowerUpNumber, spPowerAddr, mPowerUpX ,mPowerUpY, SPRITE24L0C2, mPowerUpStatus
    rts

losePowerUp
    lda mPlayerLaserPower
    cmp #0
    bne _losePower
    rts
_losePower
    dec mPlayerLaserPower
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

.section variables
mPowerUpStatus
    .byte $00
mPowerUpX
    .word $00
mPowerUpY
    .word $00
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