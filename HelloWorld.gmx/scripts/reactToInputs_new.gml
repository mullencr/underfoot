/// reactToInputs()
if (stunned || throwing || rolling) {
    return 0;
}

if (key_1 && has_candle) {
    equipped = CANDLE_ID;
}

if (key_2 && has_scim) {
    equipped = OHS_ID;
}

if (key_3 && has_ths) {
    equipped = THS_ID;
}

if (key_right || key_left) {
    if (collideTerrain(x, y+1)) {
        with (obj_snd_player) {
            //sndLokiFoot();
        }
    }
}

if (key_right) {
    dir = DIR_RIGHT;
    hsp += h_accel;
    if (hsp > movespeed) {
        hsp = movespeed;
    } 
} else if (key_left) {    
    dir = DIR_LEFT;
    hsp -= h_accel;
    if (hsp < -movespeed) {
        hsp = -movespeed;
    }
} else { // Apply friction
    if (hsp < 0) {
        hsp += h_decel;
        if (hsp > 0)
            hsp = 0;
    } else if (hsp > 0) {
        hsp -= h_decel;
        if (hsp < 0)
            hsp = 0;
    }
}

if (inf_frisbees)
    has_frisbee = true;
    
if (mouse_left && has_frisbee) {
    throwing = true;
    if (mouse_x > x)
        dir = DIR_RIGHT;
    else if (mouse_x < x)
        dir = DIR_LEFT;
        
    sprite_index = spr_player_throw;
   // has_frisbee = false;
}


