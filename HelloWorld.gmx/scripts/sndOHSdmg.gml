if (OHSdmgCounter % 4 == 0) {
    audio_play_sound(snd_ohs_dmg1, 0, 0);
} else if (OHSdmgCounter % 4 == 1) {
    audio_play_sound(snd_ohs_dmg2, 0, 0);
} else if (OHSdmgCounter % 4 == 2) {
    audio_play_sound(snd_ohs_dmg3, 0, 0);
} else {
    audio_play_sound(snd_ohs_dmg4, 0, 0);
}
OHSdmgCounter++;
