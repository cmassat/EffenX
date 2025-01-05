levelOneInitEnemies
    jsr enemyInit00
    jsr enemyInit01
    jsr enemyInit02
    jsr enemyInit03
    jsr enemyInit04
    rts

enemyInit00
    #levelOneInitMacro mEnemyStatus00, mEnemyX00, mEnemyY00
    rts

enemyInit01
    #levelOneInitMacro mEnemyStatus01, mEnemyX01, mEnemyY01
    rts

enemyInit02
    #levelOneInitMacro mEnemyStatus02, mEnemyX02, mEnemyY02
    rts

enemyInit03
    #levelOneInitMacro mEnemyStatus03, mEnemyX03, mEnemyY03
    rts

enemyInit04
    #levelOneInitMacro mEnemyStatus04, mEnemyX04, mEnemyY04
    rts

levelOneMoveEnemies
   
    jsr levelOneMove00
    jsr levelOneMove01
    jsr levelOneMove02
    jsr levelOneMove03
    jsr levelOneMove04
    jsr levelOneMove05
    jsr showEnemies
    rts

levelOneMoveMacro .macro
    lda \1
    cmp #objectDisabled
    bne _checkActive
    rts
_checkActive
    lda \1
    cmp #objectActive
    beq _moveEnemy
    rts
_moveEnemy
    cmp  #240
    bcs _resetEnemy
    lda \2
    adc #1
    sta \2
    rts
_resetEnemy
    lda #objectDisabled
    sta \1
.endmacro

levelOneMove00
    #levelOneMoveMacro mEnemyStatus00, mEnemyY00
    rts
levelOneMove01
    #levelOneMoveMacro mEnemyStatus01, mEnemyY01
    rts

levelOneMove02
    #levelOneMoveMacro mEnemyStatus02, mEnemyY02
    rts

levelOneMove03
    #levelOneMoveMacro mEnemyStatus03, mEnemyY03
    rts

levelOneMove04
    #levelOneMoveMacro mEnemyStatus04, mEnemyY04
    rts

levelOneMove05
    #levelOneMoveMacro mEnemyStatus05, mEnemyY05
    rts
    
lvlOneMoves = $3
mLvlOneMoves
    .byte $00

jmpTableEnemyStatus
.byte  <mEnemyStatus00, >mEnemyStatus00
.byte  <mEnemyStatus01, >mEnemyStatus01
.word  mEnemyStatus02
.word  mEnemyStatus03
.word  mEnemyStatus04
jmpTableEnemyMove
.byte <mEnemyY00, >mEnemyY00
.byte <mEnemyY01, >mEnemyY01
.word  mEnemyY02
.word  mEnemyY03
.word  mEnemyY04
tmpPtr
    .byte 0,0
; jmpTableEnemyInit
; .word enemy00Init
; .word enemy01Init

jmpLocation
    .word $00

showEnemies
    jsr showEnemy00
    jsr showEnemy01
    jsr showEnemy02
    jsr showEnemy03
    jsr showEnemy04
    rts

showEnemy00
    lda mEnemyStatus00
    cmp #objectActive
    beq _show
    rts
_show
    #showSpriteMacro spEnemyNumber00, spEnemy00, mEnemyX00 ,mEnemyY00, SPRITE24L0C2
    rts

showEnemy01
    lda mEnemyStatus01
    cmp #objectActive
    beq _show
    rts
_show
    #showSpriteMacro spEnemyNumber01, spEnemy00, mEnemyX01 ,mEnemyY01, SPRITE24L0C2
    rts
showEnemy02
    lda mEnemyStatus02
    cmp #objectActive
    beq _show
    rts
_show
    #showSpriteMacro spEnemyNumber02, spEnemy00, mEnemyX02 ,mEnemyY02, SPRITE24L0C2
    rts
showEnemy03
    lda mEnemyStatus03
    cmp #objectActive
    beq _show
    rts
_show
    #showSpriteMacro spEnemyNumber03, spEnemy00, mEnemyX03 ,mEnemyY03, SPRITE24L0C2
    rts
showEnemy04
    lda mEnemyStatus04
    cmp #objectActive
    beq _show
    rts
_show
    #showSpriteMacro spEnemyNumber04, spEnemy00, mEnemyX04 ,mEnemyY04, SPRITE24L0C2
    rts