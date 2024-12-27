.section code
handleLevelOne
    lda #stateLvl1
    jsr isState
    bcc _execute
    rts
_execute
    jsr LevelOneLayerOneScroll 
    lda mLevelOneState
    cmp #levelOneStateInit
    beq _init
    cmp #levelOneStateReady
    beq _ready
    cmp #levelOneStateWait
    beq _waitForKey
    cmp #levelOneStatePlay
    jsr levelOnePlay
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
    cmp #0
    bne _yes
    rts
_yes
    stz mAnyKey
    stz v_sync
    jsr clearScreenMemory
    inc mLevelOneState
    lda #objectActive
    sta mPlayerStatus
    rts

levelOnePlay
    jsr delayEnemyStart
    jsr LevelOneLayerZeroScroll
    jsr handlePlayer
    jsr playerLaserMove
    jsr playerFireDelayTimer
    lda mEnemyActive
    cmp #objectActive
    beq _gameStarted
    rts
_gameStarted
    jsr handleEnemy
    jsr handleEnemyFire
    jsr playerCollidedWithEnemy
    jsr handleEnemyLaserCollision
    jsr enemyHit
    rts


delayEnemyStart
    lda mEnemyActive
    cmp #objectActive
    bne _wait
    dec enemy_delay
    jsr delayShipStart0
    jsr delayShipStart2
    jsr delayShipStart3
    jsr delayShipStart4
    jsr delayShipStart5
    jsr delayShipStart6
    jsr delayShipStart7
    jsr delayShipStart8
    jsr delayShipStart9
    jsr delayShipStart10
    jsr delayShipStart11
    rts
_wait
    dec enemy_delay
    lda enemy_delay
    cmp #0
    beq _start
    rts
_start
    stz v_sync
    lda #objectActive
    sta mEnemyActive
    stz enemy_delay
    rts

delayShipStart0
    lda mEnemy0
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #59
    beq _activate
    rts 
_activate
    stz mEnemy0
    rts 
delayShipStart1
    lda mEnemy1
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #59
    beq _activate
    rts 
_activate
    stz mEnemy1
    rts

delayShipStart2
    lda mEnemy2
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #49
    beq _activate
    rts 
_activate
    stz mEnemy2
    rts
delayShipStart3
    lda mEnemy3
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #49
    beq _activate
    rts 
_activate
    stz mEnemy3
    rts
delayShipStart4
    lda mEnemy4
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #39
    beq _activate
    rts 
_activate
    stz mEnemy4
    rts

delayShipStart5
    lda mEnemy5
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #39
    beq _activate
    rts 
_activate
    stz mEnemy5
    rts

delayShipStart6
    lda mEnemy6
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #29
    beq _activate
    rts 
_activate
    stz mEnemy6
    rts

delayShipStart7
    lda mEnemy7
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #29
    beq _activate
    rts 
_activate
    stz mEnemy7
    rts


delayShipStart8
    lda mEnemy8
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #19
    beq _activate
    rts 
_activate
    stz mEnemy8
    rts

delayShipStart9
    lda mEnemy9
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #19
    beq _activate
    rts 
_activate
    stz mEnemy9
    rts

delayShipStart10
    lda mEnemy10
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #9
    beq _activate
    rts 
_activate
    stz mEnemy10
    rts

delayShipStart11
    lda mEnemy11
    cmp #objectWait
    beq _waitToReset
    rts
_waitToReset
    lda enemy_delay
    cmp #9
    beq _activate
    rts 
_activate
    stz mEnemy11
    rts

loadLevelOneSpriteRaw
    lda #<mLevelOneSpriteRawFileName
    ldx #>mLevelOneSpriteRawFileName
    ldy #spObjectsBank
    jsr fopen
    rts 

loadLevelOneSpritePal
    lda #<mLevelOneSpritePalFileName
    ldx #>mLevelOneSpritePalFileName
    ldy #$05
    jsr fopen
    rts 

loadLevelOneTileSetRaw
    lda #<mLevelOneTileSetRawFileName
    ldx #>mLevelOneTileSetRawFileName
    ldy #tileSetBank
    jsr fopen
    rts 

loadLevelOneTileSetPal
    lda #<mLevelOnetileSetPalFileName
    ldx #>mLevelOnetileSetPalFileName
    ldy #$05
    jsr fopen
    rts 

loadLevelOneTileMap
    lda #<mLevelOneTileMapBottomFileName
    ldx #>mLevelOneTileMapBottomFileName
    ldy #tileMapBankBankL1
    jsr fopen
    rts 
lodaLevelOneOrganicMap
    lda #<mLevelOneMapOrganicFileName
    ldx #>mLevelOneMapOrganicFileName
    ldy #tileMapBankBankL0
    jsr fopen
    rts 

LevelOneReady
    lda #<mLevelOneText0
    ldx #>mLevelOneText0
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
    bmi _resetTile 
    bra _scroll
_resetTile
    lda #$ff
    sta mLevelOneTile

_scroll
    lda #1
    jsr setTilemapNumber

    lda mLevelOneTile
    ldx mLevelOnePixel
    
    jsr setTilePositionY
    jsr debug
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
 ;   lda mLayerZeroTile
 ;   cmp #$ff
 ;   beq _resetTile

 ;   bra _scroll
_;resetTile
 ;   lda #$ff
 ;   sta mLayerZeroTile

_scroll
    lda #0
    jsr setTilemapNumber

    lda mLayerZeroTile
    ldx mLayerZeroPixel
    
    jsr setTilePositionY
    jsr debug
    rts

resetLevelOne
    lda #0
    sta mLevelOneState
    sta mLevelOneTile
    sta mLayerZeroSpeed

    lda #15
    sta mLevelOnePixel

    lda #320/2 + 32
    sta mPlayerPosX
    stz mPlayerPosX + 1

    lda #240
    sta mPlayerPosY
    stz mPlayerPosY + 1

    lda #60
    sta enemy_delay
    stz mEnemyActive
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
skipEver3 = 3
skipEver2 = 2

mLevelOneState
    .byte $00
mLevelOnePixel
    .byte $00
mLevelOneTile
    .byte $ff


mLayerZeroPixel
    .byte $00
mLayerZeroTile
    .byte $ff


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

enemy_delay
    .byte 60
mEnemyActive
    .byte $0

mLevelOneSpriteRawFileName
    .text '/aurora/lvl.bin', $00

mLevelOneSpritePalFileName
    .text '/aurora/lvl.pal', $00

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