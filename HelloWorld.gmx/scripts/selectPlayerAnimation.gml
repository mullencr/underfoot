/// selectPlayerAnimation()
if (dir == DIR_RIGHT) {
    image_xscale = 0 + abs(image_xscale);
} else if (dir == DIR_LEFT) {
    image_xscale = 0 - abs(image_xscale);
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
    }
}

if (collideTerrain(x, y+1)) {
    if (rolling) {
        sprite_index = spr_player_roll;
    }
    else if (attacking) {
        sprite_index = spr_player_atk;
    } else if (hsp != 0) {
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
    sprite_index = spr_player_hurt;
}
