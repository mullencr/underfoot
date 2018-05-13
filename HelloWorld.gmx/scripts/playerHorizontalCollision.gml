/// playerHorizontalCollision()
/*
if (dir == DIR_RIGHT) { // Collide with right stairs
    if (collideStairR(x + hsp, y)) {
        moveToWallVX(-1, move_dir /* 1/sqrt(2));
        //moveToWallHX(hsp, hsp);
    }
} else if (dir == DIR_LEFT) { // Collide with left stairs
    if (collideStairL(x + hsp, y)) {
        moveToWallVX(-1, move_dir /* 1/sqrt(2));
        //moveToWallHX(hsp, hsp);
    }
}
*/
if (in_block) {
    if (collideSolidTerrain(x+hsp, y)) {
        moveToWallH(hsp);
        hsp = 0;
    }
} else if (collideTerrain(x + hsp, y)) {
    inst = instance_place(x + hsp, y, obj_surface_parent);
    moveToWallH(hsp);
    hsp = 0;
    
    /*
    under_switch = (self.bbox_bottom < inst.y) or !inst.fromUnder;
    if (under_switch) {
        moveToWallH(hsp);
        hsp = 0;
    }
    */
} 
