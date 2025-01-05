.section code
playerCollidedWithEnemy
    ;jsr playerCollidedCheck0
    ;jsr playerCollidedCheck1
    ;jsr playerCollidedCheck2
    ;jsr playerCollidedCheck3
    ;jsr playerCollidedCheck4
    ;jsr playerCollidedCheck5
    ;jsr playerCollidedCheck6
    ;jsr playerCollidedCheck7
    ;jsr playerCollidedCheck8
    ;jsr playerCollidedCheck9
    ;jsr playerCollidedCheck10
    ;jsr playerCollidedCheck11
;
    ;jsr playerLaserCollide
  
    rts
; playerCollidedCheck0
;     #objectsActiveMacro mEnemyStatus00, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14,mEnemyX00, 14, mPlayerPosY,14,mEnemyY00 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemyStatus00
;     rts
; playerCollidedCheck1
;     ; #objectsActiveMacro mEnemy1, mPlayerStatus
;     ; #coollideMacro mPlayerPosX, 14, mEnemy1 + 2, 14, mPlayerPosY,14,mEnemy1 + 4 , 14
;     ; lda #objectCollided
;     ; sta mPlayerStatus
;     ; sta mEnemy1
;     rts
; playerCollidedCheck2
;     #objectsActiveMacro mEnemy2, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy2 + 2, 14, mPlayerPosY,14,mEnemy2 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy2
;     rts
; playerCollidedCheck3
;     #objectsActiveMacro mEnemy3, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy3 + 2, 14, mPlayerPosY,14,mEnemy3 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy3
;     rts
; playerCollidedCheck4
;     #objectsActiveMacro mEnemy4, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy4 + 2, 14, mPlayerPosY,14,mEnemy4 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy4
;     rts
; playerCollidedCheck5
;     #objectsActiveMacro mEnemy5, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy5 + 2, 14, mPlayerPosY,14,mEnemy5 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy5
;     rts
; playerCollidedCheck6
;     #objectsActiveMacro mEnemy6, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy6 + 2, 14, mPlayerPosY,14,mEnemy6 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy6
;     rts
; playerCollidedCheck7
;     #objectsActiveMacro mEnemy7, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy7 + 2, 14, mPlayerPosY,14,mEnemy7 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy7
;     rts
; playerCollidedCheck8
;     #objectsActiveMacro mEnemy8, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy8 + 2, 14, mPlayerPosY,14,mEnemy8 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy8
;     rts
; playerCollidedCheck9
;     #objectsActiveMacro mEnemy9, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy9 + 2, 14, mPlayerPosY,14,mEnemy9 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy9
;     rts
; playerCollidedCheck10
;     #objectsActiveMacro mEnemy10, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy10 + 2, 14, mPlayerPosY,14,mEnemy10 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy10
;     rts
; playerCollidedCheck11
;     #objectsActiveMacro mEnemy11, mPlayerStatus
;     #coollideMacro mPlayerPosX, 14, mEnemy11 + 2, 14, mPlayerPosY,14,mEnemy11 + 4 , 14
;     lda #objectCollided
;     sta mPlayerStatus
;     sta mEnemy11
;     rts
.endSection
  