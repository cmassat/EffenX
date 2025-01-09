.section code
handleLevelOneBossBattle
    jsr startBattle
    lda mLevelOneBossState
    cmp #levelOneBossStateinit
    beq _initLevelOneBoss

    cmp #levelOneBossStateIntro
    beq _levelOneIntro

    cmp #levelOneBossStateStart
    beq _startBattle

    cmp #levelOneBossStateBossByeBye
    beq _bossByeBye

    cmp #levelOneBossClear
    beq _levelClear
    rts
_initLevelOneBoss
    jsr resetEnemies
    jsr initLevelOneBoss
    inc mLevelOneBossState
    rts

_levelOneIntro
    
    jsr levelOneBossIntro
    rts

_startBattle
    jsr gameLoopLevelOneBossBattle
    rts
_bossByeBye
    jsr handleBossByeBye

    rts
_levelClear
    jsr hidePlayer1
    rts
;----------------------------------
; Level One Boss Game Loop
;----------------------------------
gameLoopLevelOneBossBattle

    jsr playerLaserCollide
    ;jsr handleLevelOneBossBomb0
    ;jsr handleLevelOneBossBomb1
    jsr handleLevelOneBossBomb2
    jsr handleLevelOneBossBomb3
    jsr handleLevelOneBossBoss
    jsr levelOneShowBoss
    jsr handleLevelOneBossEnamyLaser0
    jsr handleEnemyLaserCollision
    jsr handleBossHit
    ;jsr hideDisabledEnemies
    jsr handleScore

    rts

handleBossByeBye
    lda mLevelOneBossTimer
    cmp #10
    beq _animate
    inc mLevelOneBossTimer
    rts
_animate
    stz mLevelOneBossTimer
    lda mLevelOneBossObjectFrame
    cmp #0
    beq _frame0
    cmp #1
    beq _frame1
    cmp #2
    beq _frame2
    cmp #3
    beq _frame3
    cmp #4
    beq _frame4
    cmp #5
    beq _frame5
    cmp #6
    beq _reset
    rts
_frame0
    jsr _frameOneExplode0
    inc mLevelOneBossObjectFrame
    rts
_frame1
    jsr _frameOneExplode1
    inc mLevelOneBossObjectFrame
    rts
_frame2
    jsr _frameOneExplode2
    inc mLevelOneBossObjectFrame
    rts
_frame3
    jsr _frameOneExplode3
    inc mLevelOneBossObjectFrame
    rts
_frame4
    jsr _frameOneExplode4
    inc mLevelOneBossObjectFrame
    rts
_frame5
    jsr _frameOneExplode5
    inc mLevelOneBossObjectFrame
    rts
_reset
    lda #spBossNumber00
    jsr setSpriteNumber
    jsr hideSprite

    lda #spBossNumber01
    jsr setSpriteNumber
    jsr hideSprite

    lda #spBossNumber02
    jsr setSpriteNumber
    jsr hideSprite

    lda #spBossNumber03
    jsr setSpriteNumber
    jsr hideSprite

    lda #spBossNumber04
    jsr setSpriteNumber
    jsr hideSprite

    lda #spBossNumber05
    jsr setSpriteNumber
    jsr hideSprite

    stz mLevelOneBossTimer
    inc mLevelOneBossState
    rts

_frameOneExplode0
    #showSpriteMacro spBossNumber00, spExplosionfr0, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr1, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr2, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr2, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr1, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr0, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts
_frameOneExplode1
    #showSpriteMacro spBossNumber00, spExplosionfr1, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr2, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr1, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr1, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr2, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr1, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts
_frameOneExplode2
    #showSpriteMacro spBossNumber00, spExplosionfr2, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr1, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr0, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr0, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr1, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr2, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts
_frameOneExplode3
    #showSpriteMacro spBossNumber00, spExplosionfr2, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr0, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr1, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr1, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr0, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr2, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts
_frameOneExplode4
    #showSpriteMacro spBossNumber00, spExplosionfr1, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr1, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr2, mLevelOneBossX1, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr2, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr1, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr1, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts
_frameOneExplode5
    #showSpriteMacro spBossNumber00, spExplosionfr0, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber01, spExplosionfr2, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber02, spExplosionfr1, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber03, spExplosionfr1, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber04, spExplosionfr0, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    #showSpriteMacro spBossNumber05, spExplosionfr0, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L1C2, objectActive
    rts

handleLevelOneBossEnamyLaser0
    lda mEnemyLaserActive00
    cmp #objectActive
    beq _move
    lda #objectActive
    sta mEnemyLaserActive00
    ;#initEnemyLaserMacro mEnemyLaserActive00, mLevelOneBossObjectState, mLevelOneBossX4, mLevelOneBossY4
    ;#initEnemyLaserMacro mEnemyLaserActive00, mEnemy0, mEnemyLaserX00, mEnemyLaserY00

    lda mLevelOneBossX4
    sta mEnemyLaserX00
    lda mLevelOneBossX4 + 1
    sta mEnemyLaserX00 + 1

    lda mLevelOneBossY4
    sta mEnemyLaserY00
    lda mLevelOneBossY4 + 1
    sta mEnemyLaserY00 + 1
    rts
_move
    jsr moveEnemyLaser0
    rts

handleBossHit
    LDA mLevelOneBossState
    cmp #levelOneBossStateStart
    beq _checkStrength
    rts
_checkStrength
    lda mLevelOneBossStrength
    cmp #0
    bne _recordHit
    inc mLevelOneBossState
    stz mLevelOneBossTimer
    lda #objectDisabled
    sta mLevelOneBossBombActive0
    sta mLevelOneBossBombActive1

    lda #spEnemyLaserNumber11
    jsr setSpriteNumber
    jsr hideSprite

    lda #spEnemyLaserNumber10
    jsr setSpriteNumber
    jsr hideSprite

    lda #spEnemyLaserNumber00
    jsr setSpriteNumber
    jsr hideSprite
    rts
_recordHit
    lda mLevelOneBossObjectState
    cmp #objectCollided
    beq _ani
    rts
_ani
    lda mLevelOneBossObjectFrame
    cmp #0
    beq _frame0
    cmp #1
    beq _frame1
    cmp #2
    beq _frame2
    cmp #3
    jsr _reset
    rts
_frame0
    #showSpriteMacro spBossNumberExplosion, spExplosionfr0, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    inc mLevelOneBossObjectFrame
    rts
_frame1
    #showSpriteMacro spBossNumberExplosion, spExplosionfr1, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    inc mLevelOneBossObjectFrame
    rts
_frame2
    #showSpriteMacro spBossNumberExplosion, spExplosionfr0, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L1C2, objectActive
    inc mLevelOneBossObjectFrame
    rts
_reset
    stz mLevelOneBossObjectFrame
    lda #spBossNumberExplosion
    jsr setSpriteNumber
    jsr hideSprite

    lda #objectActive
    sta mLevelOneBossObjectState
    dec mLevelOneBossStrength

    rts

handleLevelOneBossBoss
    lda mLevelOneBossDirection
    cmp #bossDirectionLeft
    beq _moveBossLeft
    cmp #bossDirectionRight
    beq _moveBossRight
    rts
_moveBossLeft
    jsr levelOneMoveBossLeft
    rts
_moveBossRight
    jsr levelOneMoveBossRight
    rts

levelOneMoveBossLeft
    lda mLevelOneBossX0 + 1
    cmp #1
    beq _move
    lda mLevelOneBossX0
    cmp #34
    bcs _move
    lda #bossDirectionRight
    sta mLevelOneBossDirection
    jsr levelOneMoveBossYaxis
    rts
_move
    #subtractMacro mLevelOneBossX0,3
    #subtractMacro mLevelOneBossX1,3
    #subtractMacro mLevelOneBossX2,3
    #subtractMacro mLevelOneBossX3,3
    #subtractMacro mLevelOneBossX4,3
    #subtractMacro mLevelOneBossX5,3
    rts

levelOneMoveBossRight
    lda mLevelOneBossX0 + 1
    cmp #1
    bne _move
    lda mLevelOneBossX0
    cmp #$0e
    bcc _move
    lda #bossDirectionLeft
    sta mLevelOneBossDirection
    jsr levelOneMoveBossYaxis
    rts
_move
    #addMacro mLevelOneBossX0,3
    #addMacro mLevelOneBossX1,3
    #addMacro mLevelOneBossX2,3
    #addMacro mLevelOneBossX3,3
    #addMacro mLevelOneBossX4,3
    #addMacro mLevelOneBossX5,3
    rts

levelOneMoveBossYaxis
    lda mLevelOneBossDirectionY
    cmp #bossDirectionDown
    beq _moveDown
    bra _moveUp
    rts
_moveUp
    lda mLevelOneBossY0
    cmp #$3b
    bcs _continueUp
    lda #bossDirectionDown
    sta mLevelOneBossDirectionY
    rts
_continueUp
    #subtractMacro mLevelOneBossY0, 2
    #subtractMacro mLevelOneBossY1, 2
    #subtractMacro mLevelOneBossY2, 2
    #subtractMacro mLevelOneBossY3, 2
    #subtractMacro mLevelOneBossY4, 2
    #subtractMacro mLevelOneBossY5, 2
    rts
_moveDown
    lda mLevelOneBossY0
    cmp #$55
    bcc _continueDown
    lda #bossDirectionUp
    sta mLevelOneBossDirectionY
    rts
_continueDown
    #addMacro mLevelOneBossY0, 2
    #addMacro mLevelOneBossY1, 2
    #addMacro mLevelOneBossY2, 2
    #addMacro mLevelOneBossY3, 2
    #addMacro mLevelOneBossY4, 2
    #addMacro mLevelOneBossY5, 2
    rts
handleLevelOneBossBomb0
    lda mLevelOneBossBombPath0
    cmp #110
    beq _reset
    lda mLevelOneBossBombPathPtr0
    sta POINTER_SPR_X
    lda mLevelOneBossBombPathPtr0 + 1
    sta POINTER_SPR_X  + 1

    lda #objectActive
    sta mLevelOneBossBombActive0
    sta mEnemyLaserActive11

    ldy #0
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombX0
    sta mEnemyLaserX11
    stz mLevelOneBossBombX0 + 1
    stz mEnemyLaserX11 + 1
    iny
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombY0
    sta mEnemyLaserY11

    lda mLevelOneBossBombPathPtr0
    clc
    adc #2
    sta mLevelOneBossBombPathPtr0

    lda mLevelOneBossBombPathPtr0 + 1
    adc #0
    sta mLevelOneBossBombPathPtr0 + 1

    #showSpriteMacro spEnemyLaserNumber11, spEnemyLaserOrange, mLevelOneBossBombX0, mLevelOneBossBombY0, SPRITE24L1C2, mEnemyLaserActive11
    inc mLevelOneBossBombPath0
    rts
_reset
    stz mLevelOneBossBombActive0
    ;lda #<mBossBombPath0
    ;sta mLevelOneBossBombPathPtr0
    ;lda #>mBossBombPath0 + 1
    ;sta mLevelOneBossBombPathPtr0  + 1
    stz  mLevelOneBossBombPath0
    rts

handleLevelOneBossBomb1
    lda mLevelOneBossBombPath1
    cmp #110
    bcs _reset
    lda #objectActive
    sta mLevelOneBossBombActive1
    lda mLevelOneBossBombPathPtr1
    sta POINTER_SPR_X
    lda mLevelOneBossBombPathPtr1 + 1
    sta POINTER_SPR_X + 1

    ldy #0
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombX1
    sta mEnemyLaserX10
    iny
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombX1 + 1
    sta mEnemyLaserX10 + 1
    iny
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombY1
    sta mEnemyLaserY10
    iny
    lda (POINTER_SPR_X),y
    sta mLevelOneBossBombY1 + 1
    sta mEnemyLaserY10 + 1

    lda mLevelOneBossBombPathPtr1
    clc
    adc #4
    sta mLevelOneBossBombPathPtr1

    lda mLevelOneBossBombPathPtr1 + 1
    adc #0
    sta mLevelOneBossBombPathPtr1 + 1
    #showSpriteMacro spEnemyLaserNumber10, spEnemyLaserOrange, mEnemyLaserX10, mEnemyLaserY10, SPRITE24L1C2, mEnemyLaserActive10
    ;#macroShowSprite spEnemyLaserNumber10, spEnemyLaserOrange, mLevelOneBossBombX1, mLevelOneBossBombX1 + 1, mLevelOneBossBombY1, SPRITE24L1C2
    inc mLevelOneBossBombPath1
    rts
_reset
    lda #objectInactive
    sta mLevelOneBossBombActive1
   ; lda #<mBossBombPath1
   ; sta mLevelOneBossBombPathPtr1
   ; lda #>mBossBombPath1 + 1
   ; sta mLevelOneBossBombPathPtr1  + 1
    stz  mLevelOneBossBombPath1
    rts

handleLevelOneBossBomb2
    lda mEnemyLaserActive09
    cmp #objectActive
    beq _move
    lda  #objectActive
    sta mEnemyLaserActive09

    lda #50
    sta mEnemyLaserX09
    stz mEnemyLaserX09 + 1

    lda #240
    sta mEnemyLaserY09
    stz mEnemyLaserY09 + 1
    rts
_move
    lda mEnemyLaserY09
    cmp #32
    beq _reset
    dec mEnemyLaserY09
    #showSpriteMacro spEnemyLaserNumber09, spEnemyLaserOrange, mEnemyLaserX09, mEnemyLaserY09, SPRITE24L1C2, mEnemyLaserActive09
    rts
_reset
    lda #objectInactive
    sta mEnemyLaserActive09
    rts

handleLevelOneBossBomb3
    lda mEnemyLaserActive08
    cmp #objectActive
    beq _move
    lda  #objectActive
    sta mEnemyLaserActive08

    lda #$4A
    sta mEnemyLaserX08
    lda #1
    sta mEnemyLaserX08 + 1

    lda #240
    sta mEnemyLaserY08
    stz mEnemyLaserY08 + 1
    rts
_move
    lda mEnemyLaserY08
    cmp #32
    beq _reset
    dec mEnemyLaserY08
    #showSpriteMacro spEnemyLaserNumber08, spEnemyLaserOrange, mEnemyLaserX08, mEnemyLaserY08, SPRITE24L1C2, mEnemyLaserActive08
    rts
_reset
    lda #objectInactive
    sta mEnemyLaserActive08
    rts

startBattle
    jsr handlePlayer
    jsr playerLaserMove
    jsr playerFireDelayTimer
    rts
resetLevelOneBossState
    lda #levelOneBossStateinit
    sta mLevelOneBossState
    rts

initLevelOneBoss
    lda #100
    sta mLevelOneBossTimer

    lda #levelOneBossXStart
    sta mLevelOneBossX0
    sta mLevelOneBossX3
    lda #levelOneBossXStart + 24
    sta mLevelOneBossX1
    sta mLevelOneBossX4
    lda #levelOneBossXStart + 24 + 24
    sta mLevelOneBossX2
    sta mLevelOneBossX5

    lda #0
    sta mLevelOneBossY0 + 1
    sta mLevelOneBossY1 + 1
    sta mLevelOneBossY2 + 1
    sta mLevelOneBossY3 + 1
    sta mLevelOneBossY4 + 1
    sta mLevelOneBossY5 + 1
    lda #levelOneBossYStart
    sta mLevelOneBossY0
    sta mLevelOneBossY1
    sta mLevelOneBossY2

    lda #levelOneBossYStart + 24
    sta mLevelOneBossY3
    sta mLevelOneBossY4
    sta mLevelOneBossY5

    lda #bossDirectionLeft
    sta mLevelOneBossDirection

    lda #bossDirectionDown
    sta mLevelOneBossDirectionY

    lda #levelOneBossStrength
    sta mLevelOneBossStrength

    lda #objectInactive
    sta mLevelOneBossObjectState
    sta mEnemyLaserActive00
    stz mLevelOneBossObjectFrame

    jsr levelOneShowBoss

    stz mLevelOneBossBombPath0
    stz mLevelOneBossBombActive0
  ;  lda #<mBossBombPath0
  ;  sta mLevelOneBossBombPathPtr0
  ;  lda #>mBossBombPath0 + 1
  ;  sta mLevelOneBossBombPathPtr0  + 1

    stz mLevelOneBossBombPath1
    stz mLevelOneBossBombActive1
  ;  lda #<mBossBombPath1
  ;  sta mLevelOneBossBombPathPtr1
  ;  lda #>mBossBombPath1 + 1
  ;  sta mLevelOneBossBombPathPtr1  + 1
    rts

levelOneBossIntro
    lda mLevelOneBossTimer
    cmp #0
    beq _endIntro
    dec mLevelOneBossTimer
    inc mLevelOneBossY0
    inc mLevelOneBossY1
    inc mLevelOneBossY2
    inc mLevelOneBossY3
    inc mLevelOneBossY4
    inc mLevelOneBossY5
    jsr levelOneShowBoss
    rts
_endIntro
    inc mLevelOneBossState
    lda #objectActive
    sta mLevelOneBossObjectState
    rts

levelOneShowBoss
    jsr levelOneShowBoss0
    jsr levelOneShowBoss1
    jsr levelOneShowBoss2
    jsr levelOneShowBoss3
    jsr levelOneShowBoss4
    jsr levelOneShowBoss5
    rts

levelOneShowBoss0
    lda mLevelOneBossY0
    cmp #190
    bcc _show
    rts
_show
     #showSpriteMacro spBossNumber00, spBoss1part0, mLevelOneBossX0, mLevelOneBossY0, SPRITE24L0C2, objectActive
    rts
levelOneShowBoss1
    lda mLevelOneBossY1
    cmp #190
    bcc _show
    rts
_show
    #showSpriteMacro spBossNumber01, spBoss1part1, mLevelOneBossX1, mLevelOneBossY1, SPRITE24L0C2, objectActive
    rts
levelOneShowBoss2
    lda mLevelOneBossY2
    cmp #190
    bcc _show
    rts
_show
    #showSpriteMacro spBossNumber02, spBoss1part2, mLevelOneBossX2, mLevelOneBossY2, SPRITE24L0C2, objectActive
    rts
levelOneShowBoss3
    lda mLevelOneBossY3
    cmp #190
    bcc _show
    rts
_show
    #showSpriteMacro spBossNumber03, spBoss1part3, mLevelOneBossX3, mLevelOneBossY3, SPRITE24L0C2, objectActive
    rts
levelOneShowBoss4
    lda mLevelOneBossY4
    cmp #190
    bcc _show
    rts
_show
    #showSpriteMacro spBossNumber04, spBoss1part4, mLevelOneBossX4, mLevelOneBossY4, SPRITE24L0C2, objectActive
    rts
levelOneShowBoss5
    lda mLevelOneBossY5
    cmp #190
    bcc _show
    rts
_show
    #showSpriteMacro spBossNumber05, spBoss1part5, mLevelOneBossX5, mLevelOneBossY5, SPRITE24L0C2, objectActive
    rts

.endsection

.section variables
levelOneBossStateinit = 0
levelOneBossStateIntro = 1
levelOneBossStateStart = 2
levelOneBossStateBossByeBye = 3
levelOneBossClear = 4

levelOneBossStrength = 20

bossDirectionLeft = 1
bossDirectionRight = 2
bossDirectionUp = 1
bossDirectionDown = 2

levelOneBossXStart = 150
levelOneBossYStart = $ff - 40

mLevelOneBossState
    .byte $00
mLevelOneBossTimer
    .byte $00
mLevelOneBossDirection
    .byte $00
mLevelOneBossDirectionY
    .byte $00
mLevelOneBossStrength
    .byte $00
mLevelOneBossHitRecorded
    .byte $00

mLevelOneBossObjectState
    .byte $00
mLevelOneBossObjectFrame
    .byte $00, $00

mLevelOneBossExplosionX
    .byte $00, $00
mLevelOneBossExplosionY
    .byte $00, $00

mLevelOneBossX0
    .byte $00,$00
mLevelOneBossX1
    .byte $00,$00
mLevelOneBossX2
    .byte $00,$00
mLevelOneBossX3
    .byte $00,$00
mLevelOneBossX4
    .byte $00,$00
mLevelOneBossX5
    .byte $00,$00
mLevelOneBossY0
    .byte $00,$00
mLevelOneBossY1
    .byte $00,200
mLevelOneBossY2
    .byte $00,$00
mLevelOneBossY3
    .byte $00,$00
mLevelOneBossY4
    .byte $00,$00
mLevelOneBossY5
    .byte $00,$00

mLevelOneBossBombPathPtr0
    .byte $00,$00
mLevelOneBossBombX0
    .byte $00,$00
mLevelOneBossBombY0
    .byte $00,$00
mLevelOneBossBombActive0
    .byte $00
mLevelOneBossBombPath0
    .byte $00

mLevelOneBossBombPathPtr1
    .byte $00,$00
mLevelOneBossBombX1
    .byte $00,$00
mLevelOneBossBombY1
    .byte $00,$00
mLevelOneBossBombActive1
    .byte $00
mLevelOneBossBombPath1
    .byte $00
.endsection
