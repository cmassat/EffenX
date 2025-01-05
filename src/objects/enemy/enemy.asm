.section code
disableAllEnemies
    lda #objectDisabled
    sta mEnemyStatus00
    sta mEnemyStatus01
    sta mEnemyStatus02
    sta mEnemyStatus03
    sta mEnemyStatus04
    rts

hideDisabledEnemies
    lda mEnemyStatus00
    ldx #spEnemyNumber00
    jsr _tryDisable

    lda mEnemyStatus01
    ldx #spEnemyNumber01
    jsr _tryDisable
    rts
_tryDisable
    cmp #objectdisabled
    beq _disable
    rts
_disable
    txa
    jsr setSpriteNumber
    jsr hideSprite
    rts
.endsection

.section variables
enemyDelay = 12

mEnemyStatus00
    .byte $00
mEnemyX00
    .word $00
mEnemyY00
    .word $00
 .word $00

mEnemyStatus01
    .byte $00
mEnemyX01
    .word $00
mEnemyY01
    .word $00

mEnemyStatus02
    .byte $00
mEnemyX02
    .word $00
mEnemyY02
    .word $00


mEnemyStatus03
    .byte $00
mEnemyX03
    .word $00
mEnemyY03
    .word $00

mEnemyStatus04
    .byte $00
mEnemyX04
    .word $00
mEnemyY04
    .word $00

mEnemyStatus05
    .byte $00
mEnemyX05
    .word $00
mEnemyY05
    .word $00

mEnemyStatus06
    .byte $00
mEnemyX06
    .word $00
mEnemyY06
    .word $00

mEnemyStatus07
    .byte $00
mEnemyX07
    .word $00
mEnemyY07
    .word $00

mEnemyStatus08
    .byte $00
mEnemyX08
    .word $00
mEnemyY08
    .word $00

mEnemyStatus09
    .byte $00
mEnemyX09
    .word $00
mEnemyY09
    .word $00

mEnemyStatus10
    .byte $00
mEnemyX10
    .word $00
mEnemyY10
    .word $00

mEnemyStatus11
    .byte $00
mEnemyX11
    .word $00
mEnemyY11
    .word $00
.endsection