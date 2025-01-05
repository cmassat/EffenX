enemyExplosionMacro .macro
    lda \1 
    cmp #objectCollided
    beq _hitDetected
    rts
_hitDetected
   lda \2
   cmp #$00
   beq _animate
   dec \2
   rts
_animate
    lda #10
    sta \2
    lda #\4
    jsr setSpriteNumber
    lda \3
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
    inc \3
    rts
_frame1
    lda #<spExplosionfr1
    ldx #>spExplosionfr1
    ldy #`spExplosionfr1
    jsr setSpriteAddress 
    inc \3
    rts
_frame2
    lda #<spExplosionfr2
    ldx #>spExplosionfr2
    ldy #`spExplosionfr2
    jsr setSpriteAddress 
    inc \3
_end
    jsr hideSprite
    lda #objectDisabled
    sta \1
    stz \3
    stz \2
.endmacro

;a register
; enemyStatus number
isEnemyHit
    cmp #objectCollided
    beq _yes
    sec
    rts
_yes
    clc
    rts
    
enemyHit
    jsr enemyHit0
    jsr enemyHit1
    jsr enemyHit2
    jsr enemyHit3
    jsr enemyHit4
    jsr enemyHit5
    jsr enemyHit6
    jsr enemyHit7
    jsr enemyHit8
    jsr enemyHit9
    jsr enemyHit10
    jsr enemyHit11
    rts

enemyHit0
     #enemyExplosionMacro mEnemyStatus00, mPlayerHitDelay0, mEnemyHitFrames0, spEnemyNumber00
     rts
enemyHit1
     #enemyExplosionMacro mEnemyStatus01, mPlayerHitDelay1, mEnemyHitFrames1, spEnemyNumber01
     rts
enemyHit2
     #enemyExplosionMacro mEnemyStatus02, mPlayerHitDelay2, mEnemyHitFrames2, spEnemyNumber02
     rts

enemyHit3
     #enemyExplosionMacro mEnemyStatus03, mPlayerHitDelay3, mEnemyHitFrames3, spEnemyNumber03
     rts

enemyHit4
     #enemyExplosionMacro mEnemyStatus04, mPlayerHitDelay4, mEnemyHitFrames4, spEnemyNumber04
     rts

enemyHit5
     #enemyExplosionMacro mEnemyStatus05, mPlayerHitDelay5, mEnemyHitFrames5, spEnemyNumber05
     rts

enemyHit6
     #enemyExplosionMacro mEnemyStatus06, mPlayerHitDelay6, mEnemyHitFrames6, spEnemyNumber06
     rts

enemyHit7
     #enemyExplosionMacro mEnemyStatus07, mPlayerHitDelay7, mEnemyHitFrames7, spEnemyNumber07
     rts
enemyHit8
     #enemyExplosionMacro mEnemyStatus08, mPlayerHitDelay8, mEnemyHitFrames8, spEnemyNumber08
     rts
enemyHit9
     #enemyExplosionMacro mEnemyStatus09, mPlayerHitDelay9, mEnemyHitFrames9, spEnemyNumber09
     rts
enemyHit10
     #enemyExplosionMacro mEnemyStatus10, mPlayerHitDelay10, mEnemyHitFrames10, spEnemyNumber10
     rts
enemyHit11
     #enemyExplosionMacro mEnemyStatus11, mPlayerHitDelay11, mEnemyHitFrames11, spEnemyNumber11
     rts
.section variables
mEnemyHitFrames0
    .byte $00
mPlayerHitDelay0
    .byte $00

mEnemyHitFrames1
    .byte $00
mPlayerHitDelay1
    .byte $00

mEnemyHitFrames2
    .byte $00
mPlayerHitDelay2
    .byte $00

mEnemyHitFrames3
    .byte $00
mPlayerHitDelay3
    .byte $00

mEnemyHitFrames4
    .byte $00
mPlayerHitDelay4
    .byte $00

mEnemyHitFrames5
    .byte $00
mPlayerHitDelay5
    .byte $00

mEnemyHitFrames6
    .byte $00
mPlayerHitDelay6
    .byte $00

mEnemyHitFrames7
    .byte $00
mPlayerHitDelay7
    .byte $00

mEnemyHitFrames8
    .byte $00
mPlayerHitDelay8
    .byte $00

mEnemyHitFrames9
    .byte $00
mPlayerHitDelay9
    .byte $00

mEnemyHitFrames10
    .byte $00
mPlayerHitDelay10
    .byte $00

mEnemyHitFrames11
    .byte $00
mPlayerHitDelay11
    .byte $00
.endsection
