/*
audio_play_sound(snd_opening, 0, 1);
audio_stop_sound(snd_noncombat);
audio_stop_sound(snd_combat);
audio_stop_sound(snd_boss);
*/
audio_sound_gain(curr_music, 0, 1000);
alarm[0] = 1 * room_speed;
next_music = curr_music;
curr_music = snd_opening;
