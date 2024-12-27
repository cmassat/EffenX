playerLaserCollide
    jsr playerLaser0HitEnemy0
    jsr playerLaser1HitEnemy0
    jsr playerLaser2HitEnemy0

    jsr playerLaser0HitEnemy1
    jsr playerLaser1HitEnemy1
    jsr playerLaser2HitEnemy1
;
    jsr playerLaser0HitEnemy2
    jsr playerLaser1HitEnemy2
    jsr playerLaser2HitEnemy2
;
    jsr playerLaser0HitEnemy3
    jsr playerLaser1HitEnemy3
    jsr playerLaser2HitEnemy3
;
    jsr playerLaser0HitEnemy4
    jsr playerLaser1HitEnemy4
    jsr playerLaser2HitEnemy4

    jsr playerLaser0HitEnemy5
    jsr playerLaser1HitEnemy5
    jsr playerLaser2HitEnemy5

    jsr playerLaser0HitEnemy6
    jsr playerLaser1HitEnemy6
    jsr playerLaser2HitEnemy6

    jsr playerLaser0HitEnemy7
    jsr playerLaser1HitEnemy7
    jsr playerLaser2HitEnemy7


    jsr playerLaser0HitEnemy8
    jsr playerLaser1HitEnemy8
    jsr playerLaser2HitEnemy8


    jsr playerLaser0HitEnemy9
    jsr playerLaser1HitEnemy9
    jsr playerLaser2HitEnemy9

    jsr playerLaser0HitEnemy10
    jsr playerLaser1HitEnemy10
    jsr playerLaser2HitEnemy10

    jsr playerLaser0HitEnemy11
    jsr playerLaser1HitEnemy11
    jsr playerLaser2HitEnemy11
    rts
 
playerLaser0HitEnemy0
    #coollideMacro mLaser00PosX, 10, mEnemy0 + 2, 18, mLaser00PosY, 6,mEnemy0 + 4, 20, mEnemy0
    lda #objectCollided
    sta mEnemy0
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy0
    #coollideMacro mLaser01PosX, 10, mEnemy0 + 2, 18, mLaser01PosY, 6, mEnemy0 + 4, 20, mEnemy0
    lda #objectCollided
    sta mEnemy0
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy0
    #coollideMacro mLaser02PosX, 10, mEnemy0 + 2, 18, mLaser02PosY, 6, mEnemy0 + 4, 20, mEnemy0
    lda #objectCollided
    sta mEnemy0
    stz mLaser02Active
    jsr sound_play_explosion
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

playerLaser0HitEnemy1
    #coollideMacro mLaser00PosX, 10, mEnemy1 + 2, 18, mLaser00PosY, 6, mEnemy1 + 4, 20, mEnemy1
    lda #objectCollided
    sta mEnemy1
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy1
    #coollideMacro mLaser01PosX, 10, mEnemy1 + 2, 18, mLaser01PosY, 6, mEnemy1 + 4 , 20, mEnemy1
    lda #objectCollided
    sta mEnemy1
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy1
    #coollideMacro mLaser02PosX, 10, mEnemy1 + 2, 18, mLaser02PosY, 6, mEnemy1 + 4 , 20, mEnemy1
    lda #objectCollided
    sta mEnemy1
    stz mLaser02Active
    jsr sound_play_explosion
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy2
    #coollideMacro mLaser00PosX, 10, mEnemy2 + 2, 18, mLaser00PosY, 6, mEnemy2 + 4, 20, mEnemy2
    lda #objectCollided
    sta mEnemy2
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy2
    #coollideMacro mLaser01PosX, 10, mEnemy2 + 2, 18, mLaser01PosY, 6, mEnemy2 + 4, 20, mEnemy2
    lda #objectCollided
    sta mEnemy2
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy2
    #coollideMacro mLaser02PosX, 10, mEnemy2 + 2, 18, mLaser02PosY, 6, mEnemy2 + 4, 20, mEnemy2
    lda #objectCollided
    sta mEnemy2
    stz mLaser02Active
    jsr sound_play_explosion
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy3
    #coollideMacro mLaser00PosX, 10, mEnemy3 + 2, 18, mLaser00PosY, 6, mEnemy3 + 4, 20, mEnemy3
    lda #objectCollided
    sta mEnemy3
    stz mLaser00Active
    jsr sound_play_explosion
    rts


playerLaser1HitEnemy3
    #coollideMacro mLaser01PosX, 10, mEnemy3 + 2, 18, mLaser01PosY, 6, mEnemy3 + 4, 20, mEnemy3
    lda #objectCollided
    sta mEnemy3
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy3
    #coollideMacro mLaser02PosX, 10, mEnemy3 + 2, 18, mLaser02PosY, 6, mEnemy3 + 4, 20, mEnemy3
    lda #objectCollided
    sta mEnemy3
    stz mLaser02Active
    jsr sound_play_explosion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy4
    #coollideMacro mLaser00PosX, 10, mEnemy4 + 2, 18, mLaser00PosY, 6, mEnemy4 + 4, 20, mEnemy4
    lda #objectCollided
    sta mEnemy4
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy4
    #coollideMacro mLaser01PosX, 10, mEnemy4 + 2, 18, mLaser01PosY, 6, mEnemy4 + 4, 20, mEnemy4
    lda #objectCollided
    sta mEnemy4
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy4
    #coollideMacro mLaser02PosX, 10, mEnemy4 + 2, 18, mLaser02PosY, 6, mEnemy4 + 4, 20, mEnemy4
    lda #objectCollided
    sta mEnemy4
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy5
    #coollideMacro mLaser00PosX, 10, mEnemy5 + 2, 18, mLaser00PosY, 6, mEnemy5 + 4, 20, mEnemy5
    lda #objectCollided
    sta mEnemy5
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy5
    #coollideMacro mLaser01PosX, 10, mEnemy5 + 2, 18, mLaser01PosY, 6, mEnemy5 + 4, 20, mEnemy5
    lda #objectCollided
    sta mEnemy5
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy5
    #coollideMacro mLaser02PosX, 10, mEnemy5 + 2, 18, mLaser02PosY, 6, mEnemy5 + 4, 20, mEnemy5
    lda #objectCollided
    sta mEnemy5
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy6
    #coollideMacro mLaser00PosX, 10, mEnemy6 + 2, 18, mLaser00PosY, 6, mEnemy6 + 4, 20, mEnemy6
    lda #objectCollided
    sta mEnemy6
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy6
    #coollideMacro mLaser01PosX, 10, mEnemy6 + 2, 18, mLaser01PosY, 6, mEnemy6 + 4, 20, mEnemy6
    lda #objectCollided
    sta mEnemy6
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy6
    #coollideMacro mLaser02PosX, 10, mEnemy6 + 2, 18, mLaser02PosY, 6, mEnemy6 + 4, 20, mEnemy6
    lda #objectCollided
    sta mEnemy6
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy7
    #coollideMacro mLaser00PosX, 10, mEnemy7 + 2, 18, mLaser00PosY, 6, mEnemy7 + 4, 20, mEnemy7
    lda #objectCollided
    sta mEnemy7
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy7
    #coollideMacro mLaser01PosX, 10, mEnemy7 + 2, 18, mLaser01PosY, 6, mEnemy7 + 4, 20, mEnemy7
    lda #objectCollided
    sta mEnemy7
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy7
    #coollideMacro mLaser02PosX, 10, mEnemy7 + 2, 18, mLaser02PosY, 6, mEnemy7 + 4, 20, mEnemy7
    lda #objectCollided
    sta mEnemy7
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy8
    #coollideMacro mLaser00PosX, 10, mEnemy8 + 2, 18, mLaser00PosY, 6, mEnemy8 + 4, 20, mEnemy8
    lda #objectCollided
    sta mEnemy8
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy8
    #coollideMacro mLaser01PosX, 10, mEnemy8 + 2, 18, mLaser01PosY, 6, mEnemy8 + 4, 20, mEnemy8
    lda #objectCollided
    sta mEnemy8
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy8
    #coollideMacro mLaser02PosX, 10, mEnemy8 + 2, 18, mLaser02PosY, 6, mEnemy8 + 4, 20, mEnemy8
    lda #objectCollided
    sta mEnemy8
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy9
    #coollideMacro mLaser00PosX, 10, mEnemy9 + 2, 18, mLaser00PosY, 6, mEnemy9 + 4, 20, mEnemy9
    lda #objectCollided
    sta mEnemy9
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy9
    #coollideMacro mLaser01PosX, 10, mEnemy9 + 2, 18, mLaser01PosY, 6, mEnemy9 + 4, 20, mEnemy9
    lda #objectCollided
    sta mEnemy9
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy9
    #coollideMacro mLaser02PosX, 10, mEnemy9 + 2, 18, mLaser02PosY, 6, mEnemy9 + 4, 20, mEnemy9
    lda #objectCollided
    sta mEnemy9
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy10
    #coollideMacro mLaser00PosX, 10, mEnemy10 + 2, 18, mLaser00PosY, 6, mEnemy10 + 4, 20, mEnemy10
    lda #objectCollided
    sta mEnemy10
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy10
    #coollideMacro mLaser01PosX, 10, mEnemy10 + 2, 18, mLaser01PosY, 6, mEnemy10 + 4, 20, mEnemy10
    lda #objectCollided
    sta mEnemy10
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy10
    #coollideMacro mLaser02PosX, 10, mEnemy10 + 2, 18, mLaser02PosY, 6, mEnemy10 + 4, 20, mEnemy10
    lda #objectCollided
    sta mEnemy10
    stz mLaser02Active
    jsr sound_play_explosion
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy11
    #coollideMacro mLaser00PosX, 10, mEnemy11 + 2, 18, mLaser00PosY, 6, mEnemy11 + 4, 20, mEnemy11
    lda #objectCollided
    sta mEnemy11
    stz mLaser00Active
    jsr sound_play_explosion
    rts

playerLaser1HitEnemy11
    #coollideMacro mLaser01PosX, 10, mEnemy11 + 2, 18, mLaser01PosY, 6, mEnemy11 + 4, 20, mEnemy11
    lda #objectCollided
    sta mEnemy11
    stz mLaser01Active
    jsr sound_play_explosion
    rts

playerLaser2HitEnemy11
    #coollideMacro mLaser02PosX, 10, mEnemy11 + 2, 18, mLaser02PosY, 6, mEnemy11 + 4, 20, mEnemy11
    lda #objectCollided
    sta mEnemy11
    stz mLaser02Active
    jsr sound_play_explosion
    rts