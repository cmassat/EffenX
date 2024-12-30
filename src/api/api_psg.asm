SYS_CTRL = $d6a1

PSG_MONO_REG = $d608
PSG_LEFT_REG = $d610
PSG_RIGHT_REG = $d600

PSG_TONE_1_FREQ_MASK_L = %10000000
PSG_TONE_1_FREQ_MASK_H = %00000000
PSG_TONE_1_ATTN_MASK   = %10010000

PSG_TONE_2_FREQ_MASK_L = %10100000
PSG_TONE_2_FREQ_MASK_H = %00100000
PSG_TONE_2_ATTN_MASK   = %10110000

PSG_TONE_3_FREQ_MASK_L = %11000000
PSG_TONE_3_FREQ_MASK_H = %01000000
PSG_TONE_3_ATTN_MASK   = %11010000

;PSG_TONE_4_CTRL_MASK_WHT = %11100100
PSG_TONE_4_CTRL_MASK_WHT = %11100110

PSG_TONE_4_CTRL_MASK_PRD = %11100000
PSG_TONE_4_ATTN_MASK   = %11110000

PSG_NOISE_MASK = %11100000

psg_stereo 
    lda SYS_CTRL
    ora #%00000100
    sta SYS_CTRL
    rts 

psg_mono
    lda SYS_CTRL
    and #%11111011
    sta SYS_CTRL
    rts 

;a low byte freq 
;x med byte freq

psg_1_freq_mono
    sta PSG_FREQ_L
    stx PSG_FREQ_H
    
    lda PSG_FREQ_L
    and #$0f 
    ora #PSG_TONE_1_FREQ_MASK_L
    sta PSG_MONO_REG
    clc
    lda PSG_FREQ_L
    lsr
    lsr
    lsr
    lsr
    sta PSG_FREQ_L
    lda PSG_FREQ_H
    and #%00000011
    asl
    asl
    asl
    asl
    ora PSG_FREQ_L
    ora #PSG_TONE_1_FREQ_MASK_H

    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
;
    ;lda PSG_FREQ_H
    sta PSG_MONO_REG
    rts

psg_noise_mono
    lda #PSG_TONE_4_CTRL_MASK_WHT
    ora #PSG_NOISE_MASK
    sta PSG_MONO_REG
rts 

psg_noise_vol
    and #$0F
    ora #PSG_TONE_4_ATTN_MASK
    sta PSG_MONO_REG
rts 
;a register 0-15 
; 0 is the loudest
psg_1_volume_mono
    and #$0F
    sta PSG_VOLUME
    lda #PSG_TONE_1_ATTN_MASK
    ora PSG_VOLUME
    sta PSG_MONO_REG
    rts 

psg_2_volume_mono 
    and #$0F
    sta PSG_VOLUME
    lda #PSG_TONE_2_ATTN_MASK
    ora PSG_VOLUME
    sta PSG_MONO_REG
    rts

psg_2_freq_mono
    sta PSG_FREQ_L
    stx PSG_FREQ_H
    
    lda PSG_FREQ_L
    and #$0f 
    ora #PSG_TONE_2_FREQ_MASK_L
    sta PSG_MONO_REG
    ;clc
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    ;rol PSG_FREQ_L
    ;rol PSG_FREQ_H
    

    ;lda PSG_FREQ_H


    lda PSG_FREQ_L
    lsr
    lsr
    lsr
    lsr
    sta PSG_FREQ_L
    lda PSG_FREQ_H
    and #%00000011
    asl
    asl
    asl
    asl
    ora PSG_FREQ_L
    ora #PSG_TONE_2_FREQ_MASK_H 
    sta PSG_MONO_REG
    rts 

psg_3_tone_mono
    rts

psg_3_freq_mono 
    rts 

psg_noise_tone_mono
    rts

psg_noise_freq_mono 
    rts 

PSG_FREQ_L       = $C4
PSG_FREQ_M       = $C5
PSG_FREQ_H       = $C6
PSG_VOLUME       = $C8