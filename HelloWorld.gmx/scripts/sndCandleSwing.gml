if (candleCounter2 % 3 == 0) {
    audio_play_sound(snd_candle_swing1, 0, 0);
} else if (candleCounter % 3 == 1) {
    audio_play_sound(snd_candle_swing2, 0, 0);
} else {
    audio_play_sound(snd_candle_swing3, 0, 0);
}
candleCounter2++;
