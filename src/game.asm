.section code
handleHud
    jsr handleGameOver
    rts

gaineLife
    inc mPlayer1Lives
    rts

loseLife
    lda mPlayer1Lives
    cmp #$00
    beq _gameOver
    dec mPlayer1Lives
    rts
_gameOver
    lda #stateGameOver
    jsr setState
    stz mLevelOneBossState
    rts
 
handleGameOver
    lda #stateGameOver
    jsr isState
    bcc _shouldPrintMessage
    rts
_shouldPrintMessage
    lda mHudState
    cmp #0
    beq _printMessage
    cmp #hudStateGameOver
    beq _waitForKey
    rts
_printMessage
    jsr clearScreenMemory
    lda #<mHudGameOverText0
    ldx #>mHudGameOverText0
    ldy #menuMsgStartLine
    jsr writeText

    lda #<mHudGameOverText1
    ldx #>mHudGameOverText1
    ldy #menuMsgStartLine + 1
    jsr writeText
    lda #hudStateGameOver
    sta mHudState
    jsr displayScore
    rts
_waitForKey
    jsr isAnyKeyPressed
    ; lda mAnyKey
    ; cmp #1
    bcc _restartGame
    rts
_restartGame
    ;jsr resetMenu
    jsr resetGame
    jsr clearScreenMemory
    stz mHudState
    ;stz mLevelOneState
    ;stz mKeyPress
    ;stz mMenuState
    lda #1
    sta mGameState
    lda #0
    sta mMenuState
    sta mLevelOneState
    rts

resetGame
    lda #numberOfLives
    sta mPlayer1Lives
    rts
.endsection

.section variables
numberOfLives = 3
hudStateGameOver = 1
mPlayer1Lives
    .byte $00
mHudState
    .byte $0
mHudGameOverText0
    .text '             Game Over', $00
mHudGameOverText1
    .text '       Press Space To Continue', $00
.endsection
