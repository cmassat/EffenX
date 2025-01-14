.section code
setX1
    sta mLineX1
    stx mLineX1 + 1
    rts

setX2
    sta mLineX2
    stx mLineX2 + 1
    rts

setY1
    sta mLineY1
    stx mLineY1 + 1
    rts

setY2
    sta mLineY2
    stx mLineY2 + 1
    rts

setDx
    sta mDx
    stx mDx + 1
    rts
setDy
    sta mDy
    stx mDy + 1
    rts

setDecision
    sta mDecision
    stx mDecision + 1
    rts

initLinePath
    lda mLineX1 + 1; 0
    cmp mLineX2 + 1; 1
    beq _check_lo_byte
    bcs _plotGoLeft
    bcc _plotGoRight
_check_lo_byte 
    lda mLineX1
    cmp mLineX2
    bcc _plotGoRight
    bcs _plotGoLeft
    rts

_plotGoRight
    jsr lineInitRightDown    
    rts
_plotGoLeft  
    jsr lineInitLeftDown   
    rts

lineInitLeftDown
_dx
    lda mLineX1
    sec
    sbc mLineX2
    sta mDx
    lda mLineX1 + 1
    sbc mLineX2 + 1
    sta mDx + 1
_dy
    lda mLineY2
    sec
    sbc mLineY1
    sta mDy
    lda mLineY2 + 1
    sbc mLineY1 + 1
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

    lda mDy + 1
    cmp mDx + 1
    beq _checkLower
    bcc _notSteep
    bcs _steep
_checkLower
    lda mDy
    cmp mDx
    bcs _steep
    bcc _notSteep
    rts
_notSteep
    lda #constDownLeft
    sta mLinePath
    rts
_steep
    lda #constDownLeftSteep
    sta mLinePath

    rts 

drawDownRight
    lda mLineX2 + 1
    cmp mLineX1 + 1
    bne _continue 
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

drawDownRightSteep
    lda mLineX2 + 1
    cmp mLineX1 + 1
    bne _continue 
    lda mLineX1
    cmp mLineX2
    bne _continue 
    lda mLineY1
    cmp mLineY2
    bne _continue 
    rts
_continue
    lda mLineY1
    clc
    adc #1
    sta mLineY1
    lda mLineY1 + 1
    adc #0
    sta mLineY1 + 1

    lda mDecision
    cmp #0
    bmi _skipX
    lda mLineY1
    clc 
    adc #1
    sta mLineX1
    lda mLineX1 + 1
    adc #0
    sta mLineX1 + 1

    lda mDecision
    sec
    sbc mDy
    sta mDecision
    lda mDecision + 1
    sbc mDy + 1
    sta mDecision + 1
    rts
_skipX
    lda mDecision
    clc
    adc mDx
    sta mDecision
    lda mDecision + 1
    adc mDx + 1
    sta mDecision + 1
    rts 

lineInitRightDown
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

    lda mDy + 1
    cmp mDx + 1
    beq _checkLower
    bcc _notSteep
    bcs _steep
_checkLower
    lda mDy
    cmp mDx
    bcs _steep
    bcc _notSteep
    rts
_notSteep
    lda #constDownRight
    sta mLinePath
    rts
_steep
    lda #constDownRightSteep
    sta mLinePath
    rts
drawDownLeft
    lda mLineX2 + 1
    cmp mLineX1 + 1
    bne _continue 
    lda mLineX1
    cmp mLineX2
    bne _continue 
    lda mLineY1
    cmp mLineY2
    bne _continue 
    rts
_continue
    lda mLineX1
    sec
    sbc #1
    sta mLineX1
    lda mLineX1 + 1
    sbc #0
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

drawDownLeftSteep
    lda mLineX2 + 1
    cmp mLineX1 + 1
    bne _continue 
    lda mLineX1
    cmp mLineX2
    bne _continue 
    lda mLineY1
    cmp mLineY2
    bne _continue 
    rts
_continue
    lda mLineY1
    clc
    adc #1
    sta mLineY1
    lda mLineY1 + 1
    adc #0
    sta mLineY1 + 1

    lda mDecision
    cmp #0
    bmi _skipX
    lda mLineY1
    sec 
    sbc #1
    sta mLineX1
    lda mLineX1 + 1
    sbc #0
    sta mLineX1 + 1

    lda mDecision
    sec
    sbc mDy
    sta mDecision
    lda mDecision + 1
    sbc mDy + 1
    sta mDecision + 1
    rts
_skipX
    lda mDecision
    clc
    adc mDx
    sta mDecision
    lda mDecision + 1
    adc mDx + 1
    sta mDecision + 1
    rts 
getLineX
    lda mLineX1
    ldx mLineX1 + 1
    rts

getLineY
    lda mLineY1
    ldx mLineY1 + 1 
    rts

getDx
    lda mDx
    ldx mDx + 1
    rts

getDy
    lda mDy
    ldx mDy + 1
    rts

getDecision
    lda mDecision
    ldx mDecision + 1
    rts

getPath
    lda mLinePath
    rts
.endsection
.section variables
constDownLeft = 0
constDownRight = 1
constDownLeftSteep = 3
constDownRightSteep = 4
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
mLinePath
    .byte $00
mLineTemp
    .byte $00, $00
.endsection