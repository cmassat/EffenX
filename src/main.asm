*=$1000
.dsection variables

*=$2000
.dsection code 
.section code
start
    jmp main

main
    stz MMU_IO_CTRL
    lda #$01
    sta VKY_BKG_COL_B
    sta VKY_BKG_COL_R
    sta VKY_BKG_COL_G
    jsr resetLevelOne
    jsr initEvents
    jsr InitState
    jsr resetEnemies
    jsr setFrameTimer
    jsr handleEvents
    
    jsr initSplash
_gameLoop
    nop
    jmp _gameLoop
    rts

.endsection
.include "./inc/gameconst.asm"
.include './inc/vgmConstants.asm'
.include "./inc/f256k.asm"
.include "./inc/kernel.asm"
.include "./inc/file_util.asm"
.include "./api/api_sprite.asm"
.include "./api/api_keyboard.asm"
.include "./api/api_text.asm"
.include "./api/api_clut.asm"
.include "./api/api_video.asm"
.include "./api/api_bitmap.asm"
.include "./api/api_map.asm"
.include "./api/api_mmuVGM.asm"
.include "./api/api_playVGM.asm"
.include "./api/api_psg.asm"
.include "./api/api_joy.asm"
.include "./objects/player.asm"
.include "./objects/playerHit.asm"
.include "./objects/playerLaser.asm"
.include "./objects/enemyHit.asm"
.include "./objects/enemy.asm"
.include "./objects/paths.asm"
.include "./objects/enemyLaser.asm"
.include "state.asm"
.include "events.asm"
.include "splash.asm"
.include "menu.asm"
.include "fmMusic.asm"
.include "psgSound.asm"
.include "./level1/main.asm"

.include "./collision/api_collision.asm"
.include "./collision/playerLaser.asm"
.include "./collision/ships.asm"
.include "./collision/enemyLaser.asm"
