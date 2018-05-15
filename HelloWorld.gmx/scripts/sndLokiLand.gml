if (lokiLandCounter % 3 == 0) {
    audio_play_sound(snd_loki_land1, 0, 0);
} else if (lokiLandCounter % 3 == 1) {
    audio_play_sound(snd_loki_land2, 0, 0);
} else {
    audio_play_sound(snd_loki_land3, 0, 0);
}
lokiLandCounter++;
