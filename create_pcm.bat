@ECHO OFF

del *.pcm

wav2msu -o tmnt4_msu1-250.pcm tmnt4_open.wav
wav2msu -o tmnt4_msu1-232.pcm -l 50620 tmnt4_roof.wav
wav2msu -o tmnt4_msu1-244.pcm tmnt4_downtown.wav
wav2msu -o tmnt4_msu1-3.pcm tmnt4_sewarage.wav
wav2msu -o tmnt4_msu1-45.pcm tmnt4_fortress.wav
wav2msu -o tmnt4_msu1-9.pcm tmnt4_dinosaur.wav
wav2msu -o tmnt4_msu1-12.pcm tmnt4_pirate.wav
wav2msu -o tmnt4_msu1-15.pcm tmnt4_train.wav
wav2msu -o tmnt4_msu1-18.pcm tmnt4_highway.wav
wav2msu -o tmnt4_msu1-21.pcm tmnt4_starbase.wav
wav2msu -o tmnt4_msu1-27.pcm tmnt4_lastboss.wav
wav2msu -o tmnt4_msu1-235.pcm tmnt4_battle.wav
wav2msu -o tmnt4_msu1-57.pcm tmnt4_elevator.wav
wav2msu -o tmnt4_msu1-42.pcm tmnt4_staff.wav

