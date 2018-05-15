if (THSswingCounter % 2 == 0) {
    audio_play_sound(snd_ths_swing1, 0, 0);
} else {
    audio_play_sound(snd_ths_swing2, 0, 0);
}
THSswingCounter++;
