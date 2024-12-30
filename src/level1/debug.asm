debug
    lda #2
    sta MMU_IO_CTRL

    lda mAnyKey
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C000 + 40

    lda mAnyKey
    and #$0F
     tay
    lda mHex, y
    sta $C001 + 40

    lda mKeyboardDelay
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C002 + 40

    lda mKeyboardDelay
    and #$0F
    tay
    lda mHex, y
    sta $C003 + 40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mEnemyLaserActive03
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C005 + 40

    lda mEnemyLaserActive03
    and #$0F
    tay
    lda mHex, y
    sta $C006 + 40
;
;    lda m_score_6
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C008
;
;    lda m_score_6
;    and #$0F
;    tay
;    lda mHex, y
;    sta $C009
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    lda mXhit
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C000 + 40
;
;    lda mXhit
;    and #$0F
;     tay
;    lda mHex, y
;    sta $C001 + 40
;
;    lda mYhit
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C002 + 40
;
;    lda mYhit
;    and #$0F
;     tay
;    lda mHex, y
;    sta $C003 + 40
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    lda m_score_3
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C006 + 40
;
;    lda m_score_3
;    and #$0F
;    tay
;    lda mHex, y
;    sta $C007 + 40
;
;    lda m_score_2
;    lsr
;    lsr 
;    lsr
;    lsr
;    tay
;    lda mHex, y
;    sta $C008 + 40
;
;    lda m_score_2
;    and #$0F
;    tay
;    lda mHex, y
;    sta $C009 + 40
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