.section code
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

    jsr playerLaser0HitMiniBoss
    jsr playerLaser1HitMiniBoss
    jsr playerLaser2HitMiniBoss
    jsr playerLaser3HitMiniBoss
    jsr playerLaser4HitMiniBoss
    jsr playerLaser5HitMiniBoss

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
    lda #objectInactive
    sta \2
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
    #objectsActiveMacro mEnemyStatus00, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX00, 18, mLaser00PosY, 6, mEnemyY00, 20
    #didCollide mEnemyStatus00, mLaserActive00
    rts

playerLaser1HitEnemy0
    #objectsActiveMacro mEnemyStatus00, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX00, 18, mLaser01PosY, 6,mEnemyY00, 20
    #didCollide mEnemyStatus00, mLaserActive01
    rts

playerLaser2HitEnemy0
    #objectsActiveMacro mEnemyStatus00, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX00, 18, mLaser02PosY, 6,mEnemyY00, 20
    #didCollide mEnemyStatus00, mLaserActive02
    rts


playerLaser3HitEnemy0
    #objectsActiveMacro mEnemyStatus00, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX00, 18, mLaser03PosY, 6,mEnemyY00, 20
    #didCollide mEnemyStatus00, mLaserActive03
    rts


playerLaser4HitEnemy0
    #objectsActiveMacro mEnemyStatus00, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX00, 18, mLaser04PosY, 6,mEnemyY00 + 4, 20
    #didCollide mEnemyStatus00, mLaserActive04
    rts


playerLaser5HitEnemy0
    #objectsActiveMacro mEnemyStatus00, mLaserActive05
    #coollideMacro mLaser05PosX, 10,mEnemyX00, 18, mLaser05PosY, 6,mEnemyY00 + 4, 20
    #didCollide mEnemyStatus00, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

playerLaser0HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX01, 18, mLaser00PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive00
    rts

playerLaser1HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX01, 18, mLaser01PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive01
    rts

playerLaser2HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX01, 18, mLaser02PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive02
    rts

playerLaser3HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX01, 18, mLaser03PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive03
    rts

playerLaser4HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX01, 18, mLaser04PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive04
    rts

playerLaser5HitEnemy1
    #objectsActiveMacro mEnemyStatus01, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX01, 18, mLaser05PosY, 6, mEnemyY01, 20
    #didCollide mEnemyStatus01, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy2
    #objectsActiveMacro mEnemyStatus02, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX02, 18, mLaser00PosY, 6, mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive00
    rts

playerLaser1HitEnemy2
    #objectsActiveMacro mEnemyStatus02, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX02, 18, mLaser01PosY, 6, mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive01
    rts

playerLaser2HitEnemy2
    #objectsActiveMacro mEnemyStatus02, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX02, 18, mLaser02PosY, 6, mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive02
    rts

playerLaser3HitEnemy2
    #objectsActiveMacro mEnemyStatus02, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX02, 18, mLaser03PosY, 6,mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive03
    rts

playerLaser4HitEnemy2
     #objectsActiveMacro mEnemyStatus02, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX02, 18, mLaser04PosY, 6,mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive04
    rts

playerLaser5HitEnemy2
    #objectsActiveMacro mEnemyStatus02, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX02, 18, mLaser05PosY, 6,mEnemyY02, 20
    #didCollide mEnemyStatus02, mLaserActive05
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX03, 18, mLaser00PosY, 6, mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive00
    rts

playerLaser1HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX03, 18, mLaser01PosY, 6, mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive01
    rts

playerLaser2HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX03, 18, mLaser02PosY, 6, mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive02
    rts

playerLaser3HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX03, 18, mLaser03PosY, 6,mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive03
    rts

playerLaser4HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX03, 18, mLaser04PosY, 6,mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive04
    rts

playerLaser5HitEnemy3
    #objectsActiveMacro mEnemyStatus03, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX03, 18, mLaser05PosY, 6,mEnemyY03, 20
    #didCollide mEnemyStatus03, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX04, 18, mLaser00PosY, 6, mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive00
    rts

playerLaser1HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX04, 18, mLaser01PosY, 6, mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive01
    rts

playerLaser2HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX04, 18, mLaser02PosY, 6, mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive02
    rts

playerLaser3HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX04, 18, mLaser03PosY, 6,mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive03
    rts

playerLaser4HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX04, 18, mLaser04PosY, 6,mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive04
    rts

playerLaser5HitEnemy4
    #objectsActiveMacro mEnemyStatus04, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX04, 18, mLaser05PosY, 6,mEnemyY04, 20
    #didCollide mEnemyStatus04, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX05, 18, mLaser00PosY, 6, mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive00
    rts

playerLaser1HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX05, 18, mLaser01PosY, 6, mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive01
    rts

playerLaser2HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX05, 18, mLaser02PosY, 6, mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive02
    rts

playerLaser3HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX05, 18, mLaser03PosY, 6,mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive03
    rts

playerLaser4HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX05, 18, mLaser04PosY, 6,mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive04
    rts

playerLaser5HitEnemy5
    #objectsActiveMacro mEnemyStatus05, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX05, 18, mLaser05PosY, 6,mEnemyY05, 20
    #didCollide mEnemyStatus05, mLaserActive05
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX06, 18, mLaser00PosY, 6, mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive00
    rts

playerLaser1HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX06, 18, mLaser01PosY, 6, mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive01
    rts

playerLaser2HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX06, 18, mLaser02PosY, 6, mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive02
    rts

playerLaser3HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX06, 18, mLaser03PosY, 6,mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive03
    rts

playerLaser4HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX06, 18, mLaser04PosY, 6,mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive04
    rts

playerLaser5HitEnemy6
    #objectsActiveMacro mEnemyStatus06, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX06, 18, mLaser05PosY, 6,mEnemyY06, 20
    #didCollide mEnemyStatus06, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX07, 18, mLaser00PosY, 6, mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive00
    rts

playerLaser1HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX07, 18, mLaser01PosY, 6, mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive01
    rts

playerLaser2HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX07, 18, mLaser02PosY, 6, mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive02
    rts

playerLaser3HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX07, 18, mLaser03PosY, 6,mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive03
    rts

playerLaser4HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX07, 18, mLaser04PosY, 6,mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive04
    rts

playerLaser5HitEnemy7
    #objectsActiveMacro mEnemyStatus07, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX07, 18, mLaser05PosY, 6,mEnemyY07, 20
    #didCollide mEnemyStatus07, mLaserActive05
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX08, 18, mLaser00PosY, 6, mEnemyY08, 20
    #didCollide mEnemyStatus08, mLaserActive00
    rts

playerLaser1HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX08, 18, mLaser01PosY, 6, mEnemyY08, 20
    #didCollide mEnemyStatus08, mLaserActive01
    rts

playerLaser2HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX08, 18, mLaser02PosY, 6, mEnemyY08, 20
    l#didCollide mEnemyStatus08, mLaserActive02
    rts

playerLaser3HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX08, 18, mLaser03PosY, 6,mEnemyY08, 20
    #didCollide mEnemyStatus08, mLaserActive03
    rts

playerLaser4HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX08, 18, mLaser04PosY, 6,mEnemyY08, 20
    #didCollide mEnemyStatus08, mLaserActive04
    rts

playerLaser5HitEnemy8
    #objectsActiveMacro mEnemyStatus08, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX08, 18, mLaser05PosY, 6,mEnemyY08, 20
    #didCollide mEnemyStatus08, mLaserActive05
    rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mEnemyX09, 18, mLaser00PosY, 6, mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive00
    rts

playerLaser1HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mEnemyX09, 18, mLaser01PosY, 6, mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive01
    rts

playerLaser2HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mEnemyX09, 18, mLaser02PosY, 6, mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive02
    rts

playerLaser3HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive03
    #coollideMacro mLaser03PosX, 10, mEnemyX09, 18, mLaser03PosY, 6,mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive03
    rts

playerLaser4HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mEnemyX09, 18, mLaser04PosY, 6,mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive04
    rts

playerLaser5HitEnemy9
    #objectsActiveMacro mEnemyStatus09, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mEnemyX09, 18, mLaser05PosY, 6,mEnemyY09, 20
    #didCollide mEnemyStatus09, mLaserActive05
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mMiniBossX, 48, mLaser00PosY, 6, mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive00
    rts

playerLaser1HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mMiniBossX, 48, mLaser01PosY, 6, mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive01
    rts

playerLaser2HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mMiniBossX, 48, mLaser02PosY, 6, mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive02
    rts

playerLaser3HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive03
    #coollideMacro mLaser03PosX, 10,mMiniBossX, 48, mLaser03PosY, 6,mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive03
    rts

playerLaser4HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mMiniBossX, 48, mLaser04PosY, 6,mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive04
    rts

playerLaser5HitMiniBoss
    #objectsActiveMacro mMiniBossStatus, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mMiniBossX, 48, mLaser05PosY, 6,mMiniBossY, 20
    #didCollide mMiniBossStatus, mLaserActive04
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
playerLaser0HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive00
    #coollideMacro mLaser00PosX, 10, mLevelOneBossX4, 18, mLaser00PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive00
    rts

playerLaser1HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive01
    #coollideMacro mLaser01PosX, 10, mLevelOneBossX4, 18, mLaser01PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive01
    rts

playerLaser2HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive02
    #coollideMacro mLaser02PosX, 10, mLevelOneBossX4, 18, mLaser02PosY, 6, mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive02
    rts

playerLaser3HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive03
    #coollideMacro mLaser03PosX, 10,mLevelOneBossX4, 18, mLaser03PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive03
    rts

playerLaser4HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive04
    #coollideMacro mLaser04PosX, 10, mLevelOneBossX4, 18, mLaser04PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive04
    rts

playerLaser5HitEnemyBoss
    #objectsActiveMacro mLevelOneBossObjectState, mLaserActive05
    #coollideMacro mLaser05PosX, 10, mLevelOneBossX4, 18, mLaser05PosY, 6,mLevelOneBossY5, 20
    #didCollide mLevelOneBossObjectState, mLaserActive04
    rts
.endsection