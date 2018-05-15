/// moveToWallHX(hsp, max)
for (i = 0; i < abs(argument1); i++) {
    if (collideTerrain(x + sign(argument0), y))
        break;
    
    x += sign(argument1);
}
