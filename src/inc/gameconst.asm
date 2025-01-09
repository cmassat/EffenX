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

spPlayer00  = spLevelStart
spPlayer01  = spPlayer00 + spLevelSize
spPlayer02  = spPlayer01 + spLevelSize
spStarAddr  = spPlayer02 + spLevelSize
spPowerAddr = spStarAddr + spLevelSize
spThrust00  = spLevelStart + (10 * spLevelSize)
spShieldAddress  = spLevelStart + (11 * spLevelSize)
spLaser00 = spLevelStart + (14 * spLevelSize)
spLaser01 = spLevelStart + (24 * spLevelSize)
spExplosionfr0 = spLevelStart + (20 * spLevelSize)
spExplosionfr1 = spLevelStart + (21 * spLevelSize)
spExplosionfr2 = spLevelStart + (22 * spLevelSize)
spEnemyLaserGreen = spLevelStart + (13 * spLevelSize)
spEnemyLaserOrange = spLevelStart + (23 * spLevelSize)

spMiniBossAddr0 = spLevelStart + (9 * spLevelSize)
spMiniBossAddr1 = spLevelStart + (19 * spLevelSize)

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
spEnemyAddr00 = spLevelStart + (5 * spLevelSize)
spEnemyAddr01 = spLevelStart + (6 * spLevelSize)
spEnemyAddr02 = spLevelStart + (7 * spLevelSize)
spEnemyAddr03 = spLevelStart + (8 * spLevelSize)
spEnemyAddr04 = spLevelStart + (15 * spLevelSize)
spEnemyAddr05 = spLevelStart + (16 * spLevelSize)
spEnemyAddr06 = spLevelStart + (17 * spLevelSize)
spEnemyAddr07 = spLevelStart + (18 * spLevelSize)
spEnemyAddr08 = spLevelStart + (25 * spLevelSize)
spEnemyAddr09 = spLevelStart + (26 * spLevelSize)
spEnemyAddr10 = spLevelStart + (27 * spLevelSize)
spEnemyAddr11 = spLevelStart + (28 * spLevelSize)

spHoldStar = spLevelStart + (35 * spLevelSize)
spEnemy13 = spLevelStart + (36 * spLevelSize)
spEnemy14 = spLevelStart + (37 * spLevelSize)
spEnemy15 = spLevelStart + (38 * spLevelSize)



spHitFlashNumber = 63
spMuzzleFlashNumber = 62

spPlayer1ShipNumber = 61
spPlayer1ShieldNumber = 60
spPlayer1ThrustNumber = 59
spPlayer1Laser0 = 58
spPlayer1Laser1 = 57
spPlayer1Laser2 = 56

spPlayer1Laser3 = 55
spPlayer1Laser4 = 54
spPlayer1Laser5 = 53

spPlayer1Laser6 = 52
spPlayer1Laser7 = 51
spPlayer1Laser8 = 50

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
spEnemyNumber12 = 37
spEnemyNumber13 = 36
spEnemyNumber14 = 35
spEnemyNumber15 = 34


spBossLaserNumber0 = 33
spBossLaserNumber1 = 32
spBossLaserNumber2 = 31

spMiniBossLaserNumber0 = 30
spMiniBossLaserNumber1 = 29
spMiniBossNumber0 = 28
spMiniBossNumber1 = 27

spPowerUpNumber = 26
spGoldStar = 25
spBossNumberExplosion = 24

spEnemyLaserNumber00 = 23
spEnemyLaserNumber01 = 22
spEnemyLaserNumber02 = 21
spEnemyLaserNumber03 = 20
spEnemyLaserNumber04 = 19
spEnemyLaserNumber05 = 18
spEnemyLaserNumber06 = 17
spEnemyLaserNumber07 = 16
spEnemyLaserNumber08 = 15
spEnemyLaserNumber09 = 14
spEnemyLaserNumber10 = 13
spEnemyLaserNumber11 = 12
spEnemyLaserNumber12 = 11
spEnemyLaserNumber13 = 10
spEnemyLaserNumber14 = 9
spEnemyLaserNumber15 = 8

spBossNumber00 = 7
spBossNumber01 = 6
spBossNumber02 = 5
spBossNumber03 = 4
spBossNumber04 = 3
spBossNumber05 = 2
spBossNumber06 = 1
spBossNumber07 = 0

.endsection

objectActive   = $01
objectCollided = $02

objectGodMode = $fd
objectInactive = $0e
objectDisabled = $ff

directionLeft = 1
directionRight = 2
directionUp = 3
directionDown = 4