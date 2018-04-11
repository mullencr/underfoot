/// reactToInputs()
move_dir = key_right + key_left;
hsp = move_dir * movespeed

if (inf_frisbees)
    has_frisbee = true;
    
if (mouse_left && has_frisbee) {
    throwing = 1;
    if (mouse_x > x)
        move_dir = 1;
    else if (mouse_x < x)
        move_dir = -1;
        
    has_frisbee = false;
}

if (sprite_index == spr_player_throw) {
    if (throwing && image_index = 0) { // Throwing ends
        throwing = 0;
    } else if (throwing && image_index = 3) {
        fris = instance_create(x + move_dir * 20, y, obj_frisbee);
        fris.airborne = true;
        fris.dir = point_direction(x, y, mouse_x, mouse_y);
        with (fris) {
            initializeFrisSpeed();
        }
    }
}
