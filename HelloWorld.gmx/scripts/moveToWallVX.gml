/// moveToWallV(vsp, max)
for (i = 0; i < abs(argument1); i++) {
    if (collideTerrain(x, y +sign(argument0)))
        break;
    
    y += sign(argument0);
}
