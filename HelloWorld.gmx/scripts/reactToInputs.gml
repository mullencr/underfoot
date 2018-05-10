/// reactToInputs()
if (stunned) {
    return 0;
}

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


