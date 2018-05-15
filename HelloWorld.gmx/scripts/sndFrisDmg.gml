if (frisCounter % 2 == 0) {
    audio_play_sound(snd_fris_dmg1, 0, 0);
} else {
    audio_play_sound(snd_fris_dmg2, 0, 0);
}
frisCounter += 1;
