@ECHO OFF
del tmnt4_msu1.sfc

copy tmnt4_original.sfc tmnt4_msu1.sfc

set BASS_ARG=
if "%~1" == "emu" set BASS_ARG=-d EMULATOR_VOLUME

bass %BASS_ARG% -o tmnt4_msu1.sfc tmnt4_msu1.asm
bass -d EMULATOR_VOLUME -o tmnt4_msu1_emulator.sfc tmnt4_msu1.asm
