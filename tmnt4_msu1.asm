arch snes.cpu

// MSU memory map I/O
constant MSU_STATUS($2000)
constant MSU_ID($2002)
constant MSU_AUDIO_TRACK_LO($2004)
constant MSU_AUDIO_TRACK_HI($2005)
constant MSU_AUDIO_VOLUME($2006)
constant MSU_AUDIO_CONTROL($2007)

// SPC communication ports
constant SPC_COMM_0($2140)
constant SPC_COMM_1($2141)
constant SPC_COMM_2($2142)
constant SPC_COMM_3($2143)

// MSU_STATUS possible values
constant MSU_STATUS_TRACK_MISSING($8)
constant MSU_STATUS_AUDIO_PLAYING(%00010000)
constant MSU_STATUS_AUDIO_REPEAT(%00100000)
constant MSU_STATUS_AUDIO_BUSY($40)
constant MSU_STATUS_DATA_BUSY(%10000000)

// SNES Multiply register
constant SNES_MUL_OPERAND_A($004202)
constant SNES_MUL_OPERAND_B($004203)
constant SNES_DIV_DIVIDEND_L($004204)
constant SNES_DIV_DIVIDEND_H($004205)
constant SNES_DIV_DIVISOR($004206)
constant SNES_DIV_QUOTIENT_L($004214)
constant SNES_DIV_QUOTIENT_H($004215)
constant SNES_MUL_DIV_RESULT_L($004216)
constant SNES_MUL_DIV_RESULT_H($004217)

// Constants
if {defined EMULATOR_VOLUME} {
	constant FULL_VOLUME($50)
} else {
	constant FULL_VOLUME($FF)
}

// **********
// * Macros *
// **********
// seek converts SNES LoROM address to physical address
macro seek(variable offset) {
  origin ((offset & $7F0000) >> 1) | (offset & $7FFF)
  base offset
}

macro CheckMSUPresence(labelToJump) {
	lda MSU_ID
	cmp.b #'S'
	bne {labelToJump}
}

macro WaitMulResult() {
	nop
	nop
	nop
	nop
}

macro WaitDivResult() {
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
}

// ********
// * Code *
// ********
// Hijack
seek($00835C)
	jsr MSU_SoundEffects
	
seek($009D49)
	jsl MSU_Main

// MSU Code
seek($00F860)
scope MSU_Main: {
	php
	rep #$30
	pha
	phx
	
	sep #$30
	CheckMSUPresence(OriginalCode)
	
	// Set MSU-1 track
	txa
	sta.w MSU_AUDIO_TRACK_LO
	stz MSU_AUDIO_TRACK_HI

IsMSUReady:
	lda.w MSU_STATUS
	and.b #MSU_STATUS_AUDIO_BUSY
	bne IsMSUReady
	
	// Check if the track is missing
	lda.w MSU_STATUS
	and.b #MSU_STATUS_TRACK_MISSING
	bne TrackMissing
	
	// Play the song and add repeat if needed
	jsr TrackNeedLooping
	sta.w MSU_AUDIO_CONTROL
	
	// Set volume
	lda.b #FULL_VOLUME
	sta.w MSU_AUDIO_VOLUME
	
	rep #$30
	plx
	pla
	plp
	rtl
	
TrackMissing:
	stz MSU_AUDIO_CONTROL
	stz MSU_AUDIO_VOLUME
	
OriginalCode:
	rep #$30
	plx
	pla
	plp
	jsl $009D50
	rtl
}

scope TrackNeedLooping: {
	// Open
	cpx #$FA
	beq NoLooping
	// Bad News
	cpx #$00
	beq NoLooping
	// Attack
	cpx #$33
	beq NoLooping
	// Clear
	cpx #$EE
	beq NoLooping
	// Game Over
	cpx #$F1
	beq NoLooping
	// Good news
	cpx #$27
	beq NoLooping
	// Staff
	cpx #$2A
	beq NoLooping
	// Escape
	cpx #$3F
	beq NoLooping
	// Good
	cpx #$42
	beq NoLooping
	lda.b #$03
	rts
NoLooping:
	lda.b #$01
	rts
}

scope MSU_SoundEffects: {
	php
	rep #$20
	pha
	
	sep #$20
	sta SPC_COMM_0
	
	cmp #$FE
	bne Exit
	
	stz MSU_AUDIO_CONTROL
	stz MSU_AUDIO_VOLUME
	
Exit:
	rep #$20
	pla
	plp
	rts
	
}
