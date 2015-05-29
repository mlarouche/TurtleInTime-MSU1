arch snes.cpu

// MSU memory map I/O
constant MSU_STATUS($002000)
constant MSU_ID($002002)
constant MSU_AUDIO_TRACK_LO($002004)
constant MSU_AUDIO_TRACK_HI($002005)
constant MSU_AUDIO_VOLUME($002006)
constant MSU_AUDIO_CONTROL($002007)

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
	constant FULL_VOLUME($60)
} else {
	constant FULL_VOLUME($FF)
}

// **********
// * Macros *
// **********
// seek converts SNES HiROM address to physical address
macro seek(variable offset) {
  origin (offset & $3FFFFF)
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