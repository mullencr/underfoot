/// jump()
if (key_jump) { 
    if (collideTerrain(x, y+1)) {
        vsp = key_jump * -jumpspeed;
    } else if (djump_enabled) { // Wall Jump
        if (collideWall(x+1, y)) {
            vsp = key_jump * -jumpspeed;
            hsp = -BOUNCE_SPD;
            dir = DIR_LEFT;
        } else if (collideWall(x-1, y)) {
            vsp = key_jump * -jumpspeed;
            hsp = BOUNCE_SPD;
            dir = DIR_RIGHT;
        }
        
    }
}
