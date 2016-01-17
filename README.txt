Teenage Mutant Ninja Turtle 4 : Turtle in Time MSU-1
Version 1.0
by DarkShock

This hack adds CD quality audio to Turtle in Time using the MSU-1 chip invented by byuu.
The hack has been tested on SD2SNES, bsnes-plus 073.1b and higan 094.
The patched ROM needs to be named tmnt4_msu1.sfc.

Note they are two IPS patches:
- tmnt4_msu1_emulator.ips is the one to use for proper volume in emulators.
- tmnt4_msu1.ips is for the SD2SNES

The music pack can be found here: https://www.mediafire.com/?1awa8p3p5c956td

Original ROM specs:
T.M.N.T. 4
U.S.A.
1048576 Bytes (8.0000 Mb)
Version: 1.0
Checksum: Ok, 0x1683 (calculated) == 0x1683 (internal)
Inverse checksum: Ok, 0xe97c (calculated) == 0xe97c (internal)
Checksum (CRC32): 0x5940bd99

===============
= Using BSNES =
===============
1. Patch the ROM
2. Unzip the .pcm
3. Launch the game

===============
= Using higan =
===============
1. Patch the ROM
2. Launch it using higan
3. Go to %USERPROFILE%\Emulation\Super Famicom\tmnt4_msu1.sfc in Windows Explorer.
4. Copy manifest.bml and the .pcm file there
5. Run the game

====================
= Using on SD2SNES =
====================
Drop the ROM file, tmnt4_msu1.msu and the .pcm files in any folder. (I really suggest creating a folder)
Launch the game and voilà, enjoy !

===========
= Credits =
===========
* DarkShock - ASM hacking & coding, Music editing

See MusicCredits.txt for credits of the remixed music (spoiler alert: it's all (but one) from Shell Shocked OC Remix album)

=========
= Music =
=========
3 = Sewarage
9 = Dinosaur
12 = Pirate
15 = Train
18 = Highway
21 = Starbase
27 = Lastboss
42 = Staff
45 = Fortress
57 = Elevator
60 = Memory
69 = Winner
232 = Roof
235 = Battle
244 = Downtown
250 = Open
253 = Training

=============
= Compiling =
=============
Source is availabe on GitHub: https://github.com/mlarouche/TurtleInTime-MSU1

To compile the hack you need

* bass v14 (http://files.byuu.org/download/bass_v14.tar.xz)
* wav2msu (https://github.com/mlarouche/wav2msu)

To distribute the hack you need

* uCON64 (http://ucon64.sourceforge.net/)
* 7-Zip (http://www.7-zip.org/)

make.bat assemble the patch
create_pcm.bat create the .pcm from the WAV files
distribute.bat distribute the patch
make_all.bat does everything
