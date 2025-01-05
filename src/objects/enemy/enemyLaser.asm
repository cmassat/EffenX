.section code

initEnemyLaserMacro .macro 
    lda \2
    cmp #objectActive
    beq _checkLaserIsInactive
    rts
_checkLaserIsInactive
    lda \1
    cmp #objectInactive
    beq _ready2Fire
    rts
_ready2Fire
;     lda #1
;     sta $D6A6

;     lda $D6A4
;     cmp #$f0
;     bcs _initLaser
;     rts
; _initLaser
    lda \2 + 2
    clc
    adc #6
    sta \3
    lda \2 + 3
    adc #0
    sta \3 + 1

    lda \2 + 4
    clc 
    adc #24
    sta \4
    lda  \2 + 5
    adc #0
    sta \4 + 1

    lda #1
    sta \1

_checkY
    lda \2 + 4
    cmp #32
    bcc _badFire
    lda \2 + 4
    cmp #140
    bcs _badFire

    lda \2 + 3
    cmp #1 
    bcc _check_lo
    bra _end
_check_lo
    lda \2 + 2
    cmp #33
    bcc _badFire
    bra _end
_badFire
    stz \1
_end
.endmacro
moveEnemyLaserMacro .macro
    lda \1
    cmp #objectActive
    beq _move
    ; lda #\3
    ; jsr setSpriteNumber
    ; jsr hideSprite
    rts 
_move
    inc \2
    inc \2
    inc \2
    lda \2
    cmp #248
    bcs _reset
    rts
 _reset
    lda #\3
    jsr setSpriteNumber
    jsr hideSprite
    lda #objectInactive
    sta \1
.endmacro

handleEnemyFire
   ; jsr moveEnemyFire
   ;jsr moveEnemyLaser0
   ;jsr moveEnemyLaser1
   ;jsr moveEnemyLaser2
   ;jsr moveEnemyLaser3
   ;jsr moveEnemyLaser4
   ;;jsr moveEnemyLaser5
   ;;jsr moveEnemyLaser6
   ;;jsr moveEnemyLaser7
   ;;jsr moveEnemyLaser8
   ;;jsr moveEnemyLaser9
   ;;jsr moveEnemyLaser10
   ;;jsr moveEnemyLaser11
   ;
   ;jsr initEnemyLaser0
   ;jsr initEnemyLaser1
   ;jsr initEnemyLaser2
   ;jsr initEnemyLaser3
   ;jsr initEnemyLaser4
   ;;jsr initEnemyLaser5
    ;jsr initEnemyLaser6
    ;jsr initEnemyLaser7
    ;jsr initEnemyLaser8
    ;jsr initEnemyLaser9
    ;jsr initEnemyLaser10
    ;jsr initEnemyLaser11
    

    rts
;_ready2Fire
;    lda #1
;    sta $D6A6
;
;    lda $D6A4
;    cmp #$fa
;    bcs _initLaser
;    rts
;_initLaser
;    lda mEnemy0 + 2
;    clc
;    adc #6
;    sta mEnemyLaserX00
;    lda mEnemy0 + 3
;    adc #0
;    sta mEnemyLaserX00 + 1
;
;    lda  mEnemy0 + 4
;    clc 
;    adc #24
;    sta mEnemyLaserY00
;    lda  mEnemy0 + 5
;    adc #0
;    sta mEnemyLaserY00 + 1
;
;    lda #1
;    sta mEnemyLaserActive00
;    lda mEnemyLaserX00 + 1
;    ldx mEnemyLaserX00
;    jsr isXOk
;    bcc _checkY
;    stz mEnemyLaserActive00
;    rts
;_checkY
;    lda mEnemyLaserY00
;    jsr isYOk
;    bcc _end
;    stz mEnemyLaserActive00
;_end
    rts

; initEnemyLaser0
;     #initEnemyLaserMacro mEnemyLaserActive00, mEnemyStatus00, mEnemyLaserX00, mEnemyLaserY00
;     rts 
; initEnemyLaser1
; ;     lda mEnemy1
; ;     cmp #objectActive
; ;     beq _initLaser
; ;     rts
; ; _initLaser
; ;     #initEnemyLaserMacro mEnemyLaserActive01, mEnemy1, mEnemyLaserX01, mEnemyLaserY01
;     rts 
; initEnemyLaser2
;     lda mEnemy2
;     cmp #objectActive
;     beq _initLaser
;     rts
; _initLaser
;     #initEnemyLaserMacro mEnemyLaserActive02, mEnemy2, mEnemyLaserX02, mEnemyLaserY02
;     rts 
; initEnemyLaser3
;     #initEnemyLaserMacro mEnemyLaserActive03, mEnemy3, mEnemyLaserX03, mEnemyLaserY03
;     rts 
   
; initEnemyLaser4
;     #initEnemyLaserMacro mEnemyLaserActive04, mEnemy4, mEnemyLaserX04, mEnemyLaserY04
;     rts     
; initEnemyLaser5
;     #initEnemyLaserMacro mEnemyLaserActive05, mEnemy5, mEnemyLaserX05, mEnemyLaserY05
;     rts 
; initEnemyLaser6
;     #initEnemyLaserMacro mEnemyLaserActive06, mEnemy6, mEnemyLaserX06, mEnemyLaserY06
;     rts 
; initEnemyLaser7
;     #initEnemyLaserMacro mEnemyLaserActive07, mEnemy7, mEnemyLaserX07, mEnemyLaserY07
;     rts 
; initEnemyLaser8
;     #initEnemyLaserMacro mEnemyLaserActive08, mEnemy8, mEnemyLaserX08, mEnemyLaserY08
;     rts 
; initEnemyLaser9
;     #initEnemyLaserMacro mEnemyLaserActive09, mEnemy9, mEnemyLaserX09, mEnemyLaserY09
;     rts 
; initEnemyLaser10
;     #initEnemyLaserMacro mEnemyLaserActive10, mEnemy10, mEnemyLaserX10, mEnemyLaserY10
;     rts 
; initEnemyLaser11
;     #initEnemyLaserMacro mEnemyLaserActive11, mEnemy11, mEnemyLaserX11, mEnemyLaserY11
;     rts 




moveEnemyLaser0 
     #objectsActiveMacro mEnemyLaserActive00, mEnemyLaserActive00
     #macroShowSprite spEnemyLaserNumber00, spEnemyLaserGreen, mEnemyLaserX00 , mEnemyLaserX00 + 1, mEnemyLaserY00, SPRITE24L0C2
     #moveEnemyLaserMacro mEnemyLaserActive00, mEnemyLaserY00, spEnemyLaserNumber00
    rts

moveEnemyLaser1
    #objectsActiveMacro mEnemyLaserActive01, mEnemyLaserActive01
    #macroShowSprite spEnemyLaserNumber01, spEnemyLaserGreen, mEnemyLaserX01 , mEnemyLaserX01 + 1, mEnemyLaserY01, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive01, mEnemyLaserY01, spEnemyLaserNumber01
    rts

moveEnemyLaser2
    #objectsActiveMacro mEnemyLaserActive02, mEnemyLaserActive02
    #macroShowSprite spEnemyLaserNumber02, spEnemyLaserGreen, mEnemyLaserX02, mEnemyLaserX02 + 1, mEnemyLaserY02, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive02, mEnemyLaserY02, spEnemyLaserNumber02
    rts

moveEnemyLaser3
    #objectsActiveMacro mEnemyLaserActive03, mEnemyLaserActive03
    #macroShowSprite spEnemyLaserNumber03, spEnemyLaserGreen, mEnemyLaserX03 , mEnemyLaserX03 + 1, mEnemyLaserY03, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive03, mEnemyLaserY03, spEnemyLaserNumber03
    rts
moveEnemyLaser4
    #objectsActiveMacro mEnemyLaserActive04, mEnemyLaserActive04
    #macroShowSprite spEnemyLaserNumber04, spEnemyLaserGreen, mEnemyLaserX04, mEnemyLaserX04 + 1, mEnemyLaserY04, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive04, mEnemyLaserY04, spEnemyLaserNumber04
    rts

moveEnemyLaser5
    #objectsActiveMacro mEnemyLaserActive05, mEnemyLaserActive05
    #macroShowSprite spEnemyLaserNumber05, spEnemyLaserGreen, mEnemyLaserX05, mEnemyLaserX05 + 1, mEnemyLaserY05, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive05, mEnemyLaserY05, spEnemyLaserNumber05
    rts
moveEnemyLaser6
    #objectsActiveMacro mEnemyLaserActive06, mEnemyLaserActive06
    #macroShowSprite spEnemyLaserNumber06, spEnemyLaserGreen, mEnemyLaserX06, mEnemyLaserX06 + 1, mEnemyLaserY06, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive06, mEnemyLaserY06, spEnemyLaserNumber06
    rts
moveEnemyLaser7
    #objectsActiveMacro mEnemyLaserActive07, mEnemyLaserActive07
    #macroShowSprite spEnemyLaserNumber07, spEnemyLaserGreen, mEnemyLaserX07, mEnemyLaserX07 + 1, mEnemyLaserY07, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive07, mEnemyLaserY07, spEnemyLaserNumber07
    rts
moveEnemyLaser8
    #objectsActiveMacro mEnemyLaserActive08, mEnemyLaserActive08
    #macroShowSprite spEnemyLaserNumber08, spEnemyLaserGreen, mEnemyLaserX08, mEnemyLaserX08 + 1, mEnemyLaserY08, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive08, mEnemyLaserY08, spEnemyLaserNumber08
    rts
moveEnemyLaser9
    #objectsActiveMacro mEnemyLaserActive09, mEnemyLaserActive09
    #macroShowSprite spEnemyLaserNumber09, spEnemyLaserGreen, mEnemyLaserX09, mEnemyLaserX09 + 1, mEnemyLaserY09, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive09, mEnemyLaserY09, spEnemyLaserNumber09
    rts
moveEnemyLaser10
    #objectsActiveMacro mEnemyLaserActive10, mEnemyLaserActive10
    #macroShowSprite spEnemyLaserNumber10, spEnemyLaserGreen, mEnemyLaserX10, mEnemyLaserX10 + 1, mEnemyLaserY10, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive10, mEnemyLaserY10, spEnemyLaserNumber10
    rts
moveEnemyLaser11
    #objectsActiveMacro mEnemyLaserActive11, mEnemyLaserActive11
    #macroShowSprite spEnemyLaserNumber11, spEnemyLaserGreen, mEnemyLaserX11, mEnemyLaserX11 + 1, mEnemyLaserY11, SPRITE24L0C2
    #moveEnemyLaserMacro mEnemyLaserActive11, mEnemyLaserY11, spEnemyLaserNumber11
    rts

moveEnemyFire
    lda mEnemyLaserActive00
    cmp #1
    beq _move
    rts 
_move
    #macroShowSprite spEnemyLaserNumber00, spEnemyLaserGreen, mEnemyLaserX00 , mEnemyLaserX00 + 1, mEnemyLaserY00, SPRITE24L0C2
    inc mEnemyLaserY00
    inc mEnemyLaserY00
    lda mEnemyLaserY00
    cmp #248
    bcs _reset
    rts
 _reset
    lda #spEnemyLaserNumber00
    jsr setSpriteNumber
    jsr hideSprite
    stz mEnemyLaserActive00
    rts 



isXOk
    ;lda mEnemyLaserX00 + 1
    pha
    txa
    cmp #1
    bcc _check_lo
    pla
    clc
    rts
_check_lo
    pla
    ;lda mEnemyLaserX00
    cmp #33
    bcc _badFire
    clc
    rts 
 _badFire
    sec
    rts 


isYOk
    ;lda mEnemyLaserY00
    cmp #140
    bcs _badFire
    lda mEnemyLaserY00
    cmp #32
    bcc _badFire
    clc
    rts 
 _badFire
    sec
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
.endsection