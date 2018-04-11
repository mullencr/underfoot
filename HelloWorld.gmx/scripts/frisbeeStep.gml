if (airborne) {
    
    if (collideTerrain(x, y + vsp)) {
        moveToWallV(vsp);
        airborne = false;
        image_speed = 0;
        hsp = 0;
        vsp = 0;
    }
    if (collideTerrain(x + hsp, y)) {
        moveToWallH(hsp);
        airborne = false;
        image_speed = 0;
        hsp = 0;
        vsp = 0;
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
