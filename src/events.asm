.section code
game
    jsr keyboardTimer
	jsr handleSplash
    jsr handleMenu
    jsr handle_joy_ports
    jsr handleLevelOne

   ; jsr handleCollisionDetect
    jsr handle_psg
    inc v_sync
    jsr debug
    lda v_sync
    cmp #120
    bcs _resetFrameCounter
    rts
_resetFrameCounter
    stz v_sync
    rts
handleEvents
 jsr vgm_update
    
_wait_for_event 
; Peek at the queue to see if anything is pending
    lda		kernel.args.events.pending  ; Negated count
    bpl		_done

    ; Get the next event.
    jsr		kernel.NextEvent
    bcs		_done

    ; Handle the event
    jsr		_dispatch
 _done
        ; Continue until the queue is drained.

    bra		handleEvents
    rts

 _dispatch
   ; Get the event's type
   lda		event.type

   ; Call the appropriate handler
    cmp #kernel.event.key.PRESSED
    beq keyPressed

    cmp #kernel.event.key.RELEASED
    beq keyReleased

    cmp #kernel.event.timer.EXPIRED
    beq handleTimerEvent
   rts

keyPressed
   lda event.key.ascii
   sta mKeyPress
   jsr keyboardAnykey
   jsr keyboardPressed
   rts     ; Anything not handled can be ignored.

keyReleased
    lda event.key.ascii
    sta mKeyRelease
    jsr keyboardReleased
    rts

handleTimerEvent
      ; jsr keyboardTimer
    jsr game
    ;jsr scanKeyBoard
    ;lda #1
    ;sta mSOFSemaphore
    jsr sof_vgm
	stz sof_semaphore
    ;jsr sof_vgm
	;stz sof_semaphore
	jsr setFrameTimer
	rts

setFrameTimer
    lda #0
	sta MMU_IO_CTRL
    lda #kernel.args.timer.FRAMES | kernel.args.timer.QUERY
    sta kernel.args.timer.units

    stz kernel.args.timer.absolute
    lda #1
    sta kernel.args.timer.cookie
    jsr kernel.Clock.SetTimer

    adc #1
    sta kernel.args.timer.absolute

    lda #kernel.args.timer.FRAMES
    sta kernel.args.timer.units

    lda #1
    sta kernel.args.timer.cookie
    jsr kernel.Clock.SetTimer
    rts

;resetKeys
;    stz mKeypress
;    lda #1
;    sta mKeyRelease
;    rts
    
initEvents
    lda #<event
    sta kernel.args.events+0
    lda #>event
    sta kernel.args.events+1
    rts

is_sof
    lda mSOFSemaphore
    cmp #1
    beq _block
    clc
    rts
_block
    sec
    rts
.endsection

event	.dstruct	 kernel.event.event_t

.section variables

mSOFSemaphore
    .byte $00
mKeypress
    .byte $00
mKeyRelease
    .byte $01
v_sync
    .byte 0
sof_semaphore
    .byte 0
.endsection

