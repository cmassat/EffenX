setX1
    sta mLineX1
    sta mLineX1 + 1
    rts
setX2
    sta mLineX2
    sta mLineX2 + 1
    rts

setY1
    sta mLineY1
    sta mLineY1 + 1
    rts
setY2
    sta mLineY2
    sta mLineY2 + 1
    rts

findPoint
_dx
    lda mLineX2
    sec
    sbc mLineX1
    sta mDx
    lda mLineX2 + 1
    sbc mLineX1 + 1
    sta mDx + 1
_dy
    lda mLineY2
    sec
    sbc mLineY1
    sta mDy
    lda mLineY2 + 1
    sbc mLineY1
    sta mDy + 1
_decision
    ;multiply decision by 2
    lda mDy
    asl
    sta mDecision

    lda mDy + 1
    rol
    sta mDecision + 1
    ;subtract Dx from 2*Dy
    lda mDecision
    sec
    sbc mDx
    sta mDecision
    lda mDecision + 1
    sbc mDx + 1
    sta mDecision + 1

    lda mLineX1
    cmp mLineX2
    bne _continue 
    lda mLineY1
    cmp mLineY2
    bne _continue 
    rts
_continue
    lda mLineX1
    clc
    adc #1
    sta mLineX1
    lda mLineX1 + 1
    adc #0
    sta mLineX1 + 1

    lda mDecision
    cmp #0
    bmi _skipY
    lda mLineY1
    clc 
    adc #1
    sta mLineY1
    lda mLineY1 + 1
    adc #0
    sta mLineY1 + 1

    lda mDecision
    sec
    sbc mDx
    sta mDecision
    lda mDecision + 1
    sbc mDx + 1
    sta mDecision + 1
    rts
_skipY
    lda mDecision
    clc
    adc mDy
    sta mDecision
    lda mDecision + 1
    adc mDy + 1
    sta mDecision + 1
    rts

mLineX1
    .byte $00, $00
mLineX2
    .byte $00, $00

mLineY1
    .byte $00, $00
mLineY2
    .byte $00, $00

mDx
    .byte $00, $00
mDy
    .byte $00, $00

mDecision
    .byte $00, $00
