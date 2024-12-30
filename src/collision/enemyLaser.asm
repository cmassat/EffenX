handleEnemyLaserCollision
    lda mPlayerStatus
    cmp #objectActive
    beq _checkCollisions
    rts
_checkCollisions
    jsr enemyLaser0HitPlayer0
    jsr enemyLaser1HitPlayer0
    jsr enemyLaser2HitPlayer0
    ;jsr enemyLaser3HitPlayer0
    ;jsr enemyLaser4HitPlayer0
    ;jsr enemyLaser5HitPlayer0
    ;jsr enemyLaser6HitPlayer0
    ;jsr enemyLaser7HitPlayer0
    ;jsr enemyLaser8HitPlayer0
    ;jsr enemyLaser9HitPlayer0
    ;jsr enemyLaser10HitPlayer0
    ;jsr enemyLaser11HitPlayer0
    rts

enemyLaser0HitPlayer0
    #objectsActiveMacro mEnemyLaserActive00, mPlayerStatus
    #coollideMacro mEnemyLaserX00, 10, mPlayerPosX, 18, mEnemyLaserY00, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    sta mEnemyLaserActive00
    jsr sound_play_explosion
    rts

enemyLaser1HitPlayer0
    #objectsActiveMacro mEnemyLaserActive01, mPlayerStatus
    #coollideMacro mEnemyLaserX01, 10, mPlayerPosX, 18, mEnemyLaserY01, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    sta mEnemyLaserActive01
    jsr sound_play_explosion
    rts

enemyLaser2HitPlayer0
    #objectsActiveMacro mEnemyLaserActive02, mPlayerStatus
    #coollideMacro mEnemyLaserX02, 10, mPlayerPosX, 18, mEnemyLaserY02, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    sta mEnemyLaserActive02
    jsr sound_play_explosion
    rts

enemyLaser3HitPlayer0
    #objectsActiveMacro mEnemyLaserActive03, mPlayerStatus
    #coollideMacro mEnemyLaserX03, 10, mPlayerPosX, 18, mEnemyLaserY03, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    sta mEnemyLaserActive03
    jsr sound_play_explosion
    rts

enemyLaser4HitPlayer0
    #objectsActiveMacro mEnemyLaserActive04, mPlayerStatus
    #coollideMacro mEnemyLaserX04, 10, mPlayerPosX, 18, mEnemyLaserY04, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive04
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts

enemyLaser5HitPlayer0
    #objectsActiveMacro mEnemyLaserActive05, mPlayerStatus
    #coollideMacro mEnemyLaserX05, 10, mPlayerPosX, 18, mEnemyLaserY05, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive05
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts

enemyLaser6HitPlayer0
    #objectsActiveMacro mEnemyLaserActive06, mPlayerStatus
    #coollideMacro mEnemyLaserX06, 10, mPlayerPosX, 18, mEnemyLaserY06, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive06
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts

enemyLaser7HitPlayer0
    #objectsActiveMacro mEnemyLaserActive07, mPlayerStatus
    #coollideMacro mEnemyLaserX07, 10, mPlayerPosX, 18, mEnemyLaserY07, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive07
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts
enemyLaser8HitPlayer0
    #objectsActiveMacro mEnemyLaserActive08, mPlayerStatus
    #coollideMacro mEnemyLaserX08, 10, mPlayerPosX, 18, mEnemyLaserY08, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive08
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts
enemyLaser9HitPlayer0
    #objectsActiveMacro mEnemyLaserActive09, mPlayerStatus
    #coollideMacro mEnemyLaserX09, 10, mPlayerPosX, 18, mEnemyLaserY09, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive09
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts
enemyLaser10HitPlayer0
    #objectsActiveMacro mEnemyLaserActive10, mPlayerStatus
    #coollideMacro mEnemyLaserX10, 10, mPlayerPosX, 18, mEnemyLaserY10, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive10
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts
enemyLaser11HitPlayer0
    #objectsActiveMacro mEnemyLaserActive11, mPlayerStatus
    #coollideMacro mEnemyLaserX11, 10, mPlayerPosX, 18, mEnemyLaserY11, 6,mPlayerPosY, 20
    lda #objectCollided
    sta mPlayerStatus
    stz mEnemyLaserActive11
    stz mLaser02Posy
    stz mLaser02Posy + 1
    jsr sound_play_explosion
    rts