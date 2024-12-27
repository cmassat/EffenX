.section code
initState
    lda #stateSplash
    sta mGameState
    rts

nextState
    inc mGameState
    rts


;a register is state number
isState
    cmp mGameState
    beq _yes
    sec
    rts
_yes
    clc
    rts
.endsection
.section variables
stateSplash = 0
stateMenu   = 1
stateLvl1   = 2
mGameState
    .byte 0
.endsection