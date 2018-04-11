/// playerVerticalCollision()
if (collideTerrain(x, y + vsp)) {
    moveToWallV(vsp);
    vsp = 0;
}
