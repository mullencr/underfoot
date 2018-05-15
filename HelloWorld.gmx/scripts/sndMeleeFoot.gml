if (meleeFtCounter % 6 == 0) {
    audio_play_sound(snd_melee_ft1, 0, 0);
} else if (meleeFtCounter % 6 == 1) {
    audio_play_sound(snd_melee_ft2, 0, 0);
} else if (meleeFtCounter % 6 == 2) {
    audio_play_sound(snd_melee_ft3, 0, 0);
} else if (meleeFtCounter % 6 == 3) {
    audio_play_sound(snd_melee_ft4, 0, 0);
} else if (meleeFtCounter % 6 == 4) {
    audio_play_sound(snd_melee_ft5, 0, 0);
} else {
audio_play_sound(snd_melee_ft6, 0, 0);
} 
meleeFtCounter++;
