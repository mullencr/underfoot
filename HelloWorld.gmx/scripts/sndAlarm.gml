audio_stop_sound(snd_opening);
audio_stop_sound(snd_combat);
audio_stop_sound(snd_noncombat);
audio_stop_sound(snd_boss);
audio_stop_sound(snd_boss_hallway);
audio_play_sound(curr_music, 0, 1);
audio_sound_gain(curr_music, 0, 0);
audio_sound_gain(curr_music, 1, 3000);
