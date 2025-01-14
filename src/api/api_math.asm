.section code 
;a lo_byte
;b hi_byte
;destruct a,x,y

;a lo byte
;x hi byte
addOne
	clc
	adc #1
	pha
	txa
	adc #0
	tax
	pla
	rts

add24
	clc
	adc #24
	pha
	txa
	adc #0
	tax
	pla
	rts

substract1
	sta POINTER_UTIL
	stx POINTER_UTIL + 1

	ldy #0
	lda (POINTER_UTIL), y 
	sec
	sbc #1
	sta (POINTER_UTIL), y 
	iny
	lda (POINTER_UTIL), y 
	sbc #0
	sta (POINTER_UTIL), y 
rts 

; numerator / denominator
mac_divide_8bit .macro
	ldx #0
_div	
	lda m_math_n 
	sbc m_math_d
	sta m_math_n
	bpl _add 
	bra _calc_completed
_add
	inx
	bra _div
_calc_completed
	txa 
.endmacro


fn_multiply_8bit
	sta m_mult_a
	stx m_mult_b
	stz m_mult_result 
	ldy #0
_loop
	lda m_mult_result
	clc 
	adc m_mult_a
	sta m_mult_result
	iny 
	cpy m_mult_b
	bcc _loop 
	lda m_mult_result
	rts 

fn_divide_8bit
	sta m_math_n
	stx m_math_d
	#mac_divide_8bit
	rts
.endsection
subtractMacro .macro number, amount = 1
    lda \number
    sec
    sbc #\amount
    sta \number
    
    lda \number + 1
    sbc #0
    sta \number + 1 
.endMacro

addMacro .macro number, amount = 1
    lda \number
    clc
    adc #\amount
    sta \number
    
    lda \number + 1
    adc #0
    sta \number + 1
.endMacro

add8Macro .macro number, amount = 1
    lda \number
    clc
    adc #\amount
    sta \number
.endMacro

add16Macro .macro number, amount = 1
    lda \number
    clc
    adc #\amount
    sta \number
    
    lda \number + 1
    adc #0
    sta \number + 1
.endMacro
.section variables 
m_math_n
	.byte 0
m_math_d
	.byte 0
m_mult_a
	.byte 0
m_mult_b 
	.byte 0
m_mult_result
	.byte 0
.endsection