/// reactToInputs()
if (stunned || throwing) {
    return 0;
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
    throwing = 1;
    if (mouse_x > x)
        dir = DIR_RIGHT;
    else if (mouse_x < x)
        dir = DIR_LEFT;
        
    has_frisbee = false;
}


