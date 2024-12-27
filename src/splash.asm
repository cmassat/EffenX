.section code
handleSplash
    lda #stateSplash
    jsr isState
    bcc _runSplash
    rts
_runSplash
    lda mSplashState
    cmp #splashStateInit
    beq _initSplash
    cmp #splashStateWait
    beq _waitForKey
    rts 
_initSplash
    inc mSplashState
    jsr initSplash
    jsr play_splash
    rts
_waitForKey
    lda mAnyKey
    cmp #0
    bne _yes
    rts
_yes
    stz mAnyKey
    jsr nextState
    jsr vgm_stop
    rts

initSplash
    jsr clearVideo
    jsr clearLayers
    jsr loadSplashRaw
    jsr enableBitmapLayer0
    jsr enableGrafix
    jsr enableBitmap

    jsr enableText
    jsr setVideo
    stz MMU_IO_CTRL
    jsr loadSplashPal
    jsr clut_load_0
    lda #0
    jsr setBitmapNumber
    lda <#bitmapStart
    ldx >#bitmapStart
    ldy `#bitmapStart
    jsr setBitmapAddress
    jsr showBitmap
    rts

loadSplashRaw
    lda #<mSplashRawFileName
    ldx #>mSplashRawFileName
    ldy #bitmapBank
    jsr fopen
    rts 

loadSplashPal
    lda #<mSplashPalFileName
    ldx #>mSplashPalFileName
    ldy #$05
    jsr fopen
    rts 

resetSplash
    stz mSplashState
    rts
.endsection

.section variables
splashStateInit = 0
splashStateWait = 1
mSplashState
    .byte $00
mSplashRawFileName
    .text '/aurora/splash.bin', $00

mSplashPalFileName
    .text '/aurora/splash.pal', $00
.endsection

