.section code
;------------------
;input a register
;set the appropiate 
;bitmap pointer
;------------------
setBitmapNumber
    asl a
    tax
    lda mBitmapAttr,x
    sta POINTER_BMP
    inx
    lda mBitmapAttr,x
    sta POINTER_BMP + 1
    rts

;------------------
;input a,x,y register
;a = low
;x = mid
;y = hi
;set address of bitmap
;------------------
setBitmapAddress
    phy 
    ldy #1
    sta (POINTER_BMP), y
    ldy #2
    txa
    sta (POINTER_BMP), y
    ply
    tya
    ldy #3
    sta (POINTER_BMP), y
    rts

showBitmap
    lda #1
    sta (POINTER_BMP)
    rts 

hideAllBitmaps
    lda #0
    sta $D100
    sta $D108
    sta $D110
    rts

;enableBitmap0
;    lda #1
;    sta $D100
;    rts
;
;enableBitmap1
;    lda #1
;    sta $D108
;    rts
;
;enableBitmap2
;    lda #1
;    sta $D110
;    rts
;
;setBitmapAddr0
;    sta $D101
;    stx $d102
;    sty $d103
;    rts
;
;setBitmapAddr1
;    sta $D109
;    stx $d10A
;    sty $d10B
;    rts 
;
;setBitmapAddr2
;    sta $D111
;    stx $d112
;    sty $d113
;    rts
.endsection
.section variables
mBitmapAttr
    .word $D100
    .word $D108
    .word $D110
.endsection