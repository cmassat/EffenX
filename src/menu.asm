.section code
handleMenu
    lda #stateMenu
    jsr isState
    bcc _execute
    rts
_execute
    lda mMenuState
    cmp #menuStateInit
    beq _initMenu

    cmp #menuStateWait
    beq _waitForKey
    rts
_initMenu
    jsr initMenu
    jsr vgm_on 
    rts 
_waitForKey
    jsr isAnyKeyPressed
    ; lda mAnyKey
    ; cmp #1
    bcc _yes
    rts
_yes
    stz mAnyKey
    jsr nextState
    jsr vgm_stop
    jsr resetScore
    rts


initMenu
    ;jsr resetKeys
    jsr clearVideo
    jsr clearLayers

    jsr loadCharsRaw
    jsr loadCharsPal
    jsr clut_load_1

    jsr loadMenuBackRaw
    jsr loadMenuBackPal
    jsr clut_load_0

    lda #0
    lda <#bitmapStart
    ldx >#bitmapStart
    ldy `#bitmapStart
    jsr setBitmapAddress
    jsr showBitmap
    jsr enableBitmapLayer0

    jsr enableGrafix
    jsr clearScreenMemory
    jsr enableText
    jsr enableSprite
    jsr enableBitmap
    jsr setVideo
    jsr printMenuTitle
    inc mMenuState
    rts

writeMenuText .macro 
    lda #\1
    jsr setSpriteNumber

    lda <#\2
    ldx >#\2
    ldy `#\2
    jsr setSpriteAddress

    lda #<\3
    ldx #>\3
    jsr setSpriteX

    lda #<\4
    ldx #>\4
    jsr setSpriteY

    lda #SPRITE16L0C1
    jsr showSprite
.endmacro


printMenuTitle
   ;lda #0
    ;jsr setSpriteNumber
    #writeMenuText 0, spCharE, col01, row01
    #writeMenuText 1, spCharF, col02, row01
    #writeMenuText 2, spCharF, col03, row01
    #writeMenuText 3, spCharE, col04, row01
    #writeMenuText 4, spCharN, col05, row01
    #writeMenuText 5, spCharX, col07, row01
    lda #<mMenuText0
    ldx #>mMenuText0
    ldy #menuMsgStartLine
    jsr writeText

    lda #<mMenuText1
    ldx #>mMenuText1
    ldy #menuMsgStartLine + 1
    jsr writeText

    lda #<mMenuText2
    ldx #>mMenuText2
    ldy #menuMsgStartLine + 2
    jsr writeText

    lda #<mMenuText3
    ldx #>mMenuText3
    ldy #menuMsgStartLine + 3
    jsr writeText

    lda #<mMenuText4
    ldx #>mMenuText4
    ldy #menuMsgStartLine + 4
    jsr writeText

    lda #<mMenuText5
    ldx #>mMenuText5
    ldy #menuMsgStartLine + 5
    jsr writeText

    lda #<mMenuText6
    ldx #>mMenuText6
    ldy #menuMsgStartLine + 6
    jsr writeText
    
    lda #<mMenuText7
    ldx #>mMenuText7
    ldy #menuMsgStartLine + 7
    jsr writeText

    lda #<mMenuText8
    ldx #>mMenuText8
    ldy #menuMsgStartLine + 8
    jsr writeText

    lda #<mMenuText9
    ldx #>mMenuText9
    ldy #menuMsgStartLine + 9
    jsr writeText

    lda #<mMenuText10
    ldx #>mMenuText10
    ldy #menuMsgStartLine + 10
    jsr writeText

    lda #<mMenuText11
    ldx #>mMenuText11
    ldy #menuMsgStartLine + 12
    jsr writeText

    lda #<mMenuText12
    ldx #>mMenuText12
    ldy #menuMsgStartLine + 13
    jsr writeText
    rts

loadCharsRaw
    lda #<mMenuRawFileName
    ldx #>mMenuRawFileName
    ldy #spCharBank
    jsr fopen
    rts 

loadCharsPal
    lda #<mMenuhPalFileName
    ldx #>mMenuhPalFileName
    ldy #$05
    jsr fopen
    rts 

loadMenuBackRaw
    lda #<mMenuBackRawFileName
    ldx #>mMenuBackRawFileName
    ldy #bitmapBank
    jsr fopen
    rts 

loadMenuBackPal
    lda #<mMenuBackPalFileName
    ldx #>mMenuBackPalFileName
    ldy #$05
    jsr fopen
    rts 

loadMenuFont
    lda #<mMenuBackPalFileName
    ldx #>mMenuBackPalFileName
    ldy #$05
    jsr fopen
    rts 



resetMenu
    stz mMenuState
    rts
.endsection

.section variables
menuStateInit = 0
menuStateWait = 1
menuMsgStartLine = 5
mMenuState
    .byte $00

mMenuRawFileName
    .text '/aurora/char.bin', $00

mMenuhPalFileName
    .text '/aurora/char.pal', $00
mMenuBackRawFileName
    .text '/aurora/menu.bin', $00

mMenuBackPalFileName
    .text '/aurora/menu.pal', $00

mMenuText0
    .text '   You are the last line of defense', $00
mMenuText1
    .text ' against an alien armada threatening', $00
mMenuText2
    .text ' the galaxy. Armed with your trusty', $00
mMenuText3
    .text ' starfighter, navigate asteroid fields,', $00
mMenuText4
    .text ' dodge enemy lasers, and unleash a', $00
mMenuText5
    .text ' barrage of pixel-perfect firepower.', $00
mMenuText6
    .text ' With every wave of enemies defeated, ', $00
mMenuText7
    .text ' the challenge intensifies. Do you have', $00
mMenuText8
    .text ' what it takes to save the galaxy and ', $00
mMenuText9
    .text ' cement your place as a legendary space ', $00
mMenuText10
    .text ' pilot?', $00
mMenuText11
    .text '      The stars are calling.', $00 
mMenuText12
    .text '      Its time to take flight!', $00



.endsection