
; levelOneInitMacro .macro
;     lda \1
;     cmp #objectInactive
;     beq _setDefault
;     rts
; _setDefault
;     lda #120
;     sta \2
;     stz \2 + 1
    
;     lda #0
;     sta \3
;     sta \3 + 1

;     lda #objectActive
;     sta \1
; .endmacro

; levelOneInitRandomMacro .macro
;     lda \1
;     cmp #objectInactive
;     beq _setDefault
;     rts
; _setDefault
;     lda #1
;     sta $d6a6
;     lda $d6a4
;    ; lda #10
;     sta mrando
;     lda #1
;     sta $d6a6
;     lda $d6a5
;     ;lda #$0
;     cmp #$f0
;     bcs _setHiTo1
;     stz mrando + 1
;     bra _setMinX
; _setHiTo1
;     lda #1
;     sta mrando + 1
; _checkHi
;     lda mrando + 1
;     cmp #1
;     beq _forceLessThan320

;     lda mrando
;     cmp #32
;     bcc _setMinX
;     bra _setValues
; _setMinX
;     lda mrando
;     clc
;     adc #60
;     sta mrando
;     stz mrando + 1
;     bra _setValues
; _forceLessThan320
;     lda mrando
;     cmp #$40
;     bcs _shrinkLo
;     bra _forceMaxHi
; _shrinkLo
;     lda #$30
;     sta mrando
; _forceMaxHi
;     lda #1
;     sta mrando + 1
; _setValues
;     lda mrando
;     sta \2
   
;     lda mrando + 1
;     sta \2 + 1
    
;     lda #0
;     sta \3
;     sta \3 + 1

;     lda #objectActive
;     sta \1
; .endmacro

; mrando
;     .byte $00, $00

initObjectMacro .macro objectStatus, objectXCoord, objectYCoord, objectPath ,path2Set, xStart2Set, YStart2Set, addr = 0, store = mEnemySpriteAddr12
    lda \objectStatus
    cmp #objectInactive
    beq _setupObject
    rts
_setupObject
    lda <#\xStart2Set
    sta \objectXCoord
    lda >#\xStart2Set
    sta \objectXCoord + 1
   
    lda <#\YStart2Set
    sta \objectYCoord
    lda >#\YStart2Set
    sta \objectYCoord + 1

    lda #\path2Set
    sta \objectPath

    lda #objectActive
    sta \objectStatus

    lda #<\addr
    sta \store

    lda #>\addr
    sta \store + 1

    lda #`\addr
    sta \store + 2
.endmacro

moveObjectMacro .macro objectStats, objectPath, objectXCoord, objectYCoord, status2Set
    lda \objectStats
    cmp #objectActive
    beq _moveObject
    rts
_moveObject
    pha
    phx
    lda \objectYCoord
    ldx \objectYCoord + 1
    jsr isOutOfBoundsY

    bcc _resetObject
    plx
    pla

    lda \objectPath
    cmp #constPathDown
    beq _down

    lda \objectPath
    cmp #constPathPongFromLeft
    beq _pongFromLeft

    cmp #constPathPongFromRight
    beq _pongFromRight
    rts
_down
    pha
    phx
    lda \objectYCoord
    ldx \objectYCoord + 1
    jsr pathDown
    sta \objectYCoord
    stx \objectYCoord + 1
    plx
    pla
    rts
_pongFromLeft
    pha
    phx
    lda \objectXCoord
    ldx \objectXCoord + 1
    jsr pathPongFromLeft
    sta \objectXCoord
    stx \objectXCoord + 1
    plx
    pla
    rts
_pongFromRight
    pha
    phx
    lda \objectXCoord
    ldx \objectXCoord + 1
    jsr pathPongFromRight
    sta \objectXCoord
    stx \objectXCoord + 1
    plx
    pla
    rts
_resetObject
    plx
    pla
    lda #\status2Set
    sta \objectStats
    rts
.endmacro

; levelOneMoveMacro .macro objectStats
;     lda \1
;     cmp #objectDisabled
;     bne _checkActive
;     rts
; _checkActive
;     lda \1
;     cmp #objectActive
;     beq _moveEnemy
;     rts
; _moveEnemy
;     cmp  #240
;     bcs _resetEnemy
;     lda \2
;     adc #1
;     sta \2
;     rts
; _resetEnemy
;     lda #objectDisabled
;     sta \1
; .endmacro

levelOneMoveRandomMacro .macro
    lda \1
    cmp #objectDisabled
    bne _checkActive
    rts
_checkActive
    lda \1
    cmp #objectActive
    beq _moveEnemy
    rts
_moveEnemy
    lda \2
    cmp  #240
    bcs _resetEnemy
    lda \4 + 1
    cmp #1
    beq _continue
    lda \4
    cmp #32
    bcc _resetEnemy

_continue
    lda \2
    adc #1
    sta \2
    lda \3
    cmp #diagLeft
    beq _goLeft
    lda \3
    cmp #diagRight
    beq _goRight
    rts
_activate
    lda #objectActive
    sta \1
    rts
_goLeft
    lda \4
    sec
    sbc #1
    sta \4
    lda \4 + 1
    sbc #0
    sta \4 + 1 
    rts
_goRight
    lda \4
    clc
    adc #3
    sta \4
    lda \4 + 1
    adc #0
    sta \4 + 1 
    rts
_resetEnemy
    lda #objectInactive
    sta \1

.endmacro


;diagcenter = 0
;diagLeft   = 1
;diagRight  = 2
;
;mEnemyPath00