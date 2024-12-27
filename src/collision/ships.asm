.section code
playerCollidedWithEnemy
    jsr playerCollidedCheck0
    jsr playerCollidedCheck1
    jsr playerCollidedCheck2
    jsr playerCollidedCheck3
    jsr playerCollidedCheck4
    jsr playerCollidedCheck5
    jsr playerCollidedCheck6
    jsr playerCollidedCheck7
    jsr playerCollidedCheck8
    jsr playerCollidedCheck9
    jsr playerCollidedCheck10
    jsr playerCollidedCheck11
    
    lda mLaser00Active
    cmp #01
    beq _checkLaserCollision
    rts
_checkLaserCollision
    jsr playerLaserCollide
  
    rts
playerCollidedCheck0
    #coollideMacro mPlayerPosX, 14, mEnemy0 + 2, 14, mPlayerPosY,14,mEnemy0 + 4 , 14, mEnemy0
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck1
    #coollideMacro mPlayerPosX, 14, mEnemy1 + 2, 14, mPlayerPosY,14,mEnemy1 + 4 , 14, mEnemy1
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck2
    #coollideMacro mPlayerPosX, 14, mEnemy2 + 2, 14, mPlayerPosY,14,mEnemy2 + 4 , 14, mEnemy2
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck3
    #coollideMacro mPlayerPosX, 14, mEnemy3 + 2, 14, mPlayerPosY,14,mEnemy3 + 4 , 14, mEnemy3
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck4
    #coollideMacro mPlayerPosX, 14, mEnemy4 + 2, 14, mPlayerPosY,14,mEnemy4 + 4 , 14, mEnemy4
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck5
    #coollideMacro mPlayerPosX, 14, mEnemy5 + 2, 14, mPlayerPosY,14,mEnemy5 + 4 , 14, mEnemy5
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck6
    #coollideMacro mPlayerPosX, 14, mEnemy6 + 2, 14, mPlayerPosY,14,mEnemy6 + 4 , 14, mEnemy6
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck7
    #coollideMacro mPlayerPosX, 14, mEnemy7 + 2, 14, mPlayerPosY,14,mEnemy7 + 4 , 14, mEnemy7
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck8
    #coollideMacro mPlayerPosX, 14, mEnemy8 + 2, 14, mPlayerPosY,14,mEnemy8 + 4 , 14, mEnemy8
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck9
    #coollideMacro mPlayerPosX, 14, mEnemy9 + 2, 14, mPlayerPosY,14,mEnemy9 + 4 , 14, mEnemy9
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck10
    #coollideMacro mPlayerPosX, 14, mEnemy10 + 2, 14, mPlayerPosY,14,mEnemy10 + 4 , 14, mEnemy10
    lda #objectCollided
    sta mPlayerStatus
    rts
playerCollidedCheck11
    #coollideMacro mPlayerPosX, 14, mEnemy11 + 2, 14, mPlayerPosY,14,mEnemy11 + 4 , 14, mEnemy11
    lda #objectCollided
    sta mPlayerStatus
    rts
.endSection
  