.section code
handleCollisionDetect
    ;jsr checkCollisionMissle0
    ;jsr checkCollisionMissle1
    rts
.endsection

;checkCollideMacro .macro
;    lda \2 + 1
;    cmp \3 + 1
;    beq _check_box1_lo
;    bcs _check_box2   
;    rts
;_check_box1_lo
;    lda \2
;    cmp \3
;    bcs _check_box2
;    rts 
;_check_box2
;    lda \4 + 1
;    cmp \1 + 1
;    beq _check_box2_low
;    bcs _hit   
;    rts  
;_check_box2_low 
;    lda \4
;    cmp \1
;    bcs _hit
;    rts
;_hit
;    lda #1
;    sta \5
;.endmacro 
;
;;#checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;collisionSetBoxMacro .macro
;    lda \1
;    sta mEnemyHitBoxStartX
;    lda \1 + 1
;    sta mEnemyHitBoxStartX + 1
;
;    lda mEnemyHitBoxStartX
;     clc
;     adc #\2
;     sta mEnemyHitBoxEndX
;
;     lda mEnemyHitBoxStartX + 1
;     adc #0
;     sta mEnemyHitBoxEndX + 1
;
;     lda \3
;     sta mLaserHitBoxStartX
;     lda \3 + 1
;     sta mLaserHitBoxStartX + 1
;
;     lda mLaserHitBoxStartX
;     clc
;     adc #\4
;     sta mLaserHitBoxEndX
;
;     lda mLaserHitBoxStartX + 1
;     adc #0
;     sta mLaserHitBoxEndX + 1
;.endmacro
;collisionSetBoxMacroY .macro
;    lda \1
;    sta mEnemyHitBoxStartY
;    lda \1 + 1
;    sta mEnemyHitBoxStartY + 1
;
;    lda mEnemyHitBoxStartY
;     clc
;     adc #\2
;     sta mEnemyHitBoxEndY
;
;     lda mEnemyHitBoxStartY + 1
;     adc #0
;     sta mEnemyHitBoxEndY + 1
;
;     lda \3
;     sta mLaserHitBoxStartY
;     lda \3 + 1
;     sta mLaserHitBoxStartY + 1
;
;     lda mLaserHitBoxStartY
;     clc
;     adc #\4
;     sta mLaserHitBoxEndY
;
;     lda mLaserHitBoxStartY + 1
;     adc #0
;     sta mLaserHitBoxEndY + 1
;.endmacro 
;isBulletCollided .macro
;    lda mYoverlap
;    cmp #1
;    beq _checkbulletcollision
;    rts
;_checkbulletcollision
;    lda mXoverlap
;    cmp #1
;    beq _bullethit
;    rts
;_bullethit
;    lda #1
;    sta mCollisionDetected
;    stz \1
;    stz \2
;.endmacro
;
;checkCollisionMissle0
;    lda mMissle00Active
;    cmp #1
;    beq _checkmissle0
;    stz mYoverlap
;    stz mXoverlap
;    rts 
;_checkmissle0
;    jsr _ccEnemyX0
;    rts 
;_ccEnemyX0
;    ;jsr m0cE0C
;    ;jsr m0cE1C
;    jsr m0cE2C
;    jsr m0cE3C
;    jsr m0cE4C
;    rts
;m0cE0C
;    lda #1
;    cmp mEnemy0
;    beq _ok
;    rts
;_ok
;    stz mXoverlap
;    stz mYoverlap
;    jsr m0cE0X
;    jsr m0cE0Y
;    #isBulletCollided mEnemy0, mMissle00Active
;    rts
;; m0cE1C
;;     lda #1
;;     cmp mEnemy1
;;     beq _ok
;;     rts
;; _ok
;;     stz mXoverlap
;;     stz mYoverlap
;;     jsr m0cE1X
;;     jsr m0cE1Y
;;     #isBulletCollided mEnemy1, mMissle00Active
;;     rts
;m0cE2C   
;    lda #1
;    cmp mEnemy2
;    beq _ok
;    rts
;_ok
;    stz mXoverlap
;    stz mYoverlap
;    jsr m0cE2X
;    jsr m0cE2Y
;    #isBulletCollided mEnemy2, mMissle00Active
;    rts
;m0cE3C
;    stz mXoverlap
;    stz mYoverlap
;    lda #1
;    cmp mEnemy3
;    beq _ok
;    rts
;_ok
;    jsr m0cE3X
;    jsr m0cE3Y
;    #isBulletCollided mEnemy3, mMissle00Active
;    rts
;m0cE4C
;    lda #1
;    cmp mEnemy4
;    beq _ok
;    rts
;_ok
;    stz mXoverlap
;    stz mYoverlap
;    jsr m0cE4X
;    jsr m0cE4Y
;    #isBulletCollided mEnemy4, mMissle00Active
;    rts
;m0cE0X
;    #collisionSetBoxMacro mEnemy0 + 2, 24, mMissle00PosX, 6
;    #checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;    rts
;m0cE0Y
;    #collisionSetBoxMacroY mEnemy0 + 4, 24, mMissle00Posy, 6
;    #checkCollideMacro mEnemyHitBoxStartY, mEnemyHitBoxEndY, mLaserHitBoxStartY,  mLaserHitBoxEndY, mYoverlap
;    rts
;
;m0cE1X
;    stz mXoverlap
;    stz mYoverlap
;    #collisionSetBoxMacro mEnemy1 + 2, 24, mMissle00PosX, 6
;    #checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;    rts
;m0cE1Y
;    #collisionSetBoxMacroY mEnemy1 + 4, 24, mMissle00Posy, 6
;    #checkCollideMacro mEnemyHitBoxStartY, mEnemyHitBoxEndY, mLaserHitBoxStartY,  mLaserHitBoxEndY, mYoverlap
;    rts
;m0cE2X
;    stz mXoverlap
;    stz mYoverlap
;    #collisionSetBoxMacro mEnemy2 + 2, 24, mMissle00PosX, 6
;    #checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;    rts
;m0cE2Y
;    #collisionSetBoxMacroY mEnemy2 + 4, 24, mMissle00Posy, 6
;    #checkCollideMacro mEnemyHitBoxStartY, mEnemyHitBoxEndY, mLaserHitBoxStartY,  mLaserHitBoxEndY, mYoverlap
;    rts
;m0cE3X
;    stz mXoverlap
;    stz mYoverlap
;    #collisionSetBoxMacro mEnemy3 + 2, 24, mMissle00PosX, 6
;    #checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;    rts
;m0cE3Y
;    #collisionSetBoxMacroY mEnemy3 + 4, 24, mMissle00Posy, 6
;    #checkCollideMacro mEnemyHitBoxStartY, mEnemyHitBoxEndY, mLaserHitBoxStartY,  mLaserHitBoxEndY, mYoverlap
;    rts
;m0cE4X
;    stz mXoverlap
;    stz mYoverlap
;    #collisionSetBoxMacro mEnemy4 + 2, 24, mMissle00PosX, 6
;    #checkCollideMacro mEnemyHitBoxStartX, mEnemyHitBoxEndX, mLaserHitBoxStartX,  mLaserHitBoxEndX, mXoverlap
;    rts
;m0cE4Y
;    #collisionSetBoxMacroY mEnemy4 + 4, 24, mMissle00Posy, 6
;    #checkCollideMacro mEnemyHitBoxStartY, mEnemyHitBoxEndY, mLaserHitBoxStartY,  mLaserHitBoxEndY, mYoverlap
;    rts
;
;
;
;
;.endsection
;
;.section variables
;    mEnemyHitBoxStartX .byte $00, $00
;    mEnemyHitBoxStartY .byte $00, $00
;    mEnemyHitBoxEndX .byte $00, $00
;    mEnemyHitBoxEndY .word $00, $00
;
;
;    mLaserHitBoxStartX .byte $00, $00
;    mLaserHitBoxStartY .byte $00, $00
;    mLaserHitBoxEndX .byte $00, $00
;    mLaserHitBoxEndY .byte $00, $00
;	
;    mXoverlap .byte $00
;    mYoverlap .byte $00
;
;    mCollisionDetected .byte $00
;    xDebugx .byte $00
;    xDebugY .byte $00
;
;	m_npc_n .byte $00, $00
;	m_result_n .byte $00, $00
;	m_p1_n .byte $00, $00
;	m_collision_state .byte $00
;.endsection
