playerLaserCollide
    jsr playerLaser0HitEnemy0
    jsr playerLaser1HitEnemy0
    jsr playerLaser2HitEnemy0
    jsr playerLaser3HitEnemy0
    jsr playerLaser4HitEnemy0
    jsr playerLaser5HitEnemy0

    jsr playerLaser0HitEnemy1
    jsr playerLaser1HitEnemy1
    jsr playerLaser2HitEnemy1
    jsr playerLaser3HitEnemy1
    jsr playerLaser4HitEnemy1
    jsr playerLaser5HitEnemy1
;
    jsr playerLaser0HitEnemy2
    jsr playerLaser1HitEnemy2
    jsr playerLaser2HitEnemy2
    jsr playerLaser3HitEnemy2
    jsr playerLaser4HitEnemy2
    jsr playerLaser5HitEnemy2
;
    jsr playerLaser0HitEnemy3
    jsr playerLaser1HitEnemy3
    jsr playerLaser2HitEnemy3
    jsr playerLaser3HitEnemy3
    jsr playerLaser4HitEnemy3
    jsr playerLaser5HitEnemy3
;
    jsr playerLaser0HitEnemy4
    jsr playerLaser1HitEnemy4
    jsr playerLaser2HitEnemy4
    jsr playerLaser3HitEnemy4
    jsr playerLaser4HitEnemy4
    jsr playerLaser5HitEnemy4

    jsr playerLaser0HitEnemy5
    jsr playerLaser1HitEnemy5
    jsr playerLaser2HitEnemy5
    jsr playerLaser3HitEnemy5
    jsr playerLaser4HitEnemy5
    jsr playerLaser5HitEnemy5

    jsr playerLaser0HitEnemy6
    jsr playerLaser1HitEnemy6
    jsr playerLaser2HitEnemy6
    jsr playerLaser3HitEnemy6
    jsr playerLaser4HitEnemy6
    jsr playerLaser5HitEnemy6

    jsr playerLaser0HitEnemy7
    jsr playerLaser1HitEnemy7
    jsr playerLaser2HitEnemy7
    jsr playerLaser3HitEnemy7
    jsr playerLaser4HitEnemy7
    jsr playerLaser5HitEnemy7

    jsr playerLaser0HitEnemy8
    jsr playerLaser1HitEnemy8
    jsr playerLaser2HitEnemy8
    jsr playerLaser3HitEnemy8
    jsr playerLaser4HitEnemy8
    jsr playerLaser5HitEnemy8

    jsr playerLaser0HitEnemy9
    jsr playerLaser1HitEnemy9
    jsr playerLaser2HitEnemy9
    jsr playerLaser3HitEnemy9
    jsr playerLaser4HitEnemy9
    jsr playerLaser5HitEnemy9

    jsr playerLaser0HitEnemy10
    jsr playerLaser1HitEnemy10
    jsr playerLaser2HitEnemy10
    jsr playerLaser3HitEnemy10
    jsr playerLaser4HitEnemy10
    jsr playerLaser5HitEnemy10

    jsr playerLaser0HitEnemy11
    jsr playerLaser1HitEnemy11
    jsr playerLaser2HitEnemy11
    jsr playerLaser3HitEnemy11
    jsr playerLaser4HitEnemy11
    jsr playerLaser5HitEnemy11

    jsr playerLaser0HitEnemyBoss
    jsr playerLaser1HitEnemyBoss
    jsr playerLaser2HitEnemyBoss
    jsr playerLaser3HitEnemyBoss
    jsr playerLaser4HitEnemyBoss
    jsr playerLaser5HitEnemyBoss
    
    rts
 
 didCollide .macro
    lda #objectCollided
    sta \1
    stz \2
    lda #10
    jsr add2score
    jsr sound_play_explosion
 .endmacro

objectsActiveMacro .macro
    lda \1
    cmp #objectActive
    beq _objectOneActive
    rts
_objectOneActive
    lda \2
    cmp  #objectActive
    beq _checkCollision
    rts
_checkCollision
 .endmacro

playerLaser0HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy0 + 2, 18, mLaser00PosY, 6,mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser00Active
    rts

playerLaser1HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy0 + 2, 18, mLaser01PosY, 6, mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser01Active
    rts

playerLaser2HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy0 + 2, 18, mLaser02PosY, 6, mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser02Active
    rts


playerLaser3HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy0 + 2, 18, mLaser03PosY, 6,mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser03Active
    rts


playerLaser4HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy0 + 2, 18, mLaser04PosY, 6,mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser04Active
    rts


playerLaser5HitEnemy0
    #objectsActiveMacro mEnemy0, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy0 + 2, 18, mLaser05PosY, 6,mEnemy0 + 4, 20
    #didCollide mEnemy0, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

playerLaser0HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy1 + 2, 18, mLaser00PosY, 6, mEnemy1 + 4, 20
    #didCollide mEnemy1, mLaser00Active
    rts

playerLaser1HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy1 + 2, 18, mLaser01PosY, 6, mEnemy1 + 4 , 20
    #didCollide mEnemy1, mLaser01Active
    rts

playerLaser2HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy1 + 2, 18, mLaser02PosY, 6, mEnemy1 + 4 , 20
    #didCollide mEnemy1, mLaser02Active
    rts

playerLaser3HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy1 + 2, 18, mLaser03PosY, 6,mEnemy1 + 4, 20
    #didCollide mEnemy1, mLaser03Active
    rts

playerLaser4HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy1 + 2, 18, mLaser04PosY, 6,mEnemy1 + 4, 20
    #didCollide mEnemy1, mLaser04Active
    rts

playerLaser5HitEnemy1
    #objectsActiveMacro mEnemy1, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy1 + 2, 18, mLaser05PosY, 6,mEnemy1 + 4, 20
    #didCollide mEnemy1, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy2
    #objectsActiveMacro mEnemy2, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy2 + 2, 18, mLaser00PosY, 6, mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser00Active
    rts

playerLaser1HitEnemy2
    #objectsActiveMacro mEnemy2, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy2 + 2, 18, mLaser01PosY, 6, mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser01Active
    rts

playerLaser2HitEnemy2
    #objectsActiveMacro mEnemy2, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy2 + 2, 18, mLaser02PosY, 6, mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser02Active
    rts

playerLaser3HitEnemy2
    #objectsActiveMacro mEnemy2, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy2 + 2, 18, mLaser03PosY, 6,mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser03Active
    rts

playerLaser4HitEnemy2
     #objectsActiveMacro mEnemy2, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy2 + 2, 18, mLaser04PosY, 6,mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser04Active
    rts

playerLaser5HitEnemy2
    #objectsActiveMacro mEnemy2, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy2 + 2, 18, mLaser05PosY, 6,mEnemy2 + 4, 20
    #didCollide mEnemy2, mLaser05Active
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy3 + 2, 18, mLaser00PosY, 6, mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser00Active
    rts

playerLaser1HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy3 + 2, 18, mLaser01PosY, 6, mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser01Active
    rts

playerLaser2HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy3 + 2, 18, mLaser02PosY, 6, mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser02Active
    rts

playerLaser3HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy3 + 2, 18, mLaser03PosY, 6,mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser03Active
    rts

playerLaser4HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy3 + 2, 18, mLaser04PosY, 6,mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser04Active
    rts

playerLaser5HitEnemy3
    #objectsActiveMacro mEnemy3, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy3 + 2, 18, mLaser05PosY, 6,mEnemy3 + 4, 20
    #didCollide mEnemy3, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy4 + 2, 18, mLaser00PosY, 6, mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser00Active
    rts

playerLaser1HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy4 + 2, 18, mLaser01PosY, 6, mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser01Active
    rts

playerLaser2HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy4 + 2, 18, mLaser02PosY, 6, mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser02Active
    rts

playerLaser3HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy4 + 2, 18, mLaser03PosY, 6,mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser03Active
    rts

playerLaser4HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy4 + 2, 18, mLaser04PosY, 6,mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser04Active
    rts

playerLaser5HitEnemy4
    #objectsActiveMacro mEnemy4, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy4 + 2, 18, mLaser05PosY, 6,mEnemy4 + 4, 20
    #didCollide mEnemy4, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy5 + 2, 18, mLaser00PosY, 6, mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser00Active
    rts

playerLaser1HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy5 + 2, 18, mLaser01PosY, 6, mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser01Active
    rts

playerLaser2HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy5 + 2, 18, mLaser02PosY, 6, mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser02Active
    rts

playerLaser3HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy5 + 2, 18, mLaser03PosY, 6,mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser03Active
    rts

playerLaser4HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy5 + 2, 18, mLaser04PosY, 6,mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser04Active
    rts

playerLaser5HitEnemy5
    #objectsActiveMacro mEnemy5, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy5 + 2, 18, mLaser05PosY, 6,mEnemy5 + 4, 20
    #didCollide mEnemy5, mLaser05Active
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy6 + 2, 18, mLaser00PosY, 6, mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser00Active
    rts

playerLaser1HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy6 + 2, 18, mLaser01PosY, 6, mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser01Active
    rts

playerLaser2HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy6 + 2, 18, mLaser02PosY, 6, mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser02Active
    rts

playerLaser3HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy6 + 2, 18, mLaser03PosY, 6,mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser03Active
    rts

playerLaser4HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy6 + 2, 18, mLaser04PosY, 6,mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser04Active
    rts

playerLaser5HitEnemy6
    #objectsActiveMacro mEnemy6, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy6 + 2, 18, mLaser05PosY, 6,mEnemy6 + 4, 20
    #didCollide mEnemy6, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy7 + 2, 18, mLaser00PosY, 6, mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser00Active
    rts

playerLaser1HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy7 + 2, 18, mLaser01PosY, 6, mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser01Active
    rts

playerLaser2HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy7 + 2, 18, mLaser02PosY, 6, mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser02Active
    rts

playerLaser3HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy7 + 2, 18, mLaser03PosY, 6,mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser03Active
    rts

playerLaser4HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy7 + 2, 18, mLaser04PosY, 6,mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser04Active
    rts

playerLaser5HitEnemy7
    #objectsActiveMacro mEnemy7, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy7 + 2, 18, mLaser05PosY, 6,mEnemy7 + 4, 20
    #didCollide mEnemy7, mLaser05Active
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy8 + 2, 18, mLaser00PosY, 6, mEnemy8 + 4, 20
    #didCollide mEnemy8, mLaser00Active
    rts

playerLaser1HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy8 + 2, 18, mLaser01PosY, 6, mEnemy8 + 4, 20
    #didCollide mEnemy8, mLaser01Active
    rts

playerLaser2HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy8 + 2, 18, mLaser02PosY, 6, mEnemy8 + 4, 20
    l#didCollide mEnemy8, mLaser02Active
    rts

playerLaser3HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy8 + 2, 18, mLaser03PosY, 6,mEnemy8 + 4, 20
    #didCollide mEnemy8, mLaser03Active
    rts

playerLaser4HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy8 + 2, 18, mLaser04PosY, 6,mEnemy8 + 4, 20
    #didCollide mEnemy8, mLaser04Active
    rts

playerLaser5HitEnemy8
    #objectsActiveMacro mEnemy8, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy8 + 2, 18, mLaser05PosY, 6,mEnemy8 + 4, 20
    #didCollide mEnemy8, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy9 + 2, 18, mLaser00PosY, 6, mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser00Active
    rts

playerLaser1HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy9 + 2, 18, mLaser01PosY, 6, mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser01Active
    rts

playerLaser2HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy9 + 2, 18, mLaser02PosY, 6, mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser02Active
    rts

playerLaser3HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy9 + 2, 18, mLaser03PosY, 6,mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser03Active
    rts

playerLaser4HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy9 + 2, 18, mLaser04PosY, 6,mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser04Active
    rts

playerLaser5HitEnemy9
    #objectsActiveMacro mEnemy9, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy9 + 2, 18, mLaser05PosY, 6,mEnemy9 + 4, 20
    #didCollide mEnemy9, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy10 + 2, 18, mLaser00PosY, 6, mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser00Active
    rts

playerLaser1HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy10 + 2, 18, mLaser01PosY, 6, mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser01Active
    rts

playerLaser2HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy10 + 2, 18, mLaser02PosY, 6, mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser02Active
    rts

playerLaser3HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy10 + 2, 18, mLaser03PosY, 6,mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser03Active
    rts

playerLaser4HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy10 + 2, 18, mLaser04PosY, 6,mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser04Active
    rts

playerLaser5HitEnemy10
    #objectsActiveMacro mEnemy10, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy10 + 2, 18, mLaser05PosY, 6,mEnemy10 + 4, 20
    #didCollide mEnemy10, mLaser05Active
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mEnemy11 + 2, 18, mLaser00PosY, 6, mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser00Active
    rts

playerLaser1HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mEnemy11 + 2, 18, mLaser01PosY, 6, mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser01Active
    rts

playerLaser2HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mEnemy11 + 2, 18, mLaser02PosY, 6, mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser02Active
    rts

playerLaser3HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser03Active
    #coollideMacro mLaser03PosX, 10, mEnemy11 + 2, 18, mLaser03PosY, 6,mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser03Active
    rts

playerLaser4HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mEnemy11 + 2, 18, mLaser04PosY, 6,mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser04Active
    rts

playerLaser5HitEnemy11
    #objectsActiveMacro mEnemy11, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mEnemy11 + 2, 18, mLaser05PosY, 6,mEnemy11 + 4, 20
    #didCollide mEnemy11, mLaser05Active
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser00Active
    #coollideMacro mLaser00PosX, 10, mLevelOneBossX4, 18, mLaser00PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser00Active
    rts

playerLaser1HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser01Active
    #coollideMacro mLaser01PosX, 10, mLevelOneBossX4, 18, mLaser01PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser01Active
    rts

playerLaser2HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser02Active
    #coollideMacro mLaser02PosX, 10, mLevelOneBossX4, 18, mLaser02PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser02Active
    rts

playerLaser3HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser03Active
    #coollideMacro mLaser03PosX, 10,mLevelOneBossX4, 18, mLaser03PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser03Active
    rts

playerLaser4HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser04Active
    #coollideMacro mLaser04PosX, 10, mLevelOneBossX4, 18, mLaser04PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser04Active
    rts

playerLaser5HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaser05Active
    #coollideMacro mLaser05PosX, 10, mLevelOneBossX4, 18, mLaser05PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaser04Active
    rts