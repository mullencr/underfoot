if (THSdmgCounter % 3 == 0) {
    audio_play_sound(snd_ths_dmg1, 0, 0);
} else if (THSdmgCounter % 3 == 1) {
    audio_play_sound(snd_ths_dmg2, 0, 0);
} else {
    audio_play_sound(snd_ths_dmg3, 0, 0);
}
THSdmgCounter++;
