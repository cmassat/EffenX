.section variables

spCharWidth = 16
spCharHeigth = 16
spCharSize = spCharWidth * spCharHeigth

spCharA = spCharStart
spCharB = spCharA + spCharSize
spCharC = spCharB + spCharSize
spCharD = spCharC + spCharSize
spCharE = spCharD + spCharSize
spCharF = spCharE + spCharSize
spCharG = spCharF + spCharSize
spCharH = spCharG + spCharSize
spCharI = spCharH + spCharSize
spCharJ = spCharI + spCharSize
spCharK = spCharJ + spCharSize
spCharL = spCharK + spCharSize
spCharM = spCharL + spCharSize
spCharN = spCharM + spCharSize
spCharO = spCharN + spCharSize
spCharP = spCharO + spCharSize
spCharQ = spCharP + spCharSize
spCharR = spCharQ + spCharSize
spCharS = spCharR + spCharSize
spCharT = spCharS + spCharSize
spCharU = spCharT + spCharSize
spCharV = spCharU + spCharSize
spCharW = spCharV + spCharSize
spCharX = spCharW + spCharSize
spCharY = spCharX + spCharSize
spCharZ = spCharY + spCharSize
spChar0 = spCharZ + spCharSize
spChar1 = spChar0 + spCharSize
spChar2 = spChar1 + spCharSize
spChar3 = spChar2 + spCharSize
spChar4 = spChar3 + spCharSize
spChar5 = spChar4 + spCharSize
spChar6 = spChar5 + spCharSize
spChar7 = spChar6 + spCharSize
spChar8 = spChar7 + spCharSize
spChar9 = spChar8 + spCharSize
spCharPrd = spChar9 + spCharSize
spCharExl = spCharPrd + spCharSize
spCharQst = spCharExl + spCharSize

col00 = 32
col01 = col00 + spCharWidth
col02 = col01 + spCharWidth
col03 = col02 + spCharWidth
col04 = col03 + spCharWidth
col05 = col04 + spCharWidth
col06 = col05 + spCharWidth
col07 = col06 + spCharWidth
col08 = col07 + spCharWidth
col09 = col08 + spCharWidth
col10 = col09 + spCharWidth
col11 = col10 + spCharWidth
col12 = col11 + spCharWidth
col13 = col12 + spCharWidth
col14 = col13 + spCharWidth
col15 = col14 + spCharWidth
col16 = col15 + spCharWidth

row00 = 32
row01 = row00 + spCharHeigth
row02 = row01 + spCharHeigth
row03 = row02 + spCharHeigth
row04 = row03 + spCharHeigth
row05 = row04 + spCharHeigth
row06 = row05 + spCharHeigth
row07 = row06 + spCharHeigth
row08 = row07 + spCharHeigth
row09 = row08 + spCharHeigth
row10 = row09 + spCharHeigth
row11 = row10 + spCharHeigth
row12 = row11 + spCharHeigth
row13 = row12 + spCharHeigth
row14 = row13 + spCharHeigth
row15 = row14 + spCharHeigth
row16 = row15 + spCharHeigth
row17 = row16 + spCharHeigth
row18 = row17 + spCharHeigth
row19 = row18 + spCharHeigth
row20 = row19 + spCharHeigth

spLevelWidth = 24
spLevelHeigth = 24
spLevelSize = spLevelWidth * spLevelHeigth

spPlayer00 = spLevelStart
spPlayer01 = spPlayer00 + spLevelSize
spPlayer02 = spPlayer01 + spLevelSize

spThrust00 = spLevelStart + (10 * spLevelSize)
spLaser00 = spLevelStart + (14 * spLevelSize)
spExplosionfr0 = spLevelStart + (20 * spLevelSize)
spExplosionfr1 = spLevelStart + (21 * spLevelSize)
spExplosionfr2 = spLevelStart + (22 * spLevelSize)
spEnemyLaserGreen = spLevelStart + (13 * spLevelSize)
spEnemyLaserOrange = spLevelStart + (23 * spLevelSize)
;BOSS1
spBoss1part0 = spLevelStart + (30 * spLevelSize)
spBoss1part1 = spLevelStart + (31 * spLevelSize)
spBoss1part2 = spLevelStart + (32 * spLevelSize)
spBoss1part3 = spLevelStart + (40 * spLevelSize)
spBoss1part4 = spLevelStart + (41 * spLevelSize)
spBoss1part5 = spLevelStart + (42 * spLevelSize)

bitmapBank = $36
bitmapStart = $6C000

spCharBank = $20  ; 10k 2 banks
spCharStart = $40000 
spObjectsBank = $22 ;29 k  4 banks
spLevelStart = $44000
tileSetBank =  $26 ; 64k
tileSetStart = $4c000

tileMapBankBankL0 =  $2f ; 11k 2 banks
tileMapStartL0 = $5e000
tileMapBankBankL1  =  $32 ; 2k 1 banks
tileMapStartL1 = $64000

;SPRITE
;spNumberEnemyStart = 10
spEnemy00 = spLevelStart + (5 * spLevelSize)
spEnemy01 = spLevelStart + (6 * spLevelSize)
spEnemy02 = spLevelStart + (7 * spLevelSize)
spEnemy03 = spLevelStart + (8 * spLevelSize)
spEnemy04 = spLevelStart + (15 * spLevelSize)
spEnemy05 = spLevelStart + (16 * spLevelSize)
spEnemy06 = spLevelStart + (17 * spLevelSize)
spEnemy07 = spLevelStart + (18 * spLevelSize)
spEnemy08 = spLevelStart + (25 * spLevelSize)
spEnemy09 = spLevelStart + (26 * spLevelSize)
spEnemy10 = spLevelStart + (27 * spLevelSize)
spEnemy11 = spLevelStart + (28 * spLevelSize)

spHoldStar = spLevelStart + (35 * spLevelSize)
spEnemy13 = spLevelStart + (36 * spLevelSize)
spEnemy14 = spLevelStart + (37 * spLevelSize)
spEnemy15 = spLevelStart + (38 * spLevelSize)

spPlayer1ShipNumber = 63
spPlayer1ThrustNumber = 62
spPlayer1Laser0 = 61
spPlayer1Laser1 = 60
spPlayer1Laser2 = 59

spPlayer1Laser3 = 58
spPlayer1Laser4 = 57
spPlayer1Laser5 = 56

spPlayer1Laser6 = 55
spPlayer1Laser7 = 54
spPlayer1Laser8 = 53

spPlayer1Laser9 = 52
spPlayer1Laser10 = 51
spPlayer1Laser11 = 50

spEnemyNumber00 = 49
spEnemyNumber01 = 48
spEnemyNumber02 = 47
spEnemyNumber03 = 46
spEnemyNumber04 = 45
spEnemyNumber05 = 44
spEnemyNumber06 = 43
spEnemyNumber07 = 42
spEnemyNumber08 = 41
spEnemyNumber09 = 40
spEnemyNumber10 = 39
spEnemyNumber11 = 38

spPowerUp = 37
spGoldStar = 36
spBossNumberExplosion = 35

spEnemyLaserNumber00 = 29
spEnemyLaserNumber01 = 28
spEnemyLaserNumber02 = 27
spEnemyLaserNumber03 = 26
spEnemyLaserNumber04 = 25
spEnemyLaserNumber05 = 24
spEnemyLaserNumber06 = 23
spEnemyLaserNumber07 = 22
spEnemyLaserNumber08 = 21
spEnemyLaserNumber09 = 20
spEnemyLaserNumber10 = 19
spEnemyLaserNumber11 = 18

spScoreNumber0 = 7  
spScoreNumber1 = 6
spScoreNumber2 = 5
spScoreNumber3 = 4
spScoreNumber4 = 3
spScoreNumber5 = 2
spScoreNumber6 = 1
spScoreNumber7 = 0
.endsection

objectInactive = $00
objectActive   = $01
objectCollided = $02
objectGodMode = $fe
objectDisabled = $ff