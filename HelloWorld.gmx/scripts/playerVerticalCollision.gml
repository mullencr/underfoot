/// playerVerticalCollision()
if (collideTerrain(x, y + vsp)) {
    inst = instance_place(x, y + vsp, obj_surface_parent);
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
}
