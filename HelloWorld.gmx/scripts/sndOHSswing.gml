if (OHSswingCounter % 3 == 0 ) {
    audio_play_sound(snd_ohs_swing1, 0, 0);
} else if (OHSswingCounter % 3 == 1) {
    audio_play_sound(snd_ohs_swing2, 0, 0);
} else if (OHSswingCounter % 3 == 2) {
    audio_play_sound(snd_ohs_swing3, 0, 0);
}
OHSswingCounter++;
