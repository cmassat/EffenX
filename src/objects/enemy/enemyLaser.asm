.section code
moveEnemyLaserMacro .macro
    lda \1
    cmp #objectActive
    beq _move
    rts 
_move
    inc \2
    inc \2
    inc \2
    lda \2
    cmp #$ff
    bcs _reset
    cmp #10
    bcc _reset
    rts
 _reset
    lda #\3
    jsr setSpriteNumber
    jsr hideSprite
    lda #objectInactive
    sta \1
.endmacro

initEnemyLaser5                   
  ;   #initEnemyLaserMacro mEnemyLaserActive05, mEnemyStatus05, mEnemyLaserX05, mEnemyLaserY05, mEnemyX05, mEnemyY05
     rts 
initEnemyLaser6
     #initEnemyLaserMacro mEnemyLaserActive06, mEnemyStatus06, mEnemyLaserX06, mEnemyLaserY06, mEnemyX06, mEnemyY06
     rts 
initEnemyLaser7
     #initEnemyLaserMacro mEnemyLaserActive07, mEnemyStatus07, mEnemyLaserX07, mEnemyLaserY07, mEnemyX07, mEnemyY07
     rts 
initEnemyLaser8
     #initEnemyLaserMacro mEnemyLaserActive08, mEnemyStatus08, mEnemyLaserX08, mEnemyLaserY08, mEnemyX08, mEnemyY08
     rts 
initEnemyLaser9
     #initEnemyLaserMacro mEnemyLaserActive09, mEnemyStatus09, mEnemyLaserX09, mEnemyLaserY09, mEnemyX09, mEnemyY09
     rts 
; initEnemyLaser10
;      #initEnemyLaserMacro mEnemyLaserActive10, mEnemyStatus10, mEnemyLaserX10, mEnemyLaserY10, mEnemyX10, mEnemyY10
;      rts 
; initEnemyLaser11
;      #initEnemyLaserMacro mEnemyLaserActive11, mEnemyStatus11, mEnemyLaserX11, mEnemyLaserY11, mEnemyX11, mEnemyY11
;      rts 

moveEnemyLaser0 
     #objectsActiveMacro mEnemyLaserActive00, mEnemyLaserActive00
     #showSpriteMacro spEnemyLaserNumber00, spEnemyLaserGreen, mEnemyLaserX00, mEnemyLaserY00, SPRITE24L0C2, mEnemyLaserActive00
     #moveEnemyLaserMacro mEnemyLaserActive00, mEnemyLaserY00, spEnemyLaserNumber00
    rts

moveEnemyLaser1
    #objectsActiveMacro mEnemyLaserActive01, mEnemyLaserActive01
    #showSpriteMacro spEnemyLaserNumber01, spEnemyLaserGreen, mEnemyLaserX01, mEnemyLaserY01, SPRITE24L0C2, mEnemyLaserActive01
    #moveEnemyLaserMacro mEnemyLaserActive01, mEnemyLaserY01, spEnemyLaserNumber01
    rts

moveEnemyLaser2
    #objectsActiveMacro mEnemyLaserActive02, mEnemyLaserActive02
    #showSpriteMacro spEnemyLaserNumber02, spEnemyLaserGreen, mEnemyLaserX02, mEnemyLaserY02, SPRITE24L0C2, mEnemyLaserActive02
    #moveEnemyLaserMacro mEnemyLaserActive02, mEnemyLaserY02, spEnemyLaserNumber02
    rts

moveEnemyLaser3
    #objectsActiveMacro mEnemyLaserActive03, mEnemyLaserActive03
    #showSpriteMacro spEnemyLaserNumber03, spEnemyLaserGreen, mEnemyLaserX03, mEnemyLaserY03, SPRITE24L0C2, mEnemyLaserActive03
    #moveEnemyLaserMacro mEnemyLaserActive03, mEnemyLaserY03, spEnemyLaserNumber03
    rts
moveEnemyLaser4
    #objectsActiveMacro mEnemyLaserActive04, mEnemyLaserActive04
    #showSpriteMacro spEnemyLaserNumber04, spEnemyLaserGreen, mEnemyLaserX04, mEnemyLaserY04, SPRITE24L0C2, mEnemyLaserActive04
    #moveEnemyLaserMacro mEnemyLaserActive04, mEnemyLaserY04, spEnemyLaserNumber04
    rts

moveEnemyLaser5
    #objectsActiveMacro mEnemyLaserActive05, mEnemyLaserActive05
    #showSpriteMacro spEnemyLaserNumber05, spEnemyLaserGreen, mEnemyLaserX05, mEnemyLaserY05, SPRITE24L0C2, mEnemyLaserActive05
    #moveEnemyLaserMacro mEnemyLaserActive05, mEnemyLaserY05, spEnemyLaserNumber05
    rts
moveEnemyLaser6
    #objectsActiveMacro mEnemyLaserActive06, mEnemyLaserActive06
    #showSpriteMacro spEnemyLaserNumber06, spEnemyLaserGreen, mEnemyLaserX06, mEnemyLaserY06, SPRITE24L0C2, mEnemyLaserActive06
    #moveEnemyLaserMacro mEnemyLaserActive06, mEnemyLaserY06, spEnemyLaserNumber06
    rts
moveEnemyLaser7
    #objectsActiveMacro mEnemyLaserActive07, mEnemyLaserActive07
    #showSpriteMacro spEnemyLaserNumber07, spEnemyLaserGreen, mEnemyLaserX07, mEnemyLaserY07, SPRITE24L0C2, mEnemyLaserActive07
    #moveEnemyLaserMacro mEnemyLaserActive07, mEnemyLaserY07, spEnemyLaserNumber07
    rts
moveEnemyLaser8
    #objectsActiveMacro mEnemyLaserActive08, mEnemyLaserActive08
    #showSpriteMacro spEnemyLaserNumber08, spEnemyLaserGreen, mEnemyLaserX08, mEnemyLaserY08, SPRITE24L0C2, mEnemyLaserActive08
    #moveEnemyLaserMacro mEnemyLaserActive08, mEnemyLaserY08, spEnemyLaserNumber08
    rts
moveEnemyLaser9
    #objectsActiveMacro mEnemyLaserActive09, mEnemyLaserActive09
    #showSpriteMacro spEnemyLaserNumber09, spEnemyLaserGreen, mEnemyLaserX09, mEnemyLaserY09, SPRITE24L0C2, mEnemyLaserActive09
    #moveEnemyLaserMacro mEnemyLaserActive09, mEnemyLaserY09, spEnemyLaserNumber09
    rts
; moveEnemyLaser10
;     #objectsActiveMacro mEnemyLaserActive10, mEnemyLaserActive10
;     #showSpriteMacro spEnemyLaserNumber10, spEnemyLaserOrange, mEnemyLaserX10, mEnemyLaserY10, SPRITE24L0C2, mEnemyLaserActive10
;     #moveEnemyLaserMacro mEnemyLaserActive10, mEnemyLaserY10, spEnemyLaserNumber10
;     rts
; moveEnemyLaser11
;     #objectsActiveMacro mEnemyLaserActive11, mEnemyLaserActive11
;     #showSpriteMacro spEnemyLaserNumber11, spEnemyLaserOrange, mEnemyLaserX11, mEnemyLaserY11, SPRITE24L0C2, mEnemyLaserActive11
;     #moveEnemyLaserMacro mEnemyLaserActive11, mEnemyLaserY11, spEnemyLaserNumber11
;     rts

hideEnemyLasers
    lda mEnemyLaserActive00
    ldx #spEnemyLaserNumber00
    jsr _tryHide

    lda mEnemyLaserActive01
    ldx #spEnemyLaserNumber01
    jsr _tryHide

    lda mEnemyLaserActive02
    ldx #spEnemyLaserNumber02
    jsr _tryHide

    lda mEnemyLaserActive03
    ldx #spEnemyLaserNumber03
    jsr _tryHide

    lda mEnemyLaserActive04
    ldx #spEnemyLaserNumber04
    jsr _tryHide

    lda mEnemyLaserActive05
    ldx #spEnemyLaserNumber05
    jsr _tryHide

    lda mEnemyLaserActive06
    ldx #spEnemyLaserNumber06
    jsr _tryHide

    lda mEnemyLaserActive07
    ldx #spEnemyLaserNumber07
    jsr _tryHide

    lda mEnemyLaserActive08
    ldx #spEnemyLaserNumber08
    jsr _tryHide

    lda mEnemyLaserActive09
    ldx #spEnemyLaserNumber09
    jsr _tryHide

    ; lda mEnemyLaserActive10
    ; ldx #spEnemyLaserNumber10
    ; jsr _tryHide

    ; lda mEnemyLaserActive11
    ; ldx #spEnemyLaserNumber11
    ; jsr _tryHide

    ; lda mEnemyLaserActive12
    ; ldx #spEnemyLaserNumber12
    ; jsr _tryHide

    ; lda mEnemyLaserActive13
    ; ldx #spEnemyLaserNumber13
    ; jsr _tryHide

    ; lda mEnemyLaserActive14
    ; ldx #spEnemyLaserNumber14
    ; jsr _tryHide

    ; lda mEnemyLaserActive15
    ; ldx #spEnemyLaserNumber15
    ; jsr _tryHide
    rts
_tryHide
    cmp #objectActive
    bne _hide
    rts
_hide
    txa
    jsr setSpriteNumber
    jsr hideSprite
    rts
.endsection

.section variables
mEnemyLaserX00
    .byte $00, $00
mEnemyLaserY00
    .byte $00, $00
mEnemyLaserActive00
    .byte $00

mEnemyLaserX01
    .byte $00, $00
mEnemyLaserY01
    .byte $00, $00
mEnemyLaserActive01
    .byte $00

mEnemyLaserX02
    .byte $00, $00
mEnemyLaserY02
    .byte $00, $00
mEnemyLaserActive02
    .byte $00

mEnemyLaserX03
    .byte $00, $00
mEnemyLaserY03
    .byte $00, $00
mEnemyLaserActive03
    .byte $00

mEnemyLaserX04
    .byte $00, $00
mEnemyLaserY04
    .byte $00, $00
mEnemyLaserActive04
    .byte $00

mEnemyLaserX05
    .byte $00, $00
mEnemyLaserY05
    .byte $00, $00
mEnemyLaserActive05
    .byte $00

mEnemyLaserX06
    .byte $00, $00
mEnemyLaserY06
    .byte $00, $00
mEnemyLaserActive06
    .byte $00

mEnemyLaserX07
    .byte $00, $00
mEnemyLaserY07
    .byte $00, $00
mEnemyLaserActive07
    .byte $00

mEnemyLaserX08
    .byte $00, $00
mEnemyLaserY08
    .byte $00, $00
mEnemyLaserActive08
    .byte $00

mEnemyLaserX09
    .byte $00, $00
mEnemyLaserY09
    .byte $00, $00
mEnemyLaserActive09
    .byte $00

mEnemyLaserX10
    .byte $00, $00
mEnemyLaserY10
    .byte $00, $00
mEnemyLaserActive10
    .byte $00


mEnemyLaserX11
    .byte $00, $00
mEnemyLaserY11
    .byte $00, $00
mEnemyLaserActive11
    .byte $00

mEnemyLaserX12
    .byte $00, $00
mEnemyLaserY12
    .byte $00, $00
mEnemyLaserActive12
    .byte $00

mEnemyLaserX13
    .byte $00, $00
mEnemyLaserY13
    .byte $00, $00
mEnemyLaserActive13
    .byte $00

mEnemyLaserX14
    .byte $00, $00
mEnemyLaserY14
    .byte $00, $00
mEnemyLaserActive14
    .byte $00

mEnemyLaserX15
    .byte $00, $00
mEnemyLaserY15
    .byte $00, $00
mEnemyLaserActive15
    .byte $00
.endsection