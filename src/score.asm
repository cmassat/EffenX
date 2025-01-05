.section code
handleScore
    jsr set40Col
    jsr displayScore
    jsr displayLives
    jsr displayShieldLevel
   ; jsr displayBossEnergy
    rts

writeScoreMacro .macro 
    pha
    lda #2
    sta MMU_IO_CTRL
    pla
    tay
    lda mNumbers, y
    sta \1
    lda #0
    sta MMU_IO_CTRL
.endmacro

writeLabelMacro .macro 
    pha
    lda #2
    sta MMU_IO_CTRL
    pla
    tay
    lda \2, y
    sta \1
    lda #0
    sta MMU_IO_CTRL
.endmacro

displayLives
    lda #0 
    #writeLabelMacro $c001 + (28 * 40), mLivesLabel
    lda #1
    #writeLabelMacro $c002 + (28 * 40), mLivesLabel
    lda #2
    #writeLabelMacro $c003 + (28 * 40), mLivesLabel 
    lda #3
    #writeLabelMacro $c004 + (28 * 40), mLivesLabel 
    lda #4
    #writeLabelMacro $c005 + (28 * 40), mLivesLabel 

    lda mPlayer1Lives  
    #writeScoreMacro $c007 + (28 * 40)
    rts

displayScore
    lda #0
    #writeLabelMacro $c001 + (1 * 40) , mScoreLabel
    lda #1
    #writeLabelMacro $c002 + (1 * 40), mScoreLabel
    lda #2
    #writeLabelMacro $c003 + (1 * 40), mScoreLabel
    lda #3
    #writeLabelMacro $c004 + (1 * 40), mScoreLabel
    lda #4
    #writeLabelMacro $c005 + (1 * 40), mScoreLabel

    jsr getScoreDigit0
    #writeScoreMacro $c00d + (1 * 40)
    jsr getScoreDigit1
    #writeScoreMacro $c00c + (1 * 40)
     jsr getScoreDigit2
    #writeScoreMacro $c00b + (1 * 40)
    jsr getScoreDigit3
    #writeScoreMacro $c00a + (1 * 40)
    jsr getScoreDigit4
    #writeScoreMacro $c009 + (1 * 40)
    jsr getScoreDigit5
    #writeScoreMacro $c008 + (1 * 40)
    jsr getScoreDigit6
    #writeScoreMacro $c007 + (1 * 40)
    rts

displayShieldLevel
    lda #0
    #writeLabelMacro $c00a + (28 * 40) , mScoreShieldLabel
    lda #1
    #writeLabelMacro $c00b + (28 * 40), mScoreShieldLabel
    lda #2
    #writeLabelMacro $c00c + (28 * 40), mScoreShieldLabel
    lda #3
    #writeLabelMacro $c00d + (28 * 40), mScoreShieldLabel
    lda #4
    #writeLabelMacro $c00e + (28 * 40), mScoreShieldLabel
    lda #5
    #writeLabelMacro $c00f + (28 * 40), mScoreShieldLabel

    lda mPlayerShield
    #writeScoreMacro $c011 + (28 * 40)
    rts

; displayBossEnergy
;      ;lda #0
;      ;#writeLabelMacro $c010 + (1 * 40) , mEnemyEnergyLabel
;      ;lda #1
;      ;#writeLabelMacro $c011 + (1 * 40), mEnemyEnergyLabel
;    ;lda #2
;    ;#writeLabelMacro $c012 + (1 * 40), mEnemyEnergyLabel
;    ;lda #3
;    ;#writeLabelMacro $c013 + (1 * 40), mEnemyEnergyLabel
;    ;lda #4
;    ;#writeLabelMacro $c014 + (1 * 40), mEnemyEnergyLabel
;    ;lda #5
;    ;#writeLabelMacro $c015 + (1 * 40), mEnemyEnergyLabel

;    ;da mPlayerShield
;    ;writeScoreMacro $c017 + (1 * 40)
;     rts
.endsection

.section variables
mNumbers
  .byte '0','1','2','3','4','5','6','7','8','9'
mLivesLabel
    .byte 'L','i','v','e','s'

mScoreLabel
    .byte 'S','c','o','r','e'

mScoreShieldLabel
    .byte 'S','h','i','e','l', 'd'

; mEnemyEnergyLabel
;      .byte 'E','n','e','r','g', 'y'
.endsection