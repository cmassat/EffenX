.section code
debug
    phy
    lda #2
    sta MMU_IO_CTRL

    lda mMiniBossStatus
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C000

    lda mMiniBossStatus
    and #$0F
     tay
    lda mHex, y
    sta $C001

    lda mHomingMissleStatus00
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C002

    lda mHomingMissleStatus00
    and #$0F
    tay
    lda mHex, y
    sta $C003

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;w
    lda mHomingMissleX00 + 1
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C005

    lda mHomingMissleX00 + 1

    and #$0F
    tay
    lda mHex, y
    sta $C006 

     lda mHomingMissleX00
     lsr
     lsr 
     lsr
     lsr
     tay
     lda mHex, y
     sta $C007

     lda mHomingMissleX00
     and #$0F
     tay
     lda mHex, y
     sta $C008

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda mHomingMissleY00 + 1
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C00a

    lda  mHomingMissleY00 + 1
    and #$0F
     tay
    lda mHex, y
    sta $C00b

    lda  mHomingMissleY00
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C00d

    lda mHomingMissleY00 
    and #$0F
     tay
    lda mHex, y
    sta $C00e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mDecision
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C010

    lda mDecision
    and #$0F
    tay
    lda mHex, y
    sta $C011

    lda mDy
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta  $C012

    lda mDy
    and #$0F
    tay
    lda mHex, y
    sta  $C013
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    lda m_score_1
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C006 + 80
;
;    lda m_score_1
;    and #$0F
;    tay
;    lda mHex, y
;    sta $C007 + 80
;
;    lda m_score_0
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C008 + 80
;
;    lda m_score_0
;    and #$0F
;    tay
;    lda mHex, y
;    sta $C009 + 80
 ply
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    lda #0
    sta  MMU_IO_CTRL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    rts

clearFont
    lda #1
    sta MMU_IO_CTRL
    ldy #0
_loop
    lda #0
    sta $c000, y
    sta $c100, y
    sta $c200, y
    sta $c300, y
    sta $c400, y
    sta $c500, y
    sta $c600, y
    sta $c700, y
    iny
    cpy #$ff
    bne _loop
     lda #0
    sta  MMU_IO_CTRL
    rts



mDebug1
    .byte $00

mHex
    .text '0123456789ABCDEF'

.endsection