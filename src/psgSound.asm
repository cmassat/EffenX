.section code
handle_psg
    jsr sound_thrust_event
    jsr sound_fire_event
    jsr sound_explosion_event
    rts 

sound_thrust_event
    lda mPlayThrust
    cmp #1
    beq _playSound
    rts
_playSound
    lda mThrustDuration
    cmp #10
    bne _play_crash
    lda #15
    jsr psg_noise_vol
    stz mPlayThrust
    rts 
_play_crash
    lda mThrustDuration
    cmp #0 
    bne _end 
    jsr psg_noise_mono
    lda #5
    jsr psg_noise_vol

_end 
    inc mThrustDuration
    rts 

sound_fire_event
    lda mPlayFire
    cmp #1
    beq _playSound
    rts
_playSound
    lda mPSGFireDuration
    cmp #10
    beq _end
    lda mPSGFireFrequency
    sta POINTER_PSG
    lda mPSGFireFrequency + 1
    sta POINTER_PSG + 1
   
    lda #5
    jsr psg_2_volume_mono

    ldy mPSGFireDuration
    lda (POINTER_PSG), y
    jsr psg_2_freq_mono

    inc mPSGFireDuration
    rts 
_end 
    lda #10
    sta mPSGFireDuration
    lda #15
    jsr psg_2_volume_mono
    stz mPlayFire
    rts 

sound_explosion_event
    lda mPlayExplosion
    cmp #1
    beq _playSound
    rts
_playSound
     lda mPSGExplosionDuration
     cmp #15
     beq _end

    lda mPSGEplosionFrequency
    ldx mPSGEplosionFrequency + 1
    jsr psg_1_freq_mono
    lda #5
    jsr psg_1_volume_mono
     
    lda mPSGEplosionFrequency
    clc
    adc #5
    sta mPSGEplosionFrequency

    lda mPSGEplosionFrequency + 1
    adc #0
    sta mPSGEplosionFrequency + 1
    inc mPSGExplosionDuration
    rts
 _end
     lda #15
     jsr psg_1_volume_mono
     lda #15
     jsr psg_noise_vol

     lda #$fd
     sta mPSGEplosionFrequency
     lda #$01
     sta mPSGEplosionFrequency + 1
     lda #15
     sta mPSGExplosionDuration
     stz mPlayExplosion
     rts

sound_play_thrust
    lda #1
    sta mPlayThrust
    lda mThrustDuration
    cmp #10
    beq _play
    rts
_play
    lda #0
    sta mThrustDuration
    rts

sound_play_fire
    lda #1
    sta mPlayFire
    lda mPSGFireDuration
    cmp #10
    beq _play
    rts
_play
    lda #0
    sta mPSGFireDuration
    lda mPSGFireFrequency
    sta POINTER_PSG
    lda mPSGFireFrequency + 1
    sta POINTER_PSG + 1
    rts

 sound_play_explosion
    lda #1
    sta mPlayExplosion
   ; lda mPSGExplosionDuration
   ; cmp #10
   ; beq _play
   ; rts
 _play
    lda #0
    sta mPSGExplosionDuration
     lda #$fd
     sta mPSGEplosionFrequency
     lda #$01
     sta mPSGEplosionFrequency + 1
      jsr psg_noise_mono
    lda #$05
    jsr psg_noise_vol
    rts
.endsection

.section variables
EXPDELAY = 15
mThrustDuration 
    .byte 10
mPSGExplosionDuration
    .byte 15
mPSGEplosionFrequency
    .byte $fd, $01

mPlayThrust
    .byte $0
mPlayExplosion
    .byte $0
mPlayFire
    .byte $0

mPSGFireDuration
     .byte 10
mPSGFireFrequency
.byte $043,$020,$0A0,$004,$022,$0FF,$0F4,$022
.byte $040,$01C,$060,$019
.byte $043,$01E,$060,$00D,$011,$002,$01A,$012
.byte $050

.endsection