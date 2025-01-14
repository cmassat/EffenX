
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


initLaserHomingMacro .macro startX, startY, endX, endY, lineType
    lda \startX
    ldx \startX + 1
    jsr setX1

    lda \endX
    ldx \endX + 1
    jsr setX2

    lda mPlayerPosX
    sta mMiniBossXDest
    lda mPlayerPosX + 1
    sta mMiniBossXDest + 1

    lda \startY
    ldx \startY + 1
    jsr setY1
   
    lda \endY
    ldx \endY + 1
    jsr setY2

    lda mPlayerPosY
    sta mMiniBossYDest

    lda  mPlayerPosY + 1
    sta mMiniBossYDest + 1

    jsr initLinePath
    sta \lineType
    rts
.endmacro

copyWordMacro .macro from, to
    lda \from
    sta \to
    lda \from + 1
    sta \to + 1
    rts
.endmacro