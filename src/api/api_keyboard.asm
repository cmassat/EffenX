.section code
keyboardTimer
    lda mKeyboardDelay
    cmp #0
    bne _delay
    rts
_delay
    dec mKeyboardDelay
    rts 

keyboardAnykey
    lda mKeyboardDelay
    cmp #0
    beq _setKey
    rts
_setKey
    lda #1
    sta mAnyKey
    rts
    
keyboardPressed
    jsr is_w_pressed
    jsr is_a_pressed
    jsr is_s_pressed
    jsr is_d_pressed
    jsr is_l_pressed
    rts
keyboardReleased
    jsr is_w_released
    jsr is_a_released
    jsr is_s_released
    jsr is_d_released
    jsr is_l_released
    rts

keyPressMacro .macro
    lda mKeyPress
    cmp #\2
    beq _yes
    rts
_yes
    lda #1 
    sta \1
    stz mKeyPress
.endmacro


is_a_pressed
    #keyPressMacro mKeyA, 'a'
    rts

is_a_released
    lda mKeyRelease
    cmp #'a'
    beq _yes
    rts
_yes
    stz mKeyA
    rts

is_d_pressed
    #keyPressMacro mKeyD, 'd'
    rts

is_d_released
    lda mKeyRelease
    cmp #'d'
    beq _yes
    rts
_yes
    stz mKeyD
    rts

is_l_pressed
    #keyPressMacro mKeyL, 'l'
    rts

is_l_released

    lda mKeyRelease
    cmp #'l'
    beq _yes
    rts
_yes
    stz mKeyL
    rts

is_s_pressed
    #keyPressMacro mKeyS, 's'
    rts

is_s_released
    lda mKeyRelease
    cmp #'s'
    beq _yes
    rts
_yes
    stz mKeyS
    rts

is_q_pressed
    lda mKeyPress
    cmp #'q'
    beq _yes
    rts
_yes
    rts

is_w_pressed
    #keyPressMacro mKeyW, 'w'
    rts

is_w_released
    lda mKeyRelease
    cmp #'w'
    beq _yes
    rts
_yes
    stz mKeyW
    rts


is_space_pressed
    lda mKeyPress
    cmp #$20
    beq _yes
    rts
_yes
    
    rts
.endsection

.section variables
keyboardDelayTimer = 10
mKeyboardDelay
    .byte $00
mAnyKey
    .byte $00
mKeyW
    .byte $00
mKeyA
    .byte $00
mKeyS
    .byte $00
mKeyD
    .byte $00
mKeyL
    .byte $00
.endsection