powerupCollide
    jsr playerLaser0HitPowerUp
    rts

playerLaser0HitPowerUp
    #objectsActiveMacro mPowerUpStatus, mPlayerStatus
    #coollideMacro mPlayerPosX, 20, mPowerUpX, 18, mPlayerPosY, 18, mPowerUpY, 20
    #didCollide mPowerUpStatus, mPlayerStatus
    lda #objectActive
    sta mPlayerStatus
    jsr disableAllLasers
    rts