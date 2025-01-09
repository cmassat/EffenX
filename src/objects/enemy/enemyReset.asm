.section code
resetEnemies
   lda #objectDisabled
   sta mEnemyStatus00
   sta mEnemyStatus01
   sta mEnemyStatus02
   sta mEnemyStatus03
   sta mEnemyStatus04
   sta mEnemyStatus05
   sta mEnemyStatus06
   sta mEnemyStatus07
   sta mEnemyStatus08
   sta mEnemyStatus09
   sta mEnemyStatus10
   sta mEnemyStatus11
   sta mEnemyStatus12
   sta mEnemyStatus13
   sta mEnemyStatus14
   sta mEnemyStatus15
   
   lda #objectDisabled
   sta mEnemyLaserActive00
   sta mEnemyLaserActive01
   sta mEnemyLaserActive02
   sta mEnemyLaserActive03
   sta mEnemyLaserActive04
   sta mEnemyLaserActive05
   sta mEnemyLaserActive06
   sta mEnemyLaserActive07
   sta mEnemyLaserActive08
   sta mEnemyLaserActive09
   sta mEnemyLaserActive10
   sta mEnemyLaserActive11

    jsr hideAllEnemies
    jsr hideAllEnemyLasers
    rts 

hideAllEnemies
   lda #spEnemyNumber00
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber01
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber02
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber03
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber04
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber05
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber06
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber07
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber08
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber09
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber10
   jsr setSpriteNumber
   jsr hideSprite
   lda #spEnemyNumber11
   jsr setSpriteNumber
   jsr hideSprite
   rts

hideAllEnemyLasers
   lda #spEnemyLaserNumber00
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber01
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber02
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber03
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber04
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber05
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber06
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber07
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber08
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber09
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber10
   jsr setSpriteNumber
   jsr hideSprite 
   lda #spEnemyLaserNumber11
   jsr setSpriteNumber
   jsr hideSprite
   rts
.endsection