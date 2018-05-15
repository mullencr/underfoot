if (meleeLandCounter % 2 == 0) {
    audio_play_sound(snd_melee_land1, 0, 0);
} else {
    audio_play_sound(snd_melee_land2, 0, 0);
}
meleeLandCounter++;
