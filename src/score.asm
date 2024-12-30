.section code
handleScore
    jsr set40Col
    jsr displayScore
    jsr displayLives
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
    #writeLabelMacro $c000 + (28 * 40), mLivesLabel
    lda #1
    #writeLabelMacro $c001 + (28 * 40), mLivesLabel
    lda #2
    #writeLabelMacro $c002 + (28 * 40), mLivesLabel 
    lda #3
    #writeLabelMacro $c003 + (28 * 40), mLivesLabel 
    lda #4
    #writeLabelMacro $c004 + (28 * 40), mLivesLabel 

    lda mPlayer1Lives  
    #writeScoreMacro $c006 + (28 * 40)
    rts

displayScore
     lda #0
    #writeLabelMacro $c000, mScoreLabel
    lda #1
    #writeLabelMacro $c001, mScoreLabel
    lda #2
    #writeLabelMacro $c002, mScoreLabel
    lda #3
    #writeLabelMacro $c003, mScoreLabel
    lda #4
    #writeLabelMacro $c004, mScoreLabel

    jsr getScoreDigit0
    #writeScoreMacro $c00c
    jsr getScoreDigit1
    #writeScoreMacro $c00b
     jsr getScoreDigit2
    #writeScoreMacro $c00a
    jsr getScoreDigit3
    #writeScoreMacro $c009
    jsr getScoreDigit4
    #writeScoreMacro $c008
    jsr getScoreDigit5
    #writeScoreMacro $c007
    jsr getScoreDigit6
    #writeScoreMacro $c006
    rts

.endsection

.section variables
mNumbers
  .byte '0','1','2','3','4','5','6','7','8','9'
mLivesLabel
    .byte 'L','i','v','e','s'

mScoreLabel
    .byte 'S','c','o','r','e'
.endsection