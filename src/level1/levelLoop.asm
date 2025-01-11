.include "enemies.asm"
.include "macros.asm"
.include "waves.asm"
.include "wave1.asm"
.include "wave2.asm"
.include "wave3.asm"
.include "init.asm"
.include "debug.asm"
.section code
handleLevelOne
    lda #stateLvl1
    jsr isState
    bcc _execute
    rts
_execute
    lda mLevelOneState
    cmp #levelOneStateInit
    beq _init
    cmp #levelOneStateReady
    beq _ready
    cmp #levelOneStateWait
    beq _waitForKey
    cmp #levelOneStatePlay
    beq levelOnePlay
    cmp #levelOneStateBossTime
    beq _bossTime
    cmp #levelOneStateLostLife
    beq _lostLife
    rts
_init
    inc mLevelOneState
    jsr initLevelOne
    jsr play_lvl1

    rts
_ready
    jsr LevelOneReady
    inc mLevelOneState
    rts
_waitForKey
    lda mAnyKey
    cmp #1
    bne _yes
    rts
_yes
    jsr resetControls
    stz mAnyKey
    stz v_sync
    jsr clearScreenMemory
    inc mLevelOneState
    lda #objectActive
    sta mPlayerStatus

    jsr levelOneresetMap
    jsr levelOneStart
    rts
_bossTime
    jsr handleLevelOneBossBattle
    rts
_lostLife
   
    jsr isAnyKeyPressed
    bcc _startAgain
    rts
_startAgain
    lda #levelOneStatePlay
    sta mLevelOneState
    rts
;----------------------------------
; Level One Game Loop
;----------------------------------
levelOnePlay
    jsr initEnemyLaser5
    jsr moveEnemyLaser5

    jsr initEnemyLaser6
    jsr moveEnemyLaser6

    jsr initEnemyLaser7
    jsr moveEnemyLaser7

    jsr initEnemyLaser8
    jsr moveEnemyLaser8

    jsr initEnemyLaser8
    jsr moveEnemyLaser8

    ;jsr handleEnemies
    jsr player1ShowShield
    jsr handleLevelOneScroll
    jsr levelOnePlayerWasHit
    jsr handleLevelOneWaves

    jsr handleMiniBoss
    jsr handlePlayer

    jsr levelOneMoveEnemies
    jsr playerCollidedWithEnemy
    jsr playerLaserCollide
    jsr handleEnemyLaserCollision
    jsr enemyHit
    jsr handlePowerUp

    jsr handleScore
    ;jsr hideDisabledEnemies
    ;jsr hideDisabledEnemyLasers    
    jsr hideEnemyLasers
    jsr miniBossActivateLaser
    jsr miniBossMoveLaser
    jsr miniBossMoveLaser
    
    
    rts

handleLevelOneScroll
    jsr isPlayerHit
    bcc _skipScroll
    lda mLayerZeroTile
    cmp #0
    beq _bossTime
    jsr LevelOneLayerZeroScroll
    jsr LevelOneLayerOneScroll
    rts
_skipScroll
    jsr resetEnemies
    rts
_bossTime
    lda #levelOneStateBossTime
    sta mLevelOneState
    rts
levelOnePlayerWasHit
    jsr isPlayerHit
    bcc _resetLevel
    rts
_resetLevel
    jsr LevelOneReady
    jsr levelOneresetMap
    jsr resetEnemies
    jsr deactivateAllLasers
    jsr losePowerUp
    ;lda #levelOneStateLostLife
    ;sta mLevelOneState
     stz mAnyKey
    rts

LevelOneReady
    lda #<mLevelOneHitMessage
    ldx #>mLevelOneHitMessage
    ldy #menuMsgStartLine
    jsr writeText
    rts

LevelOneLayerOneScroll
    lda layerOne_timer
    cmp #0
    bne _move
    lda #skipEver2
    sta layerOne_timer
    rts
_move
    dec layerOne_timer
    lda mLevelOnePixel
    cmp #0
    beq _moveTile
    dec mLevelOnePixel
    bra _scroll
_moveTile
    lda #15
    sta mLevelOnePixel
    dec mLevelOneTile
_scroll
    lda #1
    jsr setTilemapNumber

    lda mLevelOneTile
    ldx mLevelOnePixel

    jsr setTilePositionY
    rts

LevelOneLayerZeroScroll
    lda layerZero_timer
    cmp #0
    bne _move
    lda #skipEver3
    sta layerZero_timer
    rts
_move
    dec layerZero_timer
    lda mLayerZeroPixel
    cmp #0
    beq _moveTile
    dec mLayerZeroPixel
    bra _scroll
_moveTile
    lda #15
    sta mLayerZeroPixel
    dec mLayerZeroTile
_scroll
    lda #0
    jsr setTilemapNumber

    lda mLayerZeroTile
    ldx mLayerZeroPixel

    jsr setTilePositionY
    rts

levelOneStart
    lda #320/2 + 32
    sta mPlayerPosX
    stz mPlayerPosX + 1

    lda #240
    sta mPlayerPosY
    stz mPlayerPosY + 1
    rts

levelOneresetMap
    stz mLayerZeroPixel
    lda #levelOneZeroMapStart
    sta mLayerZeroTile
    jsr resetEnemies
    lda #1
    sta mResetBoard
    stz mEnemeyDelay
    stz mEnemeyDelay + 1

    stz mNewWave
    rts

.endsection



.section variables
levelOneLayerOneSpeed = 2
levelOneStateInit = 0
levelOneStateReady = 1
levelOneStateWait = 2
levelOneStatePlay = 3
levelOneStatePlayerHit = 4
levelOneStateBossTime = 5
levelOneStateLostLife = 6
skipEver3 = 3
skipEver2 = 2

levelOneZeroMapStart = 255 - 20

mLevelOneState
    .byte $00
mLevelOnePixel
    .byte $00
mLevelOneTile
    .byte $00

mLayerZeroPixel
    .byte $00
mLayerZeroTile
    .byte $00

mLayerZeroSpeed
    .byte $00
mLayerOneSpeed
    .byte $00
mLayerTwoSpeed
    .byte $00

layerZero_timer
    .byte $00

layerOne_timer
    .byte $00

mResetBoard
    .byte $0
mEnemeyDelay
    .byte $00, $00

mLevelOneHitMessage
    .text '          Ship Lost In Battle', $00
mLevelOneSpriteRawFileName
    .text '/aurora/sprite.bin', $00

mLevelOneSpritePalFileName
    .text '/aurora/sprite.pal', $00

mLevelOneTileSetRawFileName
    .text '/aurora/tilemap.bin', $00

mLevelOnetileSetPalFileName
    .text '/aurora/tilemap.pal', $00

mLevelOneTileMapBottomFileName
    .text '/aurora/lvl1.map', $00

mLevelOneMapOrganicFileName
    .text '/aurora/foremap.map', $00
mLevelOneText0
    .text '             READY PLAYER 1', $00
.endsection