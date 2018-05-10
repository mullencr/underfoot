/// selectPlayerAnimation()
if (move_dir > 0) {
    image_xscale = 0 + abs(image_xscale);
} else if (move_dir < 0) {
    image_xscale = 0 - abs(image_xscale);
}

if (sprite_index == spr_player_throw) {
    if (image_index == 0) { // Throwing ends
        throwing = 0;
    } else if (image_index == 3) {
        fris = instance_create(x + move_dir * 20, y, obj_frisbee);
        fris.airborne = true;
        fris.dir = point_direction(x, y, mouse_x, mouse_y);
        with (fris) {
            initializeFrisSpeed();
        }
    }
}

if (collideTerrain(x, y+1)) {
    if (rolling) {
        sprite_index = spr_player_roll;
    }
    else if (attacking) {
        sprite_index = spr_player_atk;
    } else if (move_dir != 0) {
        sprite_index = spr_player_run;
    } else {
        sprite_index = spr_player_idle;
    }
} else {
    if (rolling) {
        sprite_index = spr_player_roll;
    }
    else if (attacking) {
        sprite_index = spr_player_air_atk;
    } else if (vsp < 0) {
        sprite_index = spr_player_jump;
    } else {
        sprite_index = spr_player_fall;
    }
}

if (throwing) {
    sprite_index = spr_player_throw;
}

if (stunned) {
    sprite_index = spr_player_idle;
    image_index = 0;
}
