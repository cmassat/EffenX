.section code
handleEnemies
    ;jsr hideEnemyLasers
    rts
disableAllEnemies
    lda #objectDisabled
    sta mEnemyStatus00
    sta mEnemyStatus01
    sta mEnemyStatus02
    sta mEnemyStatus03
    sta mEnemyStatus04
    sta mEnemyStatus05
    sta mEnemyStatus06
    sta mEnemyStatus07
    sta mEnemyStatus08
    sta mEnemyStatus09
    sta mEnemyStatus10
    sta mEnemyStatus11
    sta mEnemyStatus12
    sta mEnemyStatus13
    sta mEnemyStatus14
    sta mEnemyStatus15
    rts

; hideDisabledEnemyLasers
;     lda mEnemyLaserActive00
;     ldx spEnemyLaserNumber00
;     jsr _tryDisable

;     lda mEnemyLaserActive01
;     ldx spEnemyLaserNumber01
;     jsr _tryDisable

;     lda mEnemyLaserActive02
;     ldx spEnemyLaserNumber02
;     jsr _tryDisable

;     lda mEnemyLaserActive03
;     ldx spEnemyLaserNumber03
;     jsr _tryDisable

;     lda mEnemyLaserActive04
;     ldx spEnemyLaserNumber04
;     jsr _tryDisable

;     lda mEnemyLaserActive05
;     ldx spEnemyLaserNumber05
;     jsr _tryDisable

;     lda mEnemyLaserActive06
;     ldx spEnemyLaserNumber06
;     jsr _tryDisable

;     lda mEnemyLaserActive07
;     ldx spEnemyLaserNumber07
;     jsr _tryDisable

;     lda mEnemyLaserActive08
;     ldx spEnemyLaserNumber08
;     jsr _tryDisable

;     lda mEnemyLaserActive09
;     ldx spEnemyLaserNumber09
;     jsr _tryDisable

;     lda mEnemyLaserActive10
;     ldx spEnemyLaserNumber10
;     jsr _tryDisable

;     lda mEnemyLaserActive11
;     ldx spEnemyLaserNumber11
;     jsr _tryDisable

;     lda mEnemyLaserActive12
;     ldx spEnemyLaserNumber12
;     jsr _tryDisable

;     lda mEnemyLaserActive13
;     ldx spEnemyLaserNumber13
;     jsr _tryDisable

;     lda mEnemyLaserActive14
;     ldx spEnemyLaserNumber14
;     jsr _tryDisable

;     lda mEnemyLaserActive15
;     ldx spEnemyLaserNumber15
;     jsr _tryDisable
;     rts
;  _tryDisable
;     cmp #objectdisabled
;     beq _disable
;     rts
; _disable
;     txa
;     jsr setSpriteNumber
;     jsr hideSprite
;     rts

; hideDisabledEnemies
;     lda mEnemyStatus00
;     ldx #spEnemyNumber00
;     jsr _tryHide

;     lda mEnemyStatus01
;     ldx #spEnemyNumber01
;     jsr _tryHide
;     rts
; _tryHide
;     cmp #objectdisabled
;     beq _hide
;     rts
; _hide
;     txa
;     jsr setSpriteNumber
;     jsr hideSprite
;     rts
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

mEnemyStatus12
    .byte $00
mEnemyX12
    .word $00
mEnemyY12
    .word $00

mEnemyStatus13
    .byte $00
mEnemyX13
    .word $00
mEnemyY13
    .word $00

mEnemyStatus14
    .byte $00
mEnemyX14
    .word $00
mEnemyY14
    .word $00

mEnemyStatus15
    .byte $00
mEnemyX15
    .word $00
mEnemyY15
    .word $00
diagcenter = 0
diagLeft   = 1
diagRight  = 2

mEnemyPath00
    .byte 00
mEnemyPath01
    .byte 00
mEnemyPath02
    .byte 00
mEnemyPath03
    .byte 00
mEnemyPath04
    .byte 00
mEnemyPath05
    .byte 00
mEnemyPath06
    .byte 00
mEnemyPath07
    .byte 00
mEnemyPath08
    .byte 00
mEnemyPath09
    .byte 00
mEnemyPath10
    .byte 00
mEnemyPath11
    .byte 00
mEnemyPath12
    .byte 00
mEnemyPath13
    .byte 00
mEnemyPath14
    .byte 00
mEnemyPath15
    .byte 00
;#initObjectMacro mEnemyStatus06, mEnemyX06, mEnemyY06, mEnemyPath06, constPathDown, 150, 000, spEnemyAddr05, mEnemySpriteAddr06
mEnemySpriteAddr00
    .byte 00, 00, 00
mEnemySpriteAddr01
    .byte 00, 00, 00
mEnemySpriteAddr02
    .byte 00, 00, 00
mEnemySpriteAddr03
    .byte 00, 00, 00
mEnemySpriteAddr04
    .byte 00, 00, 00
mEnemySpriteAddr05
    .byte 00, 00, 00
mEnemySpriteAddr06
    .byte 00, 00, 00
mEnemySpriteAddr07
    .byte 00, 00, 00
mEnemySpriteAddr08
    .byte 00, 00, 00
mEnemySpriteAddr09
    .byte 00, 00, 00
mEnemySpriteAdd10
    .byte 00, 00, 00
mEnemySpriteAddr11
    .byte 00, 00, 00
mEnemySpriteAddr12
    .byte 00, 00, 00
mEnemySpriteAddr13
    .byte 00, 00, 00
mEnemySpriteAddr14
    .byte 00, 00, 00
mEnemySpriteAddr15
    .byte 00, 00, 00
.endsection