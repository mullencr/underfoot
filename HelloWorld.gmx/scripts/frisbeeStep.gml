if (airborne) {
    
    if (collideTerrain(x, y + vsp)) {
        moveToWallV(vsp);
        airborne = false;
        image_speed = 0;
        hsp = 0;
        vsp = 0;
        with (obj_snd_player) {
            sndFrisDmg();
        }
    }
    if (collideTerrain(x + hsp, y)) {
        moveToWallH(hsp);
        airborne = false;
        image_speed = 0;
        hsp = 0;
        vsp = 0;
        with (obj_snd_player) {
            sndFrisDmg();
        }
    }
    // Added by charles
    // If the frisbee hits an enemy, call stun on that enemy.
    inst = instance_place(x, y, obj_en_parent) 
    if (inst != noone) {
        // We have hit an enemy
        stunEnemy(inst);
        airborne = false;
        image_speed = 0;
        hsp = 0;
        vsp = 0;
                with (obj_snd_player) {
            sndFrisDmg();
        }
    }
    
    applyGrav();
} else {
    if (!collideTerrain(x, y + vsp)) {
        applyGrav();
    } else {
        vsp = 0;
    }
}

x += hsp;
y += vsp;
