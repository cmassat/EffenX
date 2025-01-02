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

;----------------------------------
; Level One Game Loop
;----------------------------------
levelOnePlay
    jsr handleLevelOneScroll
    jsr levelOnePlayerWasHit
    jsr handleShipDelay
   
    jsr handlePlayer
    jsr playerLaserMove
    jsr playerFireDelayTimer

    jsr handleEnemy
    ;jsr playerCollidedWithEnemy
    ;jsr handleEnemyLaserCollision
    jsr enemyHit
    jsr handleScore
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
     jsr resetEnemies
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
    lda #255 -20
    sta mLayerZeroTile
    jsr resetEnemies
    lda #1
    sta mResetBoard
    stz mEnemeyDelay
    stz mEnemeyDelay + 1
    rts

handleShipDelay
    lda mResetBoard
    cmp #1
    beq _resetEnemyShips
    rts
_resetEnemyShips
    lda mEnemeyDelay
    clc
    adc #1
    sta mEnemeyDelay

    lda mEnemeyDelay + 1
    adc #0
    sta mEnemeyDelay + 1

    lda mEnemeyDelay + 1
    cmp #0
    beq _checkFirstWaves
    rts
_checkFirstWaves
    lda mEnemeyDelay
    cmp #60
    beq _launchWave1
    cmp #120
    beq _launchWave2
    cmp #180
    beq _launchWave3
    rts
_launchWave1
    lda #objectInactive
    sta mEnemy0
    sta mEnemyLaserActive00
    sta mEnemy1
    sta mEnemyLaserActive01
    rts
_launchWave2
    jsr clearScreenMemory
    lda #objectInactive
    sta mEnemy2
    sta mEnemyLaserActive02
    sta mEnemy3
    sta mEnemyLaserActive03
    jsr clearScreenMemory
    rts
_launchWave3
    lda #objectInactive
    sta mEnemy4
    sta mEnemyLaserActive04
    lda #objectInactive
    sta mEnemy7
    sta mEnemyLaserActive07
    stz mResetBoard
    
    rts
.endsection

.include "init.asm"
.include "debug.asm"


.section variables
levelOneLayerOneSpeed = 2
levelOneStateInit = 0
levelOneStateReady = 1
levelOneStateWait = 2
levelOneStatePlay = 3
levelOneStatePlayerHit = 4
levelOneStateBossTime = 5
skipEver3 = 3
skipEver2 = 2

mLevelOneState
    .byte $00
mLevelOnePixel
    .byte $00
mLevelOneTile
    .byte 255 -20


mLayerZeroPixel
    .byte $00
mLayerZeroTile
    .byte 255 -20

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