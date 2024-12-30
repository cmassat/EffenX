.section code 
loadFont
    lda #1
    sta MMU_IO_CTRL
    ldy #0
_loop
    lda mFont, y
    sta $c180, y
    iny
    cpy #32
    bne _loop
     lda #0
    sta  MMU_IO_CTRL
    rts
.endsection

.section data
mFont
    .byte %01111111
    .byte %01000001
    .byte %01000001
    .byte %01000011
    .byte %01000011
    .byte %01000011
    .byte %01111111
    .byte %00000000

    .byte %00011000
    .byte %00101000
    .byte %00001000
    .byte %00001000
    .byte %00011000
    .byte %00011000
    .byte %01111111
    .byte %00000000

    .byte %01111111
    .byte %00000001
    .byte %00000001
    .byte %01111111
    .byte %01100000
    .byte %01100000
    .byte %01111111
    .byte %00000000

    .byte %01111111
    .byte %00000001
    .byte %00000001
    .byte %01111111
    .byte %00000011
    .byte %00000011
    .byte %01111111
    .byte %00000000
.endsection