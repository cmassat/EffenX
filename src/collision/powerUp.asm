powerupCollide
    jsr playerLaser0HitPowerUp
    rts

playerLaser0HitPowerUp
    #objectsActiveMacro mPowerUpStatus, mPlayerStatus
    #coollideMacro mPlayerPosX, 10, mPowerUpX, 18, mPlayerPosY, 6, mPowerUpY, 20
    #didCollide mPowerUpStatus, mPlayerStatus
    lda #objectActive
    sta mPlayerStatus
    jsr resetAllLasers
    rts