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



spLevelWidth = 24
spLevelHeigth = 24
spLevelSize = spLevelWidth * spLevelHeigth

spPlayer00 = spLevelStart
spPlayer01 = spPlayer00 + spLevelSize
spPlayer02 = spPlayer01 + spLevelSize
spPlayer03 = spPlayer02 + spLevelSize
spPlayer04 = spPlayer03 + spLevelSize

spThrust00 = spLevelStart + (11 * spLevelSize)
spLaser00 = spLevelStart + (14 * spLevelSize)
spExplosionfr0 = spLevelStart + (20 * spLevelSize)
spExplosionfr1 = spLevelStart + (21 * spLevelSize)
spExplosionfr2 = spLevelStart + (22 * spLevelSize)

bitmapBank = $36
bitmapStart = $6C000

spCharBank = $20  ; 10k 2 banks
spCharStart = $40000 
spObjectsBank = $22 ;29 k  4 banks
spLevelStart = $44000
tileSetBank =  $26 ; 64k
tileSetStart = $4c000

tileMapBankBankL0 =  $2d ; 11k 2 banks
tileMapStartL0 = $5a000
tileMapBankBankL1  =  $2f ; 2k 1 banks
tileMapStartL1 = $5e000

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

spEnemyLaserGreen = spLevelStart + (34 * spLevelSize)
spEnemyLaserOrange = spLevelStart + (44 * spLevelSize)


spPlayer1ShipNumber = 63
spPlayer1ThrustNumber = 62
spPlayer1Laser0 = 2
spPlayer1Laser1 = 3
spPlayer1Laser2 = 4

spEnemyNumber00 = 10
spEnemyNumber01 = 11
spEnemyNumber02 = 12
spEnemyNumber03 = 13
spEnemyNumber04 = 14
spEnemyNumber05 = 15
spEnemyNumber06 = 16
spEnemyNumber07 = 17
spEnemyNumber08 = 18
spEnemyNumber09 = 19
spEnemyNumber10 = 20
spEnemyNumber11 = 21

spEnemyLaserNumber00 = 22
spEnemyLaserNumber01 = 23
spEnemyLaserNumber02 = 24
spEnemyLaserNumber03 = 25
spEnemyLaserNumber04 = 26
spEnemyLaserNumber05 = 27
spEnemyLaserNumber06 = 28
spEnemyLaserNumber07 = 29
spEnemyLaserNumber08 = 30
spEnemyLaserNumber09 = 31
spEnemyLaserNumber10 = 31
spEnemyLaserNumber11 = 33
.endsection

objectInactive = $00
objectActive   = $01
objectCollided = $02
objectGodMode = $fe
objectWait = $ff