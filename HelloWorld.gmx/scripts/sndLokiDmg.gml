if (lokiDmgCounter % 6 == 0) {
    audio_play_sound(snd_loki_dmg1, 0, 0);
} else if (lokiDmgCounter % 6 == 1) {
    audio_play_sound(snd_loki_dmg2, 0, 0);
} else if (lokiDmgCounter % 6 == 2) {
    audio_play_sound(snd_loki_dmg3, 0, 0);
} else if (lokiDmgCounter % 6 == 3) {
    audio_play_sound(snd_loki_dmg4, 0, 0);
} else if (lokiDmgCounter % 6 == 4) {
    audio_play_sound(snd_loki_dmg5, 0, 0);
} else if (lokiDmgCounter % 6 == 5) {
    audio_play_sound(snd_loki_dmg6, 0, 0);
} 
lokiDmgCounter++;
