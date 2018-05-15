if (lokiDeathCounter % 2 == 0) {
    audio_play_sound(snd_loki_death2, 0 ,0);
} else {
    audio_play_sound(snd_loki_death1, 0 , 0);
} 
lokiDeathCounter++;
