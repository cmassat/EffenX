.section code 
;a and x is the address 
;y is line number

set40Col
    pha
    lda #%00000110
    sta $d001
    pla
    rts
writeText
    jsr set40Col
    pha
    lda #2
    sta MMU_IO_CTRL
    tya
    asl a
    tay
    lda mTextColumns, y
    sta POINTER_DST
    iny
    lda mTextColumns, y
    sta POINTER_DST + 1
    pla
    sta POINTER_SRC
    stx POINTER_SRC +1

    ldy #0
 _loop
    lda (POINTER_SRC),y
    beq _end
    sta (POINTER_DST),y
    lda #3
    sta MMU_IO_CTRL
    lda #$30
    sta (POINTER_DST),y
    lda #2
    sta MMU_IO_CTRL
    iny
    bra _loop
_end
    stz MMU_IO_CTRL
    rts
.endsection

.section variables
line00 = $c000
line01 = line00 + 40
line02 = line01 + 40
line03 = line02 + 40
line04 = line03 + 40
line05 = line04 + 40
line06 = line05 + 40
line07 = line06 + 40
line08 = line07 + 40
line09 = line08 + 40
line10 = line09 + 40
line11 = line10 + 40
line12 = line11 + 40
line13 = line12 + 40
line14 = line13 + 40
line15 = line14 + 40
line16 = line15 + 40
line17 = line16 + 40
line18 = line17 + 40
line19 = line18 + 40
line20 = line19 + 40
line21 = line20 + 40
line22 = line21 + 40
line23 = line22 + 40
line24 = line23 + 40
line25 = line24 + 40
line26 = line25 + 40
line27 = line26 + 40
line28 = line27 + 40
line29 = line28 + 40
line30 = line29 + 40
line31 = line30 + 40
line32 = line31 + 40
line33 = line32 + 40
line34 = line33 + 40
line35 = line34 + 40
line36 = line35 + 40
line37 = line36 + 40
line38 = line37 + 40
line39 = line38 + 40
line40 = line39 + 40
line41 = line40 + 40
line42 = line41 + 40
line43 = line42 + 40
line44 = line43 + 40
line45 = line44 + 40
line46 = line45 + 40
line47 = line46 + 40
line48 = line47 + 40
line49 = line48 + 40
line50 = line49 + 40
line51 = line50 + 40
line52 = line51 + 40
line53 = line52 + 40
line54 = line53 + 40
line55 = line54 + 40
line56 = line55 + 40
line57 = line56 + 40
line58 = line57 + 40
line59 = line58 + 40
line60 = line59 + 40

mTextColumns
.word line00
.word line01
.word line02
.word line03
.word line04
.word line05
.word line06
.word line07
.word line08
.word line09
.word line10
.word line11
.word line12
.word line13
.word line14
.word line15
.word line16
.word line17
.word line18
.word line19
.word line20
.word line21
.word line22
.word line23
.word line24
.word line25
.word line26
.word line27
.word line28
.word line29
.word line30
.word line31
.word line32
.word line33
.word line34
.word line35
.word line36
.word line37
.word line38
.word line39
.word line40
.word line41
.word line42
.word line43
.word line44
.word line45
.word line46
.word line47
.word line48
.word line49
.word line50
.word line51
.word line52
.word line53
.word line54
.word line55
.word line56
.word line57
.word line58
.word line59
.word line60

.endsection


