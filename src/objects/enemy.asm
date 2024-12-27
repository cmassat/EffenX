.section code
handleEnemy

    jsr resetEnemy0
    jsr resetEnemy1
    jsr resetEnemy2
    jsr resetEnemy3
    jsr resetEnemy4
    jsr resetEnemy5
    ;jsr resetEnemy6
    ;jsr resetEnemy7
    ;jsr resetEnemy8
    ;jsr resetEnemy9
    ;jsr resetEnemy10
    ;jsr resetEnemy11
    jsr moveEnemy0
    jsr moveEnemy0
    jsr moveEnemy1
    jsr moveEnemy1
    jsr moveEnemy2
    jsr moveEnemy2
    jsr moveEnemy3
    jsr moveEnemy3
    jsr moveEnemy4
    jsr moveEnemy4
    jsr moveEnemy5
    jsr moveEnemy5
    ;jsr moveEnemy6
    ;jsr moveEnemy6
    ;jsr moveEnemy7
    ;jsr moveEnemy7
    ;jsr moveEnemy8
    ;jsr moveEnemy8
    ;jsr moveEnemy9
    ;jsr moveEnemy10
    ;jsr moveEnemy11
    rts

resetEnemyMacro .macro
    lda \1
    cmp #objectInactive
    beq _loadEnemy
    rts
_loadEnemy
    lda #1
    sta  \1
    stz  \1 + 1

    lda <#\2
    sta  \1 + 6

    lda >#\2
    sta  \1 + 7

    lda #<mEnemyYPath
    sta  \1 + 8

    lda #>mEnemyYPath
    sta  \1 + 9

    lda #1
    sta $D6A6
    lda $D6A4
    sta \1+10
    lda $D6A5
    sta \1+11

    lda \1+11
    cmp #$f1
    bcs _check_lo
    stz \1+11
    rts 
_check_lo
    lda #1
    sta \1+11
    lda \1+10
    cmp #$20
    bcs _set_lo_to_max
    rts 
_set_lo_to_max
    lda #$20
    sta \1+10

.endmacro

resetEnemy0
    #resetEnemyMacro mEnemy0, mPathXStraight
    rts
resetEnemy1
    #resetEnemyMacro mEnemy1, mPathXStraight
    rts
resetEnemy2
    #resetEnemyMacro mEnemy2, mPathXStraight
    rts
resetEnemy3
    #resetEnemyMacro mEnemy3, mPathXStraight
    rts
resetEnemy4
    #resetEnemyMacro mEnemy4, mPathZigZag
    rts
resetEnemy5
    #resetEnemyMacro mEnemy5, mPathZigZag
    rts
resetEnemy6
    #resetEnemyMacro mEnemy6, mPathZigZag
    rts
resetEnemy7
    #resetEnemyMacro mEnemy7, mPathZigZag
    rts
resetEnemy8
    #resetEnemyMacro mEnemy8, mPathZigZag
    rts
resetEnemy9
    #resetEnemyMacro mEnemy9, mPathXStraight
    rts
resetEnemy10
    #resetEnemyMacro mEnemy10, mPathZigZag
    rts
resetEnemy11
    #resetEnemyMacro mEnemy11, mPathXStraight
    rts

moveEnemyMacro .macro
    lda \1
    cmp #1
    beq _alive
    rts 
_alive
    lda \1 + 1
    cmp #255
    bcc _move
    lda v_sync
    cmp #\2
    beq _reset
    lda #\3
    jsr setSpriteNumber
    jsr hideSprite
    rts
_reset
    stz \1
    rts
_move
    inc \1 + 1
    lda \1 + 6
    sta POINTER_SPR_X
    lda \1 + 7
    sta POINTER_SPR_X + 1

    lda \1 + 8
    sta POINTER_SPR_Y
    lda \1 + 9
    sta POINTER_SPR_Y + 1
    ldy #0
    ;x and y coordinate
    lda (POINTER_SPR_X) ,y
    sta \1 + 2
    lda (POINTER_SPR_Y) ,y
    sta \1 + 4
    iny
    lda (POINTER_SPR_X) ,y
    sta \1 + 3
    lda (POINTER_SPR_Y) ,y
    sta \1 + 5

    lda \1+10
    clc 
    adc \1 + 2
    sta \1 + 2

    lda  \1+11
    adc  \1+3
    sta  \1+3
.endmacro

setEnemyAddressMacro .macro
    lda POINTER_SPR_X
    clc
    adc #2
    sta \1 + 6

    lda POINTER_SPR_X + 1
    adc #0
    sta \1 + 7


    lda POINTER_SPR_Y
    clc
    adc #2
    sta \1 + 8

    lda POINTER_SPR_y + 1
    adc #0
    sta \1 + 9
.endmacro

moveEnemy0
    #moveEnemyMacro mEnemy0, 0, spEnemyNumber00
    #macroShowSprite spEnemyNumber00, spEnemy00, mEnemy0 + 2  , mEnemy0 + 3, mEnemy0 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy0
    rts

moveEnemy1
    #moveEnemyMacro mEnemy1, 10, spEnemyNumber01
    #macroShowSprite spEnemyNumber01, spEnemy01, mEnemy1 + 2  , mEnemy1 + 3, mEnemy1 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy1
    rts 


moveEnemy2
    #moveEnemyMacro mEnemy2, 20, spEnemyNumber02
    #macroShowSprite spEnemyNumber02, spEnemy02, mEnemy2 + 2  , mEnemy2 + 3, mEnemy2 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy2
    rts 

moveEnemy3
    #moveEnemyMacro mEnemy3, 30, spEnemyNumber03
    #macroShowSprite spEnemyNumber03, spEnemy03, mEnemy3 + 2  , mEnemy3 + 3, mEnemy3 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy3
    rts 

moveEnemy4
    #moveEnemyMacro mEnemy4, 40, spEnemyNumber04
    #macroShowSprite spEnemyNumber04, spEnemy04, mEnemy4 + 2  , mEnemy4 + 3, mEnemy4 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy4
    rts 

moveEnemy5
    #moveEnemyMacro mEnemy5, 60, spEnemyNumber05
    #macroShowSprite spEnemyNumber05, spEnemy05, mEnemy5 + 2  , mEnemy5 + 3, mEnemy5 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy5
    rts 

moveEnemy6
    #moveEnemyMacro mEnemy6, 70, spEnemyNumber06
    #macroShowSprite spEnemyNumber06, spEnemy06, mEnemy6 + 2  , mEnemy6 + 3, mEnemy6 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy6
    rts 

moveEnemy7
    #moveEnemyMacro mEnemy7, 80, spEnemyNumber07
    #macroShowSprite spEnemyNumber07, spEnemy07, mEnemy7 + 2  , mEnemy7 + 3, mEnemy7 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy7
    rts 


moveEnemy8
    #moveEnemyMacro mEnemy8, 90, spEnemyNumber08
    #macroShowSprite spEnemyNumber08, spEnemy08, mEnemy8 + 2  , mEnemy8 + 3, mEnemy8 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy8
    rts 
moveEnemy9
    #moveEnemyMacro mEnemy9, 100, spEnemyNumber09
    #macroShowSprite spEnemyNumber09, spEnemy09, mEnemy9 + 2  , mEnemy9 + 3, mEnemy9 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy9
    rts 
moveEnemy10
    #moveEnemyMacro mEnemy10, 110, spEnemyNumber10
    #macroShowSprite spEnemyNumber10, spEnemy10, mEnemy10 + 2  , mEnemy10 + 3, mEnemy10 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy10
    rts 
moveEnemy11
    #moveEnemyMacro mEnemy11, 120, spEnemyNumber11
    #macroShowSprite spEnemyNumber11, spEnemy11, mEnemy11 + 2  , mEnemy11 + 3, mEnemy11 + 4, SPRITE24L0C2
    #setEnemyAddressMacro mEnemy11
    rts 

resetEnemies
    lda #objectWait
    sta mEnemy0
    sta mEnemy1
    sta mEnemy2
    sta mEnemy3
    sta mEnemy4
    sta mEnemy5
    sta mEnemy6
    sta mEnemy7
    sta mEnemy8
    sta mEnemy9
    sta mEnemy10
    sta mEnemy11

    lda #spEnemyNumber00
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

    lda #spEnemyNumber01
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

    lda #spEnemyNumber02
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress


    lda #spEnemyNumber03
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

    lda #spEnemyNumber04
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

    lda #spEnemyNumber05
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

     lda #spEnemyNumber06
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

         lda #spEnemyNumber07
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

     lda #spEnemyNumber08
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

         lda #spEnemyNumber09
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

         lda #spEnemyNumber10
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress

         lda #spEnemyNumber11
    jsr setSpriteNumber
    lda #0
    ldx #0
    ldy #0
    jsr setSpriteAddress
    rts 
.endsection

.section variables
enemy7Speed
    .byte $00



mEnemy0
    .word $00
    .word $00
    .word $00
    .word $00
    .word $00
    .word $00, $00

;xOffset = 2
;YOffset = 4
mEnemy1
    .word $00, $00, $00, $00, $00, $00, $00
mEnemy2
    .word $00, $00, $00, $00, $00, $00, $00
mEnemy3
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy4
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy5
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy6
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy7
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy8
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy9
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy10
    .word $00, $00, $00, $00, $00,$00, $00
mEnemy11
    .word $00, $00, $00, $00, $00,$00, $00
.endsection