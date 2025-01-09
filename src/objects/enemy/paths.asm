; change Y values
; a lo byte
; x hi byte
; returns a and x with new values
pathDown
    clc 
    adc #1
    pha
    txa
    adc #00
    tax
    pla
    rts

pathLeftDown
    clc 
    adc #1
    pha
    txa
    adc #00
    tax
    pla
    rts

pathPongFromLeft
    sec 
    sbc #1
    pha
    txa
    sbc #00
    tax
    pla

    rts

pathPongFromRight
    clc 
    adc #1
    pha
    txa
    adc #00
    tax
    pla

    rts



;yCheck
isOutOfBoundsY
    pha
    txa
    cmp #1
    bcs _checkUpperBound
    pla
    ;cmp  #$ff
    bcs _isOut
    sec
 ;   pla
    rts
_checkUpperBound
    pla
    cmp #$0f ; 87
    bcs _isOut
    sec
    rts
_isOut
    clc
    rts

;yCheck
;a lower byte 
;x hi byte
isOutOfBoundsX
    pha
    txa
    cmp #1
    bcs _checkUpperBound
    sec
    pla
    rts
_checkUpperBound
    pla
    cmp #$80 ; 53
    bcs _isOut
    sec
    rts
_isOut
    clc
    rts

constPathDown = 0
constPathPongFromLeft = 1
constPathPongFromRight = 2
