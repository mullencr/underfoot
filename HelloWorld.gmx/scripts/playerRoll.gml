if (stunned)
    return 0;

if (!rolling && key_shift && can_roll) {
    if (collideTerrain(x, y+1)) {
        rolling = true;
        hsp = dashspeed * dir;
        with (obj_snd_player) {
            sndLokiDash();
        }
        can_roll = false;
        alarm[DASH_ALARM] = room_speed * DASH_TIME;
        invincible = true;
    }
}

if (sprite_index == spr_player_roll) {
    if (rolling && image_index == 0) {
        rolling = false;
        invincible = false;
    }
}
