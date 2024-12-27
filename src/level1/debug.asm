debug
    lda #2
    sta MMU_IO_CTRL

    lda enemy_delay
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C000

    lda enemy_delay
    and #$0F
     tay
    lda mHex, y
    sta $C001

    lda enemy_delay
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C002

    lda enemy_delay
    and #$0F
     tay
    lda mHex, y
    sta $C003
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mEnemyLaserActive00
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C006

    lda mEnemyLaserActive00
    and #$0F
    tay
    lda mHex, y
    sta $C007

    lda mEnemyLaserActive00
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C008

    lda mEnemyLaserActive00
    and #$0F
    tay
    lda mHex, y
    sta $C009

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda mEnemyLaserY00 + 1
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C000 + 40

    lda mEnemyLaserY00 + 1
    and #$0F
     tay
    lda mHex, y
    sta $C001 + 40

    lda mEnemyLaserY00
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C002 + 40

    lda mEnemyLaserY00
    and #$0F
     tay
    lda mHex, y
    sta $C003 + 40

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mLayerZeroTile
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C006 + 40

    lda mLayerZeroTile
    and #$0F
    tay
    lda mHex, y
    sta $C007 + 40

    lda mLayerZeroTile
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C008 + 40

    lda mLayerZeroTile
    and #$0F
    tay
    lda mHex, y
    sta $C009 + 40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mLayerZeroTile
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C006 + 80

    lda mLayerZeroTile
    and #$0F
    tay
    lda mHex, y
    sta $C007 + 80

    lda mLayerZeroTile
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C008 + 80

    lda mLayerZeroTile
    and #$0F
    tay
    lda mHex, y
    sta $C009 + 80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    lda #0
    sta  MMU_IO_CTRL

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    rts


mDebug1
    .byte $00

mHex
    .text '0123456789ABCDEF'