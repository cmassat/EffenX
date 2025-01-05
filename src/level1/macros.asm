
levelOneInitMacro .macro
    lda \1
    cmp #objectInactive
    beq _setDefault
    rts
_setDefault
    lda #120
    sta \2
    stz \2 + 1
    
    lda #0
    sta \3
    sta \3 + 1

    lda #objectActive
    sta \1
.endmacro