if (candleCounter % 3 == 0) {
    audio_play_sound(snd_candle_dmg1, 0, 0);
} else if (candleCounter % 3 == 1) {
    audio_play_sound(snd_candle_dmg2, 0, 0);
} else {
    audio_play_sound(snd_candle_dmg3, 0, 0);
} 
candleCounter++;
