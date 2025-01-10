.section code
levelOneMoveEnemies
    jsr levelOneWaveOne
    jsr showEnemies
    rts

levelOneWaveOne
;    lda mwave
;    cmp #1
;    beq _continue
;    rts
;_continue
    jsr _move0
    jsr _move1
    jsr _move2
    jsr _move3
    jsr _move4
    jsr _move5
    jsr _move6
    jsr _move7
    jsr _move8
    jsr _move9
    ; jsr _move10
    ; jsr _move11
    ; jsr _move12
    ; jsr _move13
    ; jsr _move14
    
    ;jsr _move0
    ;jsr _move1
    ;jsr _move2
    ;jsr _move3
    ;jsr _move4
    jsr _move5
    jsr _move6
    jsr _move7
    jsr _move8
    jsr _move9
    ;jsr _move10
    ; jsr _move11
    ; jsr _move12
    ; jsr _move13
    ; jsr _move14

    ;jsr _move0
    ;jsr _move1
    ;jsr _move2
    ;jsr _move3
    ;jsr _move4
    ; jsr _move10
    ; jsr _move11
    ; jsr _move12
    ; jsr _move13
    ; jsr _move14
    rts
_move0
    #moveObjectMacro mEnemyStatus00, mEnemyPath00,  mEnemyX00, mEnemyY00, objectDisabled
    rts
_move1
    #moveObjectMacro mEnemyStatus01, mEnemyPath01,  mEnemyX01, mEnemyY01, objectDisabled
    rts
_move2
    #moveObjectMacro mEnemyStatus02, mEnemyPath02,  mEnemyX02, mEnemyY02, objectDisabled
    rts
_move3
    #moveObjectMacro mEnemyStatus03, mEnemyPath03,  mEnemyX03, mEnemyY03, objectDisabled
    rts
_move4
    #moveObjectMacro mEnemyStatus04, mEnemyPath04,  mEnemyX04, mEnemyY04, objectDisabled
    rts
_move5
    #moveObjectMacro mEnemyStatus05, mEnemyPath05,  mEnemyX05, mEnemyY05, objectDisabled
    rts
_move6
    #moveObjectMacro mEnemyStatus06, mEnemyPath06,  mEnemyX06, mEnemyY06, objectDisabled
    rts
_move7
    #moveObjectMacro mEnemyStatus07, mEnemyPath07,  mEnemyX07, mEnemyY07, objectDisabled
    rts
_move8
    #moveObjectMacro mEnemyStatus08, mEnemyPath08,  mEnemyX08, mEnemyY08, objectDisabled
    rts
_move9
    #moveObjectMacro mEnemyStatus09, mEnemyPath09,  mEnemyX09, mEnemyY09, objectDisabled
    rts

levelOneMove05
    #moveObjectMacro mEnemyStatus05, mEnemyPath05,  mEnemyX05, mEnemyY05, objectDisabled
    rts
    
showEnemies
    jsr showEnemy00
    jsr showEnemy01
    jsr showEnemy02
    jsr showEnemy03
    jsr showEnemy04
    jsr showEnemy05
    jsr showEnemy06
    jsr showEnemy07
    jsr showEnemy08
    jsr showEnemy09
    ; jsr showEnemy10
    ; jsr showEnemy11
    ; jsr showEnemy12
    ; jsr showEnemy13
    ; jsr showEnemy14
    rts

showEnemy00
    #showSpriteMacroA spEnemyNumber00, mEnemySpriteAddr00, mEnemyX00 ,mEnemyY00, SPRITE24L0C2, mEnemyStatus00
    rts
showEnemy01
    #showSpriteMacroA spEnemyNumber01, mEnemySpriteAddr01, mEnemyX01 ,mEnemyY01, SPRITE24L0C2, mEnemyStatus01
    rts
showEnemy02
    #showSpriteMacroA spEnemyNumber02, mEnemySpriteAddr02, mEnemyX02 ,mEnemyY02, SPRITE24L0C2, mEnemyStatus02
    rts
showEnemy03
    #showSpriteMacroA spEnemyNumber03, mEnemySpriteAddr03, mEnemyX03 ,mEnemyY03, SPRITE24L0C2, mEnemyStatus03
    rts
showEnemy04
    #showSpriteMacroA spEnemyNumber04, mEnemySpriteAddr04, mEnemyX04 ,mEnemyY04, SPRITE24L0C2, mEnemyStatus04
    rts
showEnemy05
    #showSpriteMacroA spEnemyNumber05, mEnemySpriteAddr05, mEnemyX05 ,mEnemyY05, SPRITE24L0C2, mEnemyStatus05
    rts
showEnemy06
    #showSpriteMacroA spEnemyNumber06, mEnemySpriteAddr06, mEnemyX06 ,mEnemyY06, SPRITE24L0C2, mEnemyStatus06
    rts
showEnemy07
    #showSpriteMacroA spEnemyNumber07, mEnemySpriteAddr07, mEnemyX07 ,mEnemyY07, SPRITE24L0C2, mEnemyStatus07
    rts
showEnemy08
    #showSpriteMacroA spEnemyNumber08, mEnemySpriteAddr08, mEnemyX08 ,mEnemyY08, SPRITE24L0C2, mEnemyStatus08
    rts
showEnemy09
    #showSpriteMacroA spEnemyNumber09, mEnemySpriteAddr09, mEnemyX09 ,mEnemyY09, SPRITE24L0C2, mEnemyStatus09
    rts
; showEnemy10
;     #showSpriteMacroA spEnemyNumber10, mEnemySpriteAdd10, mEnemyX10 ,mEnemyY10, SPRITE24L0C2, mEnemyStatus10
;     rts
; showEnemy11
;     #showSpriteMacroA spEnemyNumber11, mEnemySpriteAddr11, mEnemyX11 ,mEnemyY11, SPRITE24L0C2, mEnemyStatus11
;     rts
; showEnemy12
;     #showSpriteMacroA spEnemyNumber12, mEnemySpriteAddr12, mEnemyX12 ,mEnemyY12, SPRITE24L0C2, mEnemyStatus12
;     rts
; showEnemy13
;     #showSpriteMacroA spEnemyNumber13, mEnemySpriteAddr13, mEnemyX13 ,mEnemyY13, SPRITE24L0C2, mEnemyStatus13
;     rts
; showEnemy14
;     #showSpriteMacroA spEnemyNumber14, mEnemySpriteAddr14, mEnemyX14 ,mEnemyY14, SPRITE24L0C2, mEnemyStatus14
;     rts
; showEnemy15
;     #showSpriteMacroA spEnemyNumber15, mEnemySpriteAddr15, mEnemyX15 ,mEnemyY15, SPRITE24L0C2, mEnemyStatus15
;     rts
.endsection