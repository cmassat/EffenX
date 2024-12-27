.section code
play_splash
    jsr fmLoadSplash
    jsr mmu_init ; initialize MMU library
    lda #<data_addr
    sta mmu_seekaddr
    lda #>data_addr
    sta mmu_seekaddr+1
    lda #`data_addr
    sta mmu_seekaddr+2
    jsr mmu_seek
    jsr init_vgm
    jsr vgm_start
    jsr vgm_play
    rts

play_lvl1
    jsr fmLoadLvl1
    jsr mmu_init ; initialize MMU library
    lda #<data_addr
    sta mmu_seekaddr
    lda #>data_addr
    sta mmu_seekaddr+1
    lda #`data_addr
    sta mmu_seekaddr+2
    jsr mmu_seek
    jsr init_vgm
    jsr vgm_start
    jsr vgm_play
    rts

fmLoadSplash
    lda #<mFMSplashFileName
    ldx #>mFMSplashFileName
    ldy #$08
    jsr fopen
    rts

fmLoadLvl1
    lda #<mFMLvl1FileName
    ldx #>mFMLvl1FileName
    ldy #$08
    jsr fopen
    rts
.endsection

.section variables
mFMSplashFileName
    .text '/aurora/splash.mus', $00
mFMLvl1FileName
    .text '/aurora/lvl1.mus', $00
.endsection