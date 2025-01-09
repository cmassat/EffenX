
initEnemyLaserMacro .macro  laserStatus, shipStatus, enemyLaserX, enemyLaserY, enemyShipX, enemyShipY
    lda \shipStatus
    cmp #objectActive
    beq _checkLaserIsInactive
    rts
_checkLaserIsInactive
    lda \laserStatus
    cmp #objectInactive
    beq _ready2Fire
    rts
_ready2Fire
    lda \enemyShipY
    cmp #10
    bcs _shootMin
    bra _badFire
    rts
_shootMin
    lda \enemyShipY
    cmp #140
    bcc _shoot
    bra _badFire
    rts
_shoot
    lda \enemyShipX
    clc
    adc #6
    sta \enemyLaserX
    lda \enemyShipX + 1
    adc #0
    sta \enemyLaserX + 1

    lda \enemyShipY
    clc 
    adc #24
    sta \enemyLaserY
    lda \enemyShipY + 1
    adc #0
    sta \enemyLaserY + 1

    lda #objectActive
    sta \laserStatus

_checkY
    lda \enemyLaserY
    cmp #32
    bcc _badFire
    lda \enemyLaserY
    cmp #140
    bcs _badFire

    lda \enemyLaserX + 1
    cmp #1 
    bcc _check_lo
    bra _end
_check_lo
    lda \enemyLaserX
    cmp #33
    bcc _badFire
    bra _end
_badFire
    lda #objectInactive
    sta \laserStatus
_end
.endmacro
