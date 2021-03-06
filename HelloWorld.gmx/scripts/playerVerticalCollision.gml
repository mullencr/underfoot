/// playerVerticalCollision()
if (true) {
    if (vsp < 0) {
        if (place_meeting(x, y+vsp, obj_plat_small)) {
            in_block = true;
        }
    } 
    
    if (in_block) {
        if (not place_meeting(x, y+vsp, obj_plat_small) and
            not place_meeting(x, y, obj_plat_small))
            in_block = false;
    } else {
        if (place_meeting(x, y + vsp, obj_plat_small)) {
            moveToWallV(vsp);
            vsp = 0;
            if (!landed) {
                with (obj_snd_player) {
                    sndLokiLand();
                }
                just_landed = true;
            }
            landed = true;
        }
    }
    
    if (collideSolidTerrain(x, y+vsp)) {
        moveToWallV(vsp);
        vsp = 0;
        
        if (!landed) {
            with (obj_snd_player) {
                sndLokiLand();
            }
            just_landed = true;
        }
        landed = true;
    }
    /*
    inst = instance_place(x, y + vsp, obj_surface_parent);
    moveToWallV(vsp);
    vsp = 0;
    with (inst) {
        w = self.y;
        under = (other.bbox_bottom < self.y);
        // The following line is so we can observe "under" in the debugger
        sub = x + y;
    }
    under_switch = (self.bbox_bottom < inst.y) or !inst.fromUnder;
    if (under_switch) {
        moveToWallV(vsp);
        vsp = 0;
    }
    */
}

if (!collideTerrain(x, y+vsp+1))
    landed = false;
