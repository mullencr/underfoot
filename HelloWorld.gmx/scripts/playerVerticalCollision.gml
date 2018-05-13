/// playerVerticalCollision()
if (collideTerrain(x, y + vsp)) {
    if (vsp < 0) {
        if (place_meeting(x, y, obj_plat_small)) {
            in_block = true;
        }
    } 
    
    if (in_block) {
        if (not place_meeting(x, y, obj_plat_small))
            in_block = false
    } else {
        if (place_meeting(x, y + vsp, obj_plat_small)) {
            moveToWallV(vsp);
            vsp = 0;
        }
    }
    
    if (collideSolidTerrain(x, y+vsp)) {
        moveToWallV(vsp);
        vsp = 0;
    }
    /*
    inst = instance_place(x, y + vsp, obj_surface_parent);
    moveToWallV(vsp);
    vsp = 0;
    with (inst) {
        w = self.y;
        under = (other.bbox_bottom < self.y);
        sub = x + y;
    }
    under_switch = (self.bbox_bottom < inst.y) or !inst.fromUnder;
    if (under_switch) {
        moveToWallV(vsp);
        vsp = 0;
    }
    */
}
