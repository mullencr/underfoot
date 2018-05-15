/// selectPlayerAnimation()
if (dir == DIR_RIGHT) {
    image_xscale = 0 + abs(image_xscale);
} else if (dir == DIR_LEFT) {
    image_xscale = 0 - abs(image_xscale);
}

if (sprite_index == spr_player_land) {
    if (image_index == 0) 
        just_landed = false;
    else
        return 0;
}

if (just_landed) {
    sprite_index = spr_player_land;
    just_landed = false;
    return 0;
}

if (sprite_index == spr_player_throw) {
    if (image_index == 0) { // Throwing ends
        throwing = 0;
    } else if (image_index == 3) {
        var fris = instance_create(x + sign(dir) * 25, y, obj_frisbee);
        fris.airborne = true;
        fris.dir = point_direction(x, y, mouse_x, mouse_y);
        with (fris) {
            initializeFrisSpeed();
        }
        
        has_frisbee = false;
        return 0;
    } else {
        return 0;
    }
}

if (collideTerrain(x, y+1)) {
    if (rolling) {
        sprite_index = spr_player_roll;
    }
    else if (attacking) {
        sprite_index = spr_player_atk;
    } else if (hsp != 0) {
        if (hsp == abs(movespeed))
            sprite_index = spr_player_sprint;
        else
            sprite_index = spr_player_run;
            
        if (image_index == 1 || image_index == 3 || image_index == 5) {
            with (obj_snd_player) {
                sndLokiFoot();
            }
        }
    } else {
        sprite_index = spr_player_idle;
    }
} else {
    if (rolling) {
        sprite_index = spr_player_roll;
    }
    else if (attacking) {
        sprite_index = spr_player_air_atk;
    } else if (vsp < -APEX_CONST) {
        sprite_index = spr_player_jump;
    } else if (vsp > APEX_CONST) {
        sprite_index = spr_player_fall;
    } else {
        sprite_index = spr_player_apex;
    }
}

if (throwing) {
    sprite_index = spr_player_throw;
}

if (stunned) {
    sprite_index = spr_player_hurt;
}
