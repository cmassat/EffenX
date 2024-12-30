.section code
initLevelOne
    jsr clearScreenMemory
    jsr hideAllSprites
    jsr resetEnemies
    lda #0
   
   
_sprites
    jsr loadLevelOneSpriteRaw
    jsr loadLevelOneSpritePal
    jsr clut_load_2


_tileSet
    jsr loadLevelOneTileSetRaw
    jsr loadLevelOneTileSetPal
    jsr clut_load_3

    lda #0
    jsr setTileSetNumber
    lda <#tileSetStart
    ldx >#tileSetStart
    ldy `#tileSetStart
    jsr setTileSetAddress

    
_tileMap
    jsr loadLevelOneTileMap
    jsr lodaLevelOneOrganicMap
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #1
    jsr setTileMapNumber
    lda <#tileMapStartL1
    ldx >#tileMapStartL1
    ldy `#tileMapStartL1
    jsr setTileMapAddress
    lda #22
    ldx #$ff
    jsr setTileSize
    jsr showTileMap1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0
    jsr setTileMapNumber
    lda <#tileMapStartL0
    ldx >#tileMapStartL0
    ldy `#tileMapStartL0
    jsr setTileMapAddress
    Lda #22
    ldx #$ff
    jsr setTileSize
    jsr showTileMap0
    
_defaultMapStart    
    lda #0
    jsr setTilemapNumber
    lda mLayerZeroTile
    ldx mLayerZeroPixel
    jsr setTilePositionY

    lda #1
    jsr setTilemapNumber
    lda mLayerZeroTile
    ldx mLayerZeroPixel
    jsr setTilePositionY

_vickyCtrl
    jsr setTileMapLayer0
    jsr setTileMapLayer1
    jsr setLayers
    jsr enableGrafix    
    jsr enableText
    jsr enableSprite
    jsr enableTile
    jsr setVideo
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
.endsection