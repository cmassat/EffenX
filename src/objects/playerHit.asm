playerHit
   lda mPlayerShield
   cmp #0
   beq _recordHit
   ;lda mPlayerStatus
   ;cmp #objectCollided
   ;beq _activateShield
   ;rts
_activateShield
   jsr player1UseShield
   rts
_recordHit
   lda #player1Shield
   sta mPlayerShield
   lda mPlayerHitDelay
   cmp #$00
   beq _animate
   dec mPlayerHitDelay
   rts
_animate
    lda #10
    sta mPlayerHitDelay
    lda #spPlayer1ShipNumber
    jsr setSpriteNumber
    lda mPlayerHitFrames
    cmp #$00
    beq _frame0
    cmp #$01
    beq _frame1
    cmp #$02
    beq _frame2
    cmp #$03
    beq _frame2
    cmp #$04
    beq _frame1
    cmp #$05
    beq _frame0
    cmp #$06
    beq _end

_frame0
    lda #<spExplosionfr0
    ldx #>spExplosionfr0
    ldy #`spExplosionfr0
    jsr setSpriteAddress
    inc mPlayerHitFrames
    rts
_frame1
    lda #<spExplosionfr1
    ldx #>spExplosionfr1
    ldy #`spExplosionfr1
    jsr setSpriteAddress 
    inc mPlayerHitFrames
    rts
_frame2
    lda #<spExplosionfr2
    ldx #>spExplosionfr2
    ldy #`spExplosionfr2
    jsr setSpriteAddress 
    inc mPlayerHitFrames
    rts
_end
    jsr loseLife
    ;jsr hideSprite
    lda #objectGodMode
    sta mPlayerStatus
    lda #120
    sta mPlayerGodModeTime
    STZ mPlayerHitFrames
    stz mPlayerHitDelay
    rts

player1UseShield
    lda mPlayerShieldDelay
    cmp #10
    beq _reset
    #showSpriteMacro spPlayer1ShieldNumber, spShieldAddress, mPlayerPosX , mPlayerPosY, SPRITE24L0C2
    inc mPlayerShieldDelay
    rts
_reset
    stz mPlayerShieldDelay
    dec mPlayerShield
    lda #spPlayer1ShieldNumber
    jsr setSpriteNumber
    jsr hideSprite
    lda #objectActive
    sta mPlayerStatus
    rts


.section variables
mPlayerHitFrames
    .byte $00
mPlayerHitDelay
    .byte $00
mPlayerShieldDelay
    .byte $00
mPLayerCollided
    .byte $00
.endsection