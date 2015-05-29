@ECHO OFF

del /q TurtleInTime_MSU1.zip
del /q TurtleInTime_MSU1_Music.7z

mkdir TurtleInTime_MSU1
ucon64 -q --snes --chk tmnt4_msu1.sfc
ucon64 -q --mki=tmnt4_original.sfc tmnt4_msu1.sfc
copy tmnt4_msu1.ips TurtleInTime_MSU1
copy README.txt TurtleInTime_MSU1
copy tmnt4_msu1.msu TurtleInTime_MSU1
copy tmnt4_msu1.xml TurtleInTime_MSU1
copy manifest.bml TurtleInTime_MSU1

"C:\Program Files\7-Zip\7z" a -r TurtleInTime_MSU1.zip TurtleInTime_MSU1

"C:\Program Files\7-Zip\7z" a TurtleInTime_MSU1_Music.7z *.pcm

del /q tmnt4_msu1.ips
rmdir /s /q TurtleInTime_MSU1